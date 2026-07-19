using System.Data;
using System.Globalization;
using System.Text.RegularExpressions;
using FirebirdSql.Data.FirebirdClient;
using PointSaleSoft.XmlSalesImporter.Configuration;
using PointSaleSoft.XmlSalesImporter.Models;
using PointSaleSoft.XmlSalesImporter.Utilities;

namespace PointSaleSoft.XmlSalesImporter.Data;

public sealed partial class FirebirdSalesRepository
{
    private const string DetallePagosGenerator = "GEN_SERIE_DET_PAGO";
    private const int SecuenciaUserCode = 4;

    private readonly ImportOptions _options;
    private InventoryColumns? _inventoryColumns;

    public FirebirdSalesRepository(ImportOptions options)
    {
        _options = options;
    }

    public FbConnection OpenConnection()
    {
        FbConnection connection = new(_options.ConnectionString);
        connection.Open();
        return connection;
    }

    public void ValidateDependencies(FbConnection connection)
    {
        string[] procedures =
        [
            "PROC_INS_VENTAS_MAST",
            "PROC_INS_VENTAS_DET",
            "PROC_ECF_POST_CXC",
            "PROC_SECUENCIA"
        ];

        if (_options.ValidatePersistedSale)
            procedures = [.. procedures, "PROC_VALIDA_VENTA_PERSISTIDA"];

        foreach (string procedure in procedures)
        {
            int count = Convert.ToInt32(ExecuteScalar(connection, null,
                "SELECT COUNT(*) FROM RDB$PROCEDURES WHERE TRIM(RDB$PROCEDURE_NAME) = @NAME",
                ("NAME", FbDbType.VarChar, procedure)), CultureInfo.InvariantCulture);

            if (count != 1)
                throw new InvalidOperationException($"No se encontró el procedimiento {procedure}.");
        }

        string[] tables =
        [
            "NCF_ASIGNADOS", "VENTAS_MAST", "VENTAS_DET", "DETALLE_PAGOS",
            "INVENTARIO_PRODUCTO", "PRECIO_UNIDADSURTIDORA", "SECUENCIA"
        ];

        foreach (string table in tables)
        {
            int count = Convert.ToInt32(ExecuteScalar(connection, null,
                "SELECT COUNT(*) FROM RDB$RELATIONS WHERE TRIM(RDB$RELATION_NAME) = @NAME",
                ("NAME", FbDbType.VarChar, table)), CultureInfo.InvariantCulture);

            if (count != 1)
                throw new InvalidOperationException($"No se encontró la tabla {table}.");
        }

        _inventoryColumns = ResolveInventoryColumns(connection);
        ValidateCreditCustomer(connection);
    }

    public void ValidateCashPaymentSeriesStrategy(FbConnection connection)
    {
        int count = Convert.ToInt32(ExecuteScalar(connection, null,
            "SELECT COUNT(*) FROM RDB$GENERATORS " +
            "WHERE TRIM(RDB$GENERATOR_NAME) = @NAME",
            ("NAME", FbDbType.VarChar, DetallePagosGenerator)),
            CultureInfo.InvariantCulture);

        if (count != 1)
            throw new InvalidOperationException(
                $"No existe el generador requerido para DETALLE_PAGOS.SERIE: {DetallePagosGenerator}.");

        int procedureCount = Convert.ToInt32(ExecuteScalar(connection, null,
            "SELECT COUNT(*) FROM RDB$PROCEDURES " +
            "WHERE TRIM(RDB$PROCEDURE_NAME) = 'PROC_SECUENCIA'"),
            CultureInfo.InvariantCulture);

        if (procedureCount != 1)
            throw new InvalidOperationException(
                "No existe el procedimiento PROC_SECUENCIA requerido para generar NUMERO_DOC_PAGO.");
    }

    public bool ENcfExists(FbConnection connection, FbTransaction? transaction, string eNcf)
    {
        int count = Convert.ToInt32(ExecuteScalar(connection, transaction,
            "SELECT COUNT(*) FROM NCF_ASIGNADOS WHERE NUMERO_NCF = @ENCF",
            ("ENCF", FbDbType.VarChar, eNcf)), CultureInfo.InvariantCulture);
        return count > 0;
    }

