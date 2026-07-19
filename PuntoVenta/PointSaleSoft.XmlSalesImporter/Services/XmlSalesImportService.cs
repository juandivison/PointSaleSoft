using System.Data;
using FirebirdSql.Data.FirebirdClient;
using PointSaleSoft.XmlSalesImporter.Configuration;
using PointSaleSoft.XmlSalesImporter.Data;
using PointSaleSoft.XmlSalesImporter.Models;

namespace PointSaleSoft.XmlSalesImporter.Services;

public sealed class XmlSalesImportService
{
    private readonly ImportOptions _options;
    private readonly FirebirdSalesRepository _repository;

    public XmlSalesImportService(ImportOptions options, FirebirdSalesRepository repository)
    {
        _options = options;
        _repository = repository;
    }

    public List<ImportResult> Preflight(IReadOnlyList<EcfInvoice> invoices)
    {
        List<ImportResult> results = [];
        using FbConnection connection = _repository.OpenConnection();
        _repository.ValidateDependencies(connection);
        if (invoices.Any(x => x.IsCash))
            _repository.ValidateCashPaymentSeriesStrategy(connection);

        foreach (EcfInvoice invoice in invoices)
        {
            ImportResult result = CreateResult(invoice, ImportStatus.Validated);
            try
            {
                if (_repository.ENcfExists(connection, null, invoice.ENcf))
                    throw new InvalidOperationException(
                        $"El e-NCF {invoice.ENcf} ya existe en NCF_ASIGNADOS.");

                foreach (EcfItem item in invoice.Items)
                {
                    int productCode = int.Parse(item.CodigoProducto);
                    ProductLookup product = _repository.GetProduct(
                        connection, null, productCode, item.PrecioUnitario);

                    if (!product.Exists && _options.RequireProductInInventory)
                        throw new InvalidOperationException(
                            $"Línea {item.NumeroLinea}: no existe el producto {productCode} en INVENTARIO_PRODUCTO.");

                    foreach (string warning in product.Warnings)
                        result.Warnings.Add($"Producto {productCode}: {warning}");
                }

                result.Message = "Validación XML y base de datos completada.";
            }
            catch (Exception ex)
            {
                result.Status = ImportStatus.Failed;
                result.Message = ex.Message;
                if (_options.StopOnError)
                {
                    results.Add(result);
                    break;
                }
            }

            results.Add(result);
        }

        return results;
    }

    public List<ImportResult> Import(IReadOnlyList<EcfInvoice> invoices)
    {
        List<ImportResult> results = [];
        using FbConnection connection = _repository.OpenConnection();
        _repository.ValidateDependencies(connection);
        if (invoices.Any(x => x.IsCash))
            _repository.ValidateCashPaymentSeriesStrategy(connection);

        foreach (EcfInvoice invoice in invoices)
        {
            ImportResult result = CreateResult(invoice, ImportStatus.Imported);
            using FbTransaction transaction = connection.BeginTransaction(
                IsolationLevel.ReadCommitted);

            try
            {
                if (_repository.ENcfExists(connection, transaction, invoice.ENcf))
                    throw new InvalidOperationException(
                        $"El e-NCF {invoice.ENcf} ya existe en NCF_ASIGNADOS.");

                Dictionary<int, ProductLookup> products = [];
                foreach (EcfItem item in invoice.Items)
                {
                    int productCode = int.Parse(item.CodigoProducto);
                    ProductLookup product = _repository.GetProduct(
                        connection, transaction, productCode, item.PrecioUnitario);

                    if (!product.Exists && _options.RequireProductInInventory)
                        throw new InvalidOperationException(
                            $"Línea {item.NumeroLinea}: no existe el producto {productCode} en INVENTARIO_PRODUCTO.");

                    products[item.NumeroLinea] = product;
                    foreach (string warning in product.Warnings)
                        result.Warnings.Add($"Producto {productCode}: {warning}");
                }

                int ncfSeries = _repository.InsertNcfAssigned(connection, transaction, invoice);
                int? invoiceNumber = invoice.IsCredit
                    ? _repository.GetNextInvoiceNumber(connection, transaction)
                    : null;

                int saleNumber = _repository.InsertSalesMaster(
                    connection, transaction, invoice, invoiceNumber, ncfSeries);

                result.InvoiceNumber = invoiceNumber;
                result.GeneratedTransactionNumber = saleNumber;

                foreach (EcfItem item in invoice.Items)
                {
                    _repository.InsertSalesDetail(connection, transaction,
                        invoice, item, products[item.NumeroLinea], saleNumber, invoiceNumber);
                }

                if (invoice.IsCredit)
                    _repository.PostCredit(
                        connection,
                        transaction,
                        invoice,
                        saleNumber,
                        invoiceNumber!.Value);
                else
                    _repository.InsertCashPayment(connection, transaction, invoice, saleNumber);

                if (_options.ValidatePersistedSale)
                {
                    PersistedValidationResult validation =
                        _repository.ValidatePersistedSale(connection, transaction, saleNumber);
                    if (!validation.IsValid)
                        throw new InvalidOperationException(
                            "La validación persistida rechazó la venta: " + validation.Message);
                }

                if (invoice.OriginalTransactionNumber.HasValue &&
                    invoice.OriginalTransactionNumber.Value != saleNumber)
                {
                    result.Warnings.Add(
                        $"TRN del archivo={invoice.OriginalTransactionNumber.Value}; " +
                        $"VENTAS_MAST.NUMERO generado={saleNumber}. La carga continúa con el valor del generador.");
                }

                transaction.Commit();
                result.Message = "Venta importada y confirmada.";
            }
            catch (Exception ex)
            {
                try
                {
                    transaction.Rollback();
                }
                catch
                {
                    // Conserva el error original.
                }

                result.Status = ImportStatus.Failed;
                result.Message = ex.Message;
                results.Add(result);

                if (_options.StopOnError)
                    break;

                continue;
            }

            results.Add(result);
        }

        return results;
    }

    private static ImportResult CreateResult(EcfInvoice invoice, ImportStatus status) => new()
    {
        FileName = invoice.FileName,
        ENcf = invoice.ENcf,
        OriginalTransactionNumber = invoice.OriginalTransactionNumber,
        Amount = invoice.ValorPagar,
        PaymentType = invoice.IsCredit ? "Crédito" : "Contado",
        Status = status
    };
}