    public ProductLookup GetProduct(FbConnection connection, FbTransaction? transaction,
        int productCode, decimal unitPrice)
    {
        _inventoryColumns ??= ResolveInventoryColumns(connection);
        InventoryColumns columns = _inventoryColumns;

        string barcodeExpression = columns.BarcodeColumn is null
            ? "CAST('' AS VARCHAR(40))"
            : $"COALESCE({columns.BarcodeColumn}, '')";
        string costExpression = columns.CostColumn is null
            ? "CAST(0 AS NUMERIC(15,2))"
            : $"COALESCE({columns.CostColumn}, 0)";

        string sql = $"SELECT FIRST 1 {barcodeExpression}, {costExpression} " +
                     "FROM INVENTARIO_PRODUCTO " +
                     "WHERE CODIGO = @CODIGO AND CIA_KEY = @CIA_KEY";

        string barcode = string.Empty;
        decimal purchasePrice = 0m;
        bool exists;

        using (FbCommand command = CreateCommand(connection, transaction, sql))
        {
            Add(command, "CODIGO", FbDbType.Integer, productCode);
            Add(command, "CIA_KEY", FbDbType.Integer, _options.CompanyKey);
            using FbDataReader reader = command.ExecuteReader();
            exists = reader.Read();
            if (exists)
            {
                barcode = reader.IsDBNull(0) ? string.Empty : Convert.ToString(reader.GetValue(0))?.Trim() ?? string.Empty;
                purchasePrice = reader.IsDBNull(1) ? 0m : Convert.ToDecimal(reader.GetValue(1), CultureInfo.InvariantCulture);
            }
        }

        decimal? p1 = null;
        decimal? p2 = null;
        decimal? p3 = null;
        decimal? p4 = null;

        using (FbCommand command = CreateCommand(connection, transaction,
                   "SELECT FIRST 1 PRECIOVENTA1, PRECIOVENTA2, PRECIOVENTA3, PRECIOVENTA4 " +
                   "FROM PRECIO_UNIDADSURTIDORA WHERE COD_PRODUCTO = @CODIGO"))
        {
            Add(command, "CODIGO", FbDbType.Integer, productCode);
            using FbDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                p1 = ReadNullableDecimal(reader, 0);
                p2 = ReadNullableDecimal(reader, 1);
                p3 = ReadNullableDecimal(reader, 2);
                p4 = ReadNullableDecimal(reader, 3);
            }
        }

        ProductLookup result = new()
        {
            ProductCode = productCode,
            Exists = exists,
            Barcode = barcode,
            PurchasePrice = purchasePrice,
            PriceLevel = ResolvePriceLevel(unitPrice, p1, p2, p3, p4)
        };

        if (columns.BarcodeColumn is null)
            result.Warnings.Add("No se encontró una columna de código de barra; se usará vacío.");
        if (columns.CostColumn is null)
            result.Warnings.Add("No se encontró una columna de costo; PRECIO_COMPRA será cero.");
        if (result.PriceLevel == 5)
            result.Warnings.Add($"Precio {unitPrice:N2} fuera de los niveles 1-4; se asignará nivel 5.");

        return result;
    }

    public int InsertNcfAssigned(FbConnection connection, FbTransaction transaction, EcfInvoice invoice)
    {
        int series = GetGeneratorValue(connection, transaction, "GEN_SERIE_NCF_ASIG");
        string typeNcf = invoice.ENcf.Substring(1, 2);

        const string sql = @"
            INSERT INTO NCF_ASIGNADOS
            (
              SERIE, TIPO_NCF, NUMERO_NCF, FECHA, MONTO, STATUS,
              CODIGO_USUARIO, FECHA_INSERT, DGII_STATUS, FECHA_INTENTO,
              FECHA_ESTADO, REINTENTOS, BLOQUEADO, RECHAZADO_POR_NOSOTROS
            )
            VALUES
            (
              @SERIE, @TIPO_NCF, @NUMERO_NCF, @FECHA, @MONTO, 'A',
              @CODIGO_USUARIO, @FECHA_INSERT, 'ACEPTADO', @FECHA_INTENTO,
              @FECHA_ESTADO, 1, 0, 0
            )
            ";

        using FbCommand command = CreateCommand(connection, transaction, sql);
        Add(command, "SERIE", FbDbType.Integer, series);
        Add(command, "TIPO_NCF", FbDbType.VarChar, typeNcf);
        Add(command, "NUMERO_NCF", FbDbType.VarChar, invoice.ENcf);
        Add(command, "FECHA", FbDbType.TimeStamp, invoice.FechaEmision);
        Add(command, "MONTO", FbDbType.Decimal, invoice.MontoPago);
        Add(command, "CODIGO_USUARIO", FbDbType.Integer, _options.UserCode);
        Add(command, "FECHA_INSERT", FbDbType.TimeStamp, invoice.FechaHoraFirma);
        Add(command, "FECHA_INTENTO", FbDbType.TimeStamp, invoice.FechaHoraFirma);
        Add(command, "FECHA_ESTADO", FbDbType.TimeStamp, invoice.FechaHoraFirma);
        command.ExecuteNonQuery();

        return series;
    }

    public int GetNextInvoiceNumber(FbConnection connection, FbTransaction transaction) =>
        GetGeneratorValue(connection, transaction, "GEN_NUM_FACTURA");

    private string GetNextCashPaymentDocumentNumber(
        FbConnection connection,
        FbTransaction transaction)
    {
        const string sql = @"
            SELECT SECUENCIA
              FROM PROC_SECUENCIA(@TIPO, @COD_USUARIO)
            ";

        using FbCommand command = CreateCommand(connection, transaction, sql);
        Add(command, "TIPO", FbDbType.Integer, 1);
        Add(command, "COD_USUARIO", FbDbType.Integer, SecuenciaUserCode);

        object? value = command.ExecuteScalar();
        if (value is null || value == DBNull.Value)
            throw new InvalidOperationException(
                $"PROC_SECUENCIA(1, {SecuenciaUserCode}) no retornó NUMERO_DOC_PAGO.");

        int sequence = Convert.ToInt32(value, CultureInfo.InvariantCulture);
        if (sequence <= 0)
            throw new InvalidOperationException(
                $"PROC_SECUENCIA retornó una secuencia inválida: {sequence}.");

        string paymentDocumentNumber =
            sequence.ToString(CultureInfo.InvariantCulture);

        if (paymentDocumentNumber.Length > 20)
            throw new InvalidOperationException(
                "La secuencia de pago excede los 20 caracteres permitidos por NUMERO_DOC_PAGO.");

        return paymentDocumentNumber;
    }

    public int InsertSalesMaster(FbConnection connection, FbTransaction transaction,
        EcfInvoice invoice, int? invoiceNumber, int ncfAssignedSeries)
    {
        const string sql = @"
            SELECT NUMERO_TRNS
              FROM PROC_INS_VENTAS_MAST
              (
                @FECHA, @CIA_KEY, @CODIGO_CTE, @CODIGO_VENDEDOR, @FORMA_PAGO,
                @OBSERVACION, @MONEDA, @VALOR_TOTAL_DET, @STATUS, @FECHA_IN,
                @IN_POR, @FECHA_MOD, @MOD_POR, @NUMERO_FACTURA,
                @NUMERO_DOC_PAGO, @SERIE_NCF_ASIGNADO, @MONTO_BRUTO,
                @PORC_DESCUENTO, @MONTO_DESCUENTO, @MONTO_PAGADO,
                @MONTO_CAMBIO, @MONTO_TOTAL_ITBIS, @MONTO_INICIAL,
                @NOMBRE_CLIENTE_GENERAL, @MONTODESCGASTOSADMIN,
                @MONTODESCITBISGASTOSADMIN, @MONTODESCTRANSP,
                @MONTODESCDIRTECNICA, @MONTODESCITBISDIRTECNICA,
                @MONTODESCIMPREVISTO, @MONTODESCITBISIMPREVISTO,
                @COMENTARIO, @COTIZACION_ORIGEN, @REFERENCIACTE,
                @MONTO_RECARGO, @TIPONCFIFISCAL, @MONTO_EXONERADO_ITBIS,
                @NIF_IMPRESO, @PROPINA, @PORCPROPINALEGAL, @PROPINALEGAL,
                @TICKET_ID, @VENTAARS, @FECHAINICIAPOLIZA, @TIPO_AFILIADO,
                @IDNUMERODVEH, @TIPO_INGRESO
              )
            ";

        using FbCommand command = CreateCommand(connection, transaction, sql);
        int customerCode = invoice.IsCredit ? _options.CreditCustomerCode : 0;
        int? sellerCode = null;
        decimal paid = invoice.IsCash ? invoice.MontoPago : 0m;
        decimal gross = DecimalMath.Round2(invoice.Items.Sum(x => x.MontoItem));
        string user = _options.UserCode.ToString(CultureInfo.InvariantCulture);
        string observation = invoice.IsCredit ? "Venta a Credito" : "CONTADO";
        string comment = Truncate(invoice.FileName, 80);
        string? paymentDocumentNumber = invoice.IsCash
            ? GetNextCashPaymentDocumentNumber(connection, transaction)
            : null;

        Add(command, "FECHA", FbDbType.TimeStamp, invoice.FechaEmision);
        Add(command, "CIA_KEY", FbDbType.Integer, _options.CompanyKey);
        Add(command, "CODIGO_CTE", FbDbType.Integer, customerCode);
        Add(command, "CODIGO_VENDEDOR", FbDbType.Integer, sellerCode);
        Add(command, "FORMA_PAGO", FbDbType.SmallInt, invoice.IsCredit ? 7 : 1);
        Add(command, "OBSERVACION", FbDbType.VarChar, observation);
        Add(command, "MONEDA", FbDbType.Char, _options.Currency);
        Add(command, "VALOR_TOTAL_DET", FbDbType.Decimal, invoice.ValorPagar);
        Add(command, "STATUS", FbDbType.Char, "A");
        Add(command, "FECHA_IN", FbDbType.TimeStamp, invoice.FechaHoraFirma);
        Add(command, "IN_POR", FbDbType.VarChar, user);
        Add(command, "FECHA_MOD", FbDbType.TimeStamp, invoice.FechaHoraFirma);
        Add(command, "MOD_POR", FbDbType.VarChar, user);
        Add(command, "NUMERO_FACTURA", FbDbType.Integer, invoiceNumber);
        Add(command, "NUMERO_DOC_PAGO", FbDbType.VarChar, paymentDocumentNumber);
        Add(command, "SERIE_NCF_ASIGNADO", FbDbType.Integer, ncfAssignedSeries);
        Add(command, "MONTO_BRUTO", FbDbType.Decimal, gross);
        Add(command, "PORC_DESCUENTO", FbDbType.Integer, 0);
        Add(command, "MONTO_DESCUENTO", FbDbType.Decimal, 0m);
        Add(command, "MONTO_PAGADO", FbDbType.Decimal, paid);
        Add(command, "MONTO_CAMBIO", FbDbType.Decimal, 0m);
        Add(command, "MONTO_TOTAL_ITBIS", FbDbType.Decimal, invoice.TotalItbis);
        Add(command, "MONTO_INICIAL", FbDbType.Decimal, 0m);
        Add(command, "NOMBRE_CLIENTE_GENERAL", FbDbType.VarChar, null);
        Add(command, "MONTODESCGASTOSADMIN", FbDbType.Decimal, 0m);
        Add(command, "MONTODESCITBISGASTOSADMIN", FbDbType.Decimal, 0m);
        Add(command, "MONTODESCTRANSP", FbDbType.Decimal, 0m);
        Add(command, "MONTODESCDIRTECNICA", FbDbType.Decimal, 0m);
        Add(command, "MONTODESCITBISDIRTECNICA", FbDbType.Decimal, 0m);
        Add(command, "MONTODESCIMPREVISTO", FbDbType.Decimal, 0m);
        Add(command, "MONTODESCITBISIMPREVISTO", FbDbType.Decimal, 0m);
        Add(command, "COMENTARIO", FbDbType.VarChar, comment);
        Add(command, "COTIZACION_ORIGEN", FbDbType.Integer, null);
        Add(command, "REFERENCIACTE", FbDbType.VarChar, invoice.ENcf);
        Add(command, "MONTO_RECARGO", FbDbType.Decimal, 0m);
        Add(command, "TIPONCFIFISCAL", FbDbType.Integer, 2);
        Add(command, "MONTO_EXONERADO_ITBIS", FbDbType.Decimal, 0m);
        Add(command, "NIF_IMPRESO", FbDbType.SmallInt, 0);
        Add(command, "PROPINA", FbDbType.Decimal, 0m);
        Add(command, "PORCPROPINALEGAL", FbDbType.Decimal, 0m);
        Add(command, "PROPINALEGAL", FbDbType.Decimal, 0m);
        Add(command, "TICKET_ID", FbDbType.Integer, null);
        Add(command, "VENTAARS", FbDbType.SmallInt, 0);
        Add(command, "FECHAINICIAPOLIZA", FbDbType.TimeStamp, null);
        Add(command, "TIPO_AFILIADO", FbDbType.SmallInt, null);
        Add(command, "IDNUMERODVEH", FbDbType.Integer, null);
        Add(command, "TIPO_INGRESO", FbDbType.Integer, invoice.TipoIngreso);

        object? value = command.ExecuteScalar();
        int saleNumber = Convert.ToInt32(value, CultureInfo.InvariantCulture);

        NormalizeImportedSalesMaster(
            connection,
            transaction,
            saleNumber,
            customerCode,
            invoiceNumber,
            paymentDocumentNumber,
            observation);

        return saleNumber;
    }

    private void NormalizeImportedSalesMaster(
        FbConnection connection,
        FbTransaction transaction,
        int saleNumber,
        int customerCode,
        int? invoiceNumber,
        string? paymentDocumentNumber,
        string observation)
    {
        const string sql = @"
            UPDATE VENTAS_MAST
               SET OBSERVACION = @OBSERVACION,
                   CODIGO_CTE = @CODIGO_CTE,
                   COD_USR_CAJA = @COD_USR_CAJA,
                   CODIGO_VENDEDOR = NULL,
                   TIPONCFIFISCAL = 2,
                   NUMERO_FACTURA = @NUMERO_FACTURA,
                   NUMERO_DOC_PAGO = @NUMERO_DOC_PAGO
             WHERE NUMERO = @NUMERO
            ";

        using FbCommand command = CreateCommand(connection, transaction, sql);
        Add(command, "OBSERVACION", FbDbType.VarChar, observation);
        Add(command, "CODIGO_CTE", FbDbType.Integer, customerCode);
        Add(command, "COD_USR_CAJA", FbDbType.Integer, _options.UserCode);
        Add(command, "NUMERO_FACTURA", FbDbType.Integer, invoiceNumber);
        Add(command, "NUMERO_DOC_PAGO", FbDbType.VarChar, paymentDocumentNumber);
        Add(command, "NUMERO", FbDbType.Integer, saleNumber);

        int affected = command.ExecuteNonQuery();
        if (affected != 1)
            throw new InvalidOperationException(
                $"No fue posible normalizar VENTAS_MAST.NUMERO={saleNumber}.");
    }

    public void InsertSalesDetail(FbConnection connection, FbTransaction transaction,
        EcfInvoice invoice, EcfItem item, ProductLookup product,
        int saleNumber, int? invoiceNumber)
    {
        const string sql = @"
            EXECUTE PROCEDURE PROC_INS_VENTAS_DET
            (
              @NUMERO, @CODIGO_PROD, @CODIGO_BARRA, @DESCRIPCION,
              @CANTIDAD, @PRECIO, @PORC_DESC_DET, @ITBI_DET,
              @VALOR_SERVICIO_DET, @VALOR_TOTAL_DET, @NUM_FACTURA,
              @STATUS_DET, @FECHA_IN, @IN_POR, @FECHA_MOD, @MOD_POR,
              @CANT_REGRESO, @CANT_PROMO, @MONTO_DIETA, @MONTO_AJUSTE,
              @SERIE_PROD, @TIPO_UNIDAD, @ITBIS_EXENTO, @TIPO_VENTA,
              @DESCRIPCIONPRODUCTO, @PRECIO_COMPRA, @PORC_DESC_ITEM,
              @MONTO_DESC_ITEM, @ITBIS_FISCAL_DET, @IDTASAITBIS,
              @MONTOIBISRECARGO, @MONEDA, @MONTO_TASA, @CANT_VIAJES,
              @DC_ITBIS_CLD, @TC_MONTOITBISRECARGO_GLB,
              @TC_MONTOITBISRECARGO_ITM, @NUM_CONDUCE_CTE, @NUM_IDENT,
              @FICHA_VEH, @LOT_NUM, @CODIGO_VENDEDOR, @LEVEL_PRECIO_VENTA
            )
            ";

        TaxRule tax = TaxRule.FromIndicadorFacturacion(item.IndicadorFacturacion);
        decimal saleTax = tax.CalculateTax(item.MontoItem);
        string user = _options.UserCode.ToString(CultureInfo.InvariantCulture);

        using FbCommand command = CreateCommand(connection, transaction, sql);
        Add(command, "NUMERO", FbDbType.Integer, saleNumber);
        Add(command, "CODIGO_PROD", FbDbType.VarChar, item.CodigoProducto);
        Add(command, "CODIGO_BARRA", FbDbType.VarChar, Truncate(product.Barcode, 20));
        Add(command, "DESCRIPCION", FbDbType.VarChar, Truncate(item.Descripcion, 80));
        Add(command, "CANTIDAD", FbDbType.Decimal, item.Cantidad);
        Add(command, "PRECIO", FbDbType.Double, Convert.ToDouble(item.PrecioUnitario));
        Add(command, "PORC_DESC_DET", FbDbType.Double, 0d);
        Add(command, "ITBI_DET", FbDbType.Double, Convert.ToDouble(saleTax));
        // PointSaleSoft utiliza VALOR_SERVICIO_DET como monto bruto persistido
        // de la línea, tanto para bienes como para servicios. En este lote no
        // existen descuentos por ítem, por lo que debe ser igual al total de
        // la línea contenido en el XML.
        Add(command, "VALOR_SERVICIO_DET", FbDbType.Decimal, item.MontoItem);
        Add(command, "VALOR_TOTAL_DET", FbDbType.Decimal, item.MontoItem);
        Add(command, "NUM_FACTURA", FbDbType.Double,
            invoiceNumber.HasValue ? Convert.ToDouble(invoiceNumber.Value) : null);
        Add(command, "STATUS_DET", FbDbType.Char, "A");
        Add(command, "FECHA_IN", FbDbType.TimeStamp, invoice.FechaHoraFirma);
        Add(command, "IN_POR", FbDbType.VarChar, user);
        Add(command, "FECHA_MOD", FbDbType.TimeStamp, invoice.FechaHoraFirma);
        Add(command, "MOD_POR", FbDbType.VarChar, user);
        Add(command, "CANT_REGRESO", FbDbType.Decimal, 0m);
        Add(command, "CANT_PROMO", FbDbType.Decimal, 0m);
        Add(command, "MONTO_DIETA", FbDbType.Decimal, 0m);
        Add(command, "MONTO_AJUSTE", FbDbType.Decimal, 0m);
        Add(command, "SERIE_PROD", FbDbType.VarChar, null);
        Add(command, "TIPO_UNIDAD", FbDbType.Integer, 1);
        Add(command, "ITBIS_EXENTO", FbDbType.SmallInt, tax.IsExempt ? 1 : 0);
        Add(command, "TIPO_VENTA", FbDbType.SmallInt, 0);
        Add(command, "DESCRIPCIONPRODUCTO", FbDbType.VarChar, item.Descripcion);
        Add(command, "PRECIO_COMPRA", FbDbType.Decimal, product.PurchasePrice);
        Add(command, "PORC_DESC_ITEM", FbDbType.Decimal, 0m);
        Add(command, "MONTO_DESC_ITEM", FbDbType.Decimal, 0m);
        Add(command, "ITBIS_FISCAL_DET", FbDbType.Decimal, saleTax);
        Add(command, "IDTASAITBIS", FbDbType.Integer, tax.TaxRateId);
        Add(command, "MONTOIBISRECARGO", FbDbType.Decimal, 0m);
        Add(command, "MONEDA", FbDbType.Char, _options.Currency);
        Add(command, "MONTO_TASA", FbDbType.Decimal, 1m);
        Add(command, "CANT_VIAJES", FbDbType.Decimal, 0m);
        Add(command, "DC_ITBIS_CLD", FbDbType.Decimal, 0m);
        Add(command, "TC_MONTOITBISRECARGO_GLB", FbDbType.Decimal, 0m);
        Add(command, "TC_MONTOITBISRECARGO_ITM", FbDbType.Decimal, 0m);
        Add(command, "NUM_CONDUCE_CTE", FbDbType.VarChar, null);
        Add(command, "NUM_IDENT", FbDbType.VarChar, null);
        Add(command, "FICHA_VEH", FbDbType.Integer, null);
        Add(command, "LOT_NUM", FbDbType.Integer, null);
        Add(command, "CODIGO_VENDEDOR", FbDbType.Integer, null);
        Add(command, "LEVEL_PRECIO_VENTA", FbDbType.SmallInt, product.PriceLevel);
        command.ExecuteNonQuery();
    }

    public void InsertCashPayment(FbConnection connection, FbTransaction transaction,
        EcfInvoice invoice, int saleNumber)
    {
        int series = GetGeneratorValue(
            connection, transaction, DetallePagosGenerator);

        const string sql = @"
            INSERT INTO DETALLE_PAGOS
            (
              SERIE, FECHA, MONTO_PAGADO, TIPO, TIPO_PAGO,
              SERIE_TRN, AREA_TRANS, GLBNUMVTAPOS
            )
            VALUES
            (
              @SERIE, @FECHA, @MONTO_PAGADO, 1, 1,
              @SERIE_TRN, 1, @GLBNUMVTAPOS
            )
            ";

        using FbCommand command = CreateCommand(connection, transaction, sql);
        Add(command, "SERIE", FbDbType.Integer, series);
        Add(command, "FECHA", FbDbType.TimeStamp, invoice.FechaEmision);
        Add(command, "MONTO_PAGADO", FbDbType.Decimal, invoice.MontoPago);
        Add(command, "SERIE_TRN", FbDbType.Integer, saleNumber);
        Add(command, "GLBNUMVTAPOS", FbDbType.Integer, saleNumber);
        command.ExecuteNonQuery();
    }

    public void PostCredit(FbConnection connection, FbTransaction transaction,
        EcfInvoice invoice, int saleNumber, int invoiceNumber)
    {
        const string sql = @"
            SELECT O_SERIE_FACTURA, O_NUMERO_FACT, O_SERIE_TRANS_CXC
              FROM PROC_ECF_POST_CXC
              (
                @P_FECHA, @P_FECHA_VENCE, @P_DESCRIPCION,
                @P_CODIGO_USUARIO, @P_CODIGO_CTE, @P_MONTO,
                @P_NUMERO_FACT, @P_NUMERO_TRN_VTA, @P_MONEDA,
                @P_CODIGO_VENDEDOR, @P_TIPO_FACT, @P_TIPO_DOC,
                @P_TIPO_TRANF, @P_TIPO_SERV
              )
            ";

        using FbCommand command = CreateCommand(connection, transaction, sql);
        Add(command, "P_FECHA", FbDbType.TimeStamp, invoice.FechaEmision);
        Add(command, "P_FECHA_VENCE", FbDbType.TimeStamp,
            invoice.FechaLimitePago ?? invoice.FechaEmision);
        Add(command, "P_DESCRIPCION", FbDbType.VarChar, "Venta");
        Add(command, "P_CODIGO_USUARIO", FbDbType.Integer, _options.UserCode);
        Add(command, "P_CODIGO_CTE", FbDbType.Integer, _options.CreditCustomerCode);
        Add(command, "P_MONTO", FbDbType.Decimal, invoice.ValorPagar);
        Add(command, "P_NUMERO_FACT", FbDbType.Integer, invoiceNumber);
        Add(command, "P_NUMERO_TRN_VTA", FbDbType.Integer, saleNumber);
        Add(command, "P_MONEDA", FbDbType.VarChar, _options.Currency);
        Add(command, "P_CODIGO_VENDEDOR", FbDbType.Integer, 0);
        Add(command, "P_TIPO_FACT", FbDbType.SmallInt, 2);
        Add(command, "P_TIPO_DOC", FbDbType.SmallInt, 1);
        Add(command, "P_TIPO_TRANF", FbDbType.SmallInt, 1);
        Add(command, "P_TIPO_SERV", FbDbType.SmallInt, 2);
        using FbDataReader reader = command.ExecuteReader();
        if (!reader.Read())
            throw new InvalidOperationException("PROC_ECF_POST_CXC no retornó resultados.");
    }

    public PersistedValidationResult ValidatePersistedSale(FbConnection connection,
        FbTransaction transaction, int saleNumber)
    {
        const string sql = @"
            SELECT VALIDA, MENSAJE
              FROM PROC_VALIDA_VENTA_PERSISTIDA(@P_NUMERO)
            ";

        using FbCommand command = CreateCommand(connection, transaction, sql);
        Add(command, "P_NUMERO", FbDbType.Integer, saleNumber);
        using FbDataReader reader = command.ExecuteReader();
        if (!reader.Read())
            return new PersistedValidationResult
            {
                IsValid = false,
                Message = "PROC_VALIDA_VENTA_PERSISTIDA no retornó resultados."
            };

        int valid = reader.IsDBNull(0) ? 0 : Convert.ToInt32(reader.GetValue(0), CultureInfo.InvariantCulture);
        string message = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        return new PersistedValidationResult { IsValid = valid == 1, Message = message };
    }

    private void ValidateCreditCustomer(FbConnection connection)
    {
        int count = Convert.ToInt32(ExecuteScalar(connection, null,
            "SELECT COUNT(*) FROM CLIENTES WHERE CODIGO_CTE = @CODIGO",
            ("CODIGO", FbDbType.Integer, _options.CreditCustomerCode)),
            CultureInfo.InvariantCulture);

        if (count != 1)
            throw new InvalidOperationException(
                $"El cliente de crédito {_options.CreditCustomerCode} no existe o está duplicado.");
    }

    private InventoryColumns ResolveInventoryColumns(FbConnection connection)
    {
        HashSet<string> fields = [];
        using FbCommand command = CreateCommand(connection, null,
            "SELECT TRIM(RDB$FIELD_NAME) FROM RDB$RELATION_FIELDS " +
            "WHERE TRIM(RDB$RELATION_NAME) = 'INVENTARIO_PRODUCTO'");
        using FbDataReader reader = command.ExecuteReader();
        while (reader.Read())
            fields.Add(reader.GetString(0).Trim().ToUpperInvariant());

        string? barcode = FirstExisting(fields, "CODIGO_BARRA", "CODIGO_TEXTO");
        string? cost = FirstExisting(fields,
            "PRECIO_COMPRA", "ULTIMO_COSTO", "PRECIO_COSTO", "COSTO");

        return new InventoryColumns(barcode, cost);
    }

    private int ResolvePriceLevel(decimal xmlPrice,
        decimal? p1, decimal? p2, decimal? p3, decimal? p4)
    {
        decimal?[] prices = [p1, p2, p3, p4];
        for (int i = 0; i < prices.Length; i++)
        {
            if (prices[i].HasValue &&
                DecimalMath.EqualsWithin(prices[i]!.Value, xmlPrice, _options.PriceTolerance))
                return i + 1;
        }
        return 5;
    }

    private static int GetGeneratorValue(FbConnection connection, FbTransaction transaction,
        string generator)
    {
        generator = NormalizeIdentifier(generator);
        using FbCommand command = CreateCommand(connection, transaction,
            $"SELECT GEN_ID({generator}, 1) FROM RDB$DATABASE");
        return Convert.ToInt32(command.ExecuteScalar(), CultureInfo.InvariantCulture);
    }

    private static object ExecuteScalar(FbConnection connection, FbTransaction? transaction,
        string sql, params (string Name, FbDbType Type, object? Value)[] parameters)
    {
        using FbCommand command = CreateCommand(connection, transaction, sql);
        foreach ((string name, FbDbType type, object? value) in parameters)
            Add(command, name, type, value);
        return command.ExecuteScalar() ?? 0;
    }

    private static FbCommand CreateCommand(FbConnection connection,
        FbTransaction? transaction, string sql)
    {
        FbCommand command = connection.CreateCommand();
        command.CommandText = sql;
        command.Transaction = transaction;
        command.CommandType = CommandType.Text;
        command.CommandTimeout = 120;
        return command;
    }

    private static void Add(FbCommand command, string name, FbDbType type, object? value)
    {
        FbParameter parameter = command.Parameters.Add(name, type);
        parameter.Value = value ?? DBNull.Value;
    }

    private static decimal? ReadNullableDecimal(FbDataReader reader, int ordinal) =>
        reader.IsDBNull(ordinal)
            ? null
            : Convert.ToDecimal(reader.GetValue(ordinal), CultureInfo.InvariantCulture);

    private static string? FirstExisting(HashSet<string> fields, params string[] candidates) =>
        candidates.FirstOrDefault(fields.Contains);

    private static string Truncate(string value, int maxLength) =>
        value.Length <= maxLength ? value : value[..maxLength];

    private static string NormalizeIdentifier(string identifier)
    {
        identifier = identifier.Trim().ToUpperInvariant();
        if (!IdentifierPattern().IsMatch(identifier))
            throw new InvalidOperationException($"Identificador Firebird inválido: {identifier}");
        return identifier;
    }

    private sealed record InventoryColumns(string? BarcodeColumn, string? CostColumn);

    [GeneratedRegex(@"^[A-Z][A-Z0-9_$]*$")]
    private static partial Regex IdentifierPattern();
}
