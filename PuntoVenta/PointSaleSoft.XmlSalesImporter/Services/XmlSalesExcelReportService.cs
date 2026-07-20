using System.Text.RegularExpressions;
using ClosedXML.Excel;
using FirebirdSql.Data.FirebirdClient;
using PointSaleSoft.XmlSalesImporter.Configuration;
using PointSaleSoft.XmlSalesImporter.Data;
using PointSaleSoft.XmlSalesImporter.Models;
using PointSaleSoft.XmlSalesImporter.Parsing;
using PointSaleSoft.XmlSalesImporter.Utilities;

namespace PointSaleSoft.XmlSalesImporter.Services;

public sealed class XmlSalesExcelReportService
{
    private const int HeaderRow = 4;
    private const int FirstDataRow = HeaderRow + 1;
    private const int ColumnCount = 17;

    private readonly ImportOptions _options;
    private readonly EcfXmlReader _reader;
    private readonly FirebirdSalesRepository _repository;

    public XmlSalesExcelReportService(
        ImportOptions options,
        EcfXmlReader reader,
        FirebirdSalesRepository repository)
    {
        _options = options;
        _reader = reader;
        _repository = repository;
    }

    public SalesReportResult Generate()
    {
        if (!_options.ReportStartDate.HasValue || !_options.ReportEndDate.HasValue)
            throw new InvalidOperationException("El rango de fechas del reporte no está definido.");

        DateTime startDate = _options.ReportStartDate.Value.Date;
        DateTime endDate = _options.ReportEndDate.Value.Date;
        string xmlFolder = Path.GetFullPath(
            _options.XmlFolder,
            Directory.GetCurrentDirectory());

        if (!Directory.Exists(xmlFolder))
            throw new DirectoryNotFoundException($"No existe la carpeta XML: {xmlFolder}");

        SearchOption searchOption = _options.ReportSearchSubdirectories
            ? SearchOption.AllDirectories
            : SearchOption.TopDirectoryOnly;

        List<string> warnings = [];

        Console.WriteLine("Cargando documentos e-CF activos de PointSaleSoft...");

        List<PersistedSaleReportData> persistedSales;
        using (FbConnection connection = _repository.OpenConnection())
        {
            _repository.ValidateReportDependencies(connection);
            persistedSales = _repository.GetPersistedSalesForReportRange(
                connection,
                startDate,
                endDate);
        }

        if (persistedSales.Count == 0)
        {
            throw new InvalidOperationException(
                $"No se encontraron documentos e-CF activos en PointSaleSoft entre " +
                $"{startDate:dd/MM/yyyy} y {endDate:dd/MM/yyyy}.");
        }

        PersistedSalesLookup persistedLookup = new(persistedSales);
        Dictionary<int, EcfInvoice> xmlByTransaction = [];
        Dictionary<int, string> xmlIssueByTransaction = [];

        Console.WriteLine($"Documentos POS cargados en memoria: {persistedSales.Count:N0}");
        Console.WriteLine("Revisando nombres de XML firmados...");

        int filesScanned = 0;
        int candidateFiles = 0;
        int xmlFilesOpened = 0;
        int unrecognizedFileNames = 0;

        IEnumerable<string> files = Directory
            .EnumerateFiles(xmlFolder, "*.xml", searchOption)
            .Where(IsSignedXmlFile);

        foreach (string file in files)
        {
            filesScanned++;

            if (filesScanned % 10000 == 0)
            {
                Console.WriteLine(
                    $"  Nombres revisados: {filesScanned:N0}; " +
                    $"candidatos del período: {candidateFiles:N0}; " +
                    $"XML abiertos: {xmlFilesOpened:N0}");
            }

            if (!_reader.TryReadFileIdentity(file, out EcfFileIdentity? identity) ||
                identity is null)
            {
                unrecognizedFileNames++;
                continue;
            }

            PersistedSaleReportData? candidate;
            try
            {
                candidate = persistedLookup.Resolve(identity);
            }
            catch (Exception ex)
            {
                warnings.Add($"{identity.FileName}: {ex.Message}");
                continue;
            }

            // El nombre no corresponde a ningún TRN/e-NCF activo del período.
            // No se abre el XML.
            if (candidate is null)
                continue;

            candidateFiles++;
            xmlFilesOpened++;

            try
            {
                EcfInvoice invoice = _reader.Read(file);

                if (!invoice.HasSignatureNode)
                {
                    SetXmlIssue(
                        xmlIssueByTransaction,
                        candidate.TransactionNumber,
                        "XML SIN FIRMA");
                    warnings.Add(
                        $"{identity.FileName}: contiene el nombre de un XML firmado, " +
                        "pero no contiene el nodo Signature.");
                    continue;
                }

                PersistedSaleReportData? resolved = persistedLookup.Resolve(invoice);
                if (resolved is null)
                {
                    SetXmlIssue(
                        xmlIssueByTransaction,
                        candidate.TransactionNumber,
                        "XML NO RELACIONADO");
                    warnings.Add(
                        $"{invoice.ENcf}: el contenido no pudo relacionarse con un " +
                        "documento POS activo del período.");
                    continue;
                }

                if (resolved.TransactionNumber != candidate.TransactionNumber)
                {
                    SetXmlIssue(
                        xmlIssueByTransaction,
                        candidate.TransactionNumber,
                        "NOMBRE Y XML NO COINCIDEN");
                    warnings.Add(
                        $"{identity.FileName}: el nombre apunta al TRN " +
                        $"{candidate.TransactionNumber}, pero el contenido apunta al TRN " +
                        $"{resolved.TransactionNumber}.");
                    continue;
                }

                if (xmlByTransaction.ContainsKey(resolved.TransactionNumber))
                {
                    SetXmlIssue(
                        xmlIssueByTransaction,
                        resolved.TransactionNumber,
                        "XML DUPLICADO");
                    warnings.Add(
                        $"TRN {resolved.TransactionNumber}: se encontró más de un XML firmado.");
                    continue;
                }

                xmlByTransaction.Add(resolved.TransactionNumber, invoice);
            }
            catch (Exception ex)
            {
                SetXmlIssue(
                    xmlIssueByTransaction,
                    candidate.TransactionNumber,
                    "ERROR AL LEER XML");
                warnings.Add($"{Path.GetFileName(file)}: {ex.Message}");
            }
        }

        if (filesScanned == 0)
        {
            throw new InvalidOperationException(
                $"No se encontraron archivos XML firmados en {xmlFolder}.");
        }

        if (unrecognizedFileNames > 0)
        {
            warnings.Add(
                $"{unrecognizedFileNames:N0} archivos firmados no siguieron el patrón " +
                "E<tipo>_<secuencia>TRN<numero> y se omitieron sin abrirlos.");
        }

        List<SalesReportRow> rows = persistedSales
            .Select(persisted =>
            {
                xmlByTransaction.TryGetValue(
                    persisted.TransactionNumber,
                    out EcfInvoice? invoice);
                xmlIssueByTransaction.TryGetValue(
                    persisted.TransactionNumber,
                    out string? xmlIssue);

                SalesReportRow row = invoice is null
                    ? CreateMissingXmlRow(persisted, xmlIssue)
                    : CreateMatchedRow(persisted, invoice, xmlIssue);

                AddRowWarnings(row, persisted, warnings);
                return row;
            })
            .OrderBy(x => x.SaleDate)
            .ThenBy(x => x.TransactionNumber)
            .ToList();

        string outputPath = _options.ResolveReportOutputPath();
        string? outputDirectory = Path.GetDirectoryName(outputPath);
        if (!string.IsNullOrWhiteSpace(outputDirectory))
            Directory.CreateDirectory(outputDirectory);

        WriteWorkbook(rows, startDate, endDate, xmlFolder, outputPath);

        return new SalesReportResult
        {
            OutputPath = outputPath,
            FilesScanned = filesScanned,
            CandidateFiles = candidateFiles,
            XmlFilesOpened = xmlFilesOpened,
            DatabaseSalesLoaded = persistedSales.Count,
            SalesIncluded = rows.Count,
            SalesWithoutSignedXml = rows.Count(x => !x.HasSignedXml),
            SalesWithDifferences = rows.Count(x =>
                x.HasSignedXml &&
                !string.Equals(x.ComparisonStatus, "OK", StringComparison.Ordinal)),
            TotalXmlSales = DecimalMath.Round2(rows.Sum(x => x.XmlSaleAmount ?? 0m)),
            TotalPosSales = DecimalMath.Round2(rows.Sum(x => x.PosSaleAmount)),
            TotalXmlPayments = DecimalMath.Round2(rows.Sum(x => x.XmlPaymentAmount ?? 0m)),
            TotalPosPayments = DecimalMath.Round2(rows.Sum(x => x.PosPaymentAmount ?? 0m)),
            Warnings = warnings
        };
    }

    private sealed class PersistedSalesLookup
    {
        private readonly Dictionary<string, PersistedSaleReportData> _byENcf =
            new(StringComparer.OrdinalIgnoreCase);
        private readonly Dictionary<int, PersistedSaleReportData> _byTransaction = [];

        public PersistedSalesLookup(IEnumerable<PersistedSaleReportData> sales)
        {
            foreach (PersistedSaleReportData sale in sales)
            {
                if (!_byTransaction.TryAdd(sale.TransactionNumber, sale))
                {
                    throw new InvalidOperationException(
                        $"El TRN {sale.TransactionNumber} está duplicado en la consulta del período.");
                }

                string eNcf = NormalizeENcf(sale.ENcf);
                if (string.IsNullOrWhiteSpace(eNcf))
                {
                    throw new InvalidOperationException(
                        $"El TRN {sale.TransactionNumber} no tiene e-NCF en NCF_ASIGNADOS.");
                }

                if (_byENcf.TryGetValue(eNcf, out PersistedSaleReportData? existing) &&
                    existing.TransactionNumber != sale.TransactionNumber)
                {
                    throw new InvalidOperationException(
                        $"El e-NCF {eNcf} está relacionado con más de una venta activa.");
                }

                _byENcf[eNcf] = sale;
            }
        }

        public PersistedSaleReportData? Resolve(EcfFileIdentity identity)
        {
            _byENcf.TryGetValue(NormalizeENcf(identity.ENcf), out PersistedSaleReportData? byENcf);
            _byTransaction.TryGetValue(identity.TransactionNumber, out PersistedSaleReportData? byTrn);
            return ResolveConsistent(byENcf, byTrn, identity.FileName);
        }

        public PersistedSaleReportData? Resolve(EcfInvoice invoice)
        {
            _byENcf.TryGetValue(NormalizeENcf(invoice.ENcf), out PersistedSaleReportData? byENcf);

            PersistedSaleReportData? byTrn = null;
            if (invoice.OriginalTransactionNumber.HasValue)
            {
                _byTransaction.TryGetValue(
                    invoice.OriginalTransactionNumber.Value,
                    out byTrn);
            }

            return ResolveConsistent(byENcf, byTrn, invoice.FileName);
        }

        private static PersistedSaleReportData? ResolveConsistent(
            PersistedSaleReportData? byENcf,
            PersistedSaleReportData? byTrn,
            string source)
        {
            if (byENcf is not null &&
                byTrn is not null &&
                byENcf.TransactionNumber != byTrn.TransactionNumber)
            {
                throw new InvalidOperationException(
                    $"{source}: el e-NCF y el TRN identifican ventas diferentes.");
            }

            return byENcf ?? byTrn;
        }

        private static string NormalizeENcf(string? value) =>
            value?.Trim().ToUpperInvariant() ?? string.Empty;
    }

    private SalesReportRow CreateMatchedRow(
        PersistedSaleReportData persisted,
        EcfInvoice invoice,
        string? xmlIssue)
    {
        bool isCreditNote = IsCreditNote(persisted);
        decimal sign = isCreditNote ? -1m : 1m;
        bool paymentComparable = HasEffectivePayment(persisted);

        decimal detail18 = 0m;
        decimal detail16 = 0m;
        decimal detailExempt = 0m;
        decimal detailOther = 0m;

        foreach (EcfItem item in invoice.Items)
        {
            switch (item.IndicadorFacturacion)
            {
                case 1:
                    detail18 += item.MontoItem;
                    break;
                case 2:
                    detail16 += item.MontoItem;
                    break;
                case 3:
                case 4:
                    detailExempt += item.MontoItem;
                    break;
                default:
                    detailOther += item.MontoItem;
                    break;
            }
        }

        decimal xmlSaleAmount = SignedAmount(invoice.MontoTotal, sign);
        decimal posSaleAmount = SignedAmount(persisted.SaleAmount, sign);
        decimal? xmlPaymentAmount = paymentComparable && invoice.PaymentForms.Count > 0
            ? SignedAmount(invoice.MontoPago, sign)
            : null;
        decimal? posPaymentAmount = paymentComparable
            ? SignedAmount(persisted.PaymentAmount, sign)
            : null;

        string comparisonStatus = ResolveComparisonStatus(
            persisted.ENcf,
            invoice.ENcf,
            xmlSaleAmount,
            posSaleAmount,
            xmlPaymentAmount,
            posPaymentAmount,
            paymentComparable);

        return new SalesReportRow
        {
            TransactionNumber = persisted.TransactionNumber,
            XmlTransactionNumber = invoice.OriginalTransactionNumber,
            SaleDate = persisted.SaleDate.Date,
            XmlSaleDate = invoice.FechaEmision.Date,
            SignatureDateTime = invoice.FechaHoraFirma,
            DocumentType = isCreditNote ? "NOTA DE CREDITO" : "VENTA",
            PaymentMethod = ResolvePaymentMethod(persisted),
            ENcf = persisted.ENcf,
            ReferenceENcf = persisted.ReferenceENcf,
            XmlStatus = string.IsNullOrWhiteSpace(xmlIssue) ? "ENCONTRADO" : xmlIssue,
            XmlSaleAmount = xmlSaleAmount,
            PosSaleAmount = posSaleAmount,
            XmlPaymentAmount = xmlPaymentAmount,
            PosPaymentAmount = posPaymentAmount,
            ComparisonStatus = comparisonStatus,
            DetailAmount18 = SignedAmount(detail18, sign),
            DetailAmount16 = SignedAmount(detail16, sign),
            DetailAmountExempt = SignedAmount(detailExempt, sign),
            DetailAmountOther = SignedAmount(detailOther, sign),
            DetailAmountTotal = SignedAmount(invoice.Items.Sum(x => x.MontoItem), sign),
            IsCreditNote = isCreditNote,
            HasSignedXml = true,
            SourceFile = invoice.FileName
        };
    }

    private static SalesReportRow CreateMissingXmlRow(
        PersistedSaleReportData persisted,
        string? xmlIssue)
    {
        bool isCreditNote = IsCreditNote(persisted);
        decimal sign = isCreditNote ? -1m : 1m;
        bool hasPayment = HasEffectivePayment(persisted);
        string status = string.IsNullOrWhiteSpace(xmlIssue)
            ? "SIN XML FIRMADO"
            : xmlIssue;

        return new SalesReportRow
        {
            TransactionNumber = persisted.TransactionNumber,
            XmlTransactionNumber = null,
            SaleDate = persisted.SaleDate.Date,
            XmlSaleDate = null,
            SignatureDateTime = null,
            DocumentType = isCreditNote ? "NOTA DE CREDITO" : "VENTA",
            PaymentMethod = ResolvePaymentMethod(persisted),
            ENcf = persisted.ENcf,
            ReferenceENcf = persisted.ReferenceENcf,
            XmlStatus = status,
            XmlSaleAmount = null,
            PosSaleAmount = SignedAmount(persisted.SaleAmount, sign),
            XmlPaymentAmount = null,
            PosPaymentAmount = hasPayment
                ? SignedAmount(persisted.PaymentAmount, sign)
                : null,
            ComparisonStatus = status,
            DetailAmount18 = null,
            DetailAmount16 = null,
            DetailAmountExempt = null,
            DetailAmountOther = null,
            DetailAmountTotal = null,
            IsCreditNote = isCreditNote,
            HasSignedXml = false,
            SourceFile = null
        };
    }

    private void AddRowWarnings(
        SalesReportRow row,
        PersistedSaleReportData persisted,
        ICollection<string> warnings)
    {
        if (!row.HasSignedXml)
        {
            warnings.Add(
                $"TRN {row.TransactionNumber} / {row.ENcf}: {row.XmlStatus}.");
            return;
        }

        if (row.DetailAmountTotal.HasValue && row.XmlSaleAmount.HasValue &&
            !DecimalMath.EqualsWithin(
                row.DetailAmountTotal.Value,
                row.XmlSaleAmount.Value,
                _options.TotalTolerance))
        {
            warnings.Add(
                $"{row.ENcf}: suma de detalles XML={row.DetailAmountTotal.Value:N2}; " +
                $"MontoTotal XML={row.XmlSaleAmount.Value:N2}.");
        }

        if (row.XmlTransactionNumber.HasValue &&
            row.XmlTransactionNumber.Value != persisted.TransactionNumber)
        {
            warnings.Add(
                $"{row.ENcf}: TRN del nombre={row.XmlTransactionNumber.Value}; " +
                $"TRN registrado en POS={persisted.TransactionNumber}.");
        }

        if (row.XmlSaleDate.HasValue &&
            row.XmlSaleDate.Value.Date != persisted.SaleDate.Date)
        {
            warnings.Add(
                $"{row.ENcf}: FechaEmision XML={row.XmlSaleDate.Value:dd/MM/yyyy}; " +
                $"VENTAS_MAST.FECHA={persisted.SaleDate:dd/MM/yyyy}.");
        }

        if (!string.Equals(row.ComparisonStatus, "OK", StringComparison.Ordinal))
        {
            warnings.Add(
                $"{row.ENcf}: {row.ComparisonStatus}. " +
                $"Venta XML={FormatNullable(row.XmlSaleAmount)}; " +
                $"Venta POS={row.PosSaleAmount:N2}; " +
                $"Pago XML={FormatNullable(row.XmlPaymentAmount)}; " +
                $"Pago POS={FormatNullable(row.PosPaymentAmount)}.");
        }
    }

    private string ResolveComparisonStatus(
        string posENcf,
        string xmlENcf,
        decimal xmlSaleAmount,
        decimal posSaleAmount,
        decimal? xmlPaymentAmount,
        decimal? posPaymentAmount,
        bool paymentComparable)
    {
        if (!string.Equals(
                posENcf.Trim(),
                xmlENcf.Trim(),
                StringComparison.OrdinalIgnoreCase))
        {
            return "DIFIERE e-NCF";
        }

        bool saleMatches = DecimalMath.EqualsWithin(
            xmlSaleAmount,
            posSaleAmount,
            _options.TotalTolerance);

        bool paymentMatches = true;
        if (paymentComparable)
        {
            paymentMatches = xmlPaymentAmount.HasValue &&
                posPaymentAmount.HasValue &&
                DecimalMath.EqualsWithin(
                    xmlPaymentAmount.Value,
                    posPaymentAmount.Value,
                    _options.TotalTolerance);
        }

        if (saleMatches && paymentMatches)
            return "OK";
        if (!saleMatches && !paymentMatches)
            return "DIFIERE VENTA Y PAGO";
        if (!saleMatches)
            return "DIFIERE MONTO VENTA";
        return "DIFIERE MONTO PAGO";
    }

    private static bool IsCreditNote(PersistedSaleReportData sale) =>
        string.Equals(sale.EcfType, "34", StringComparison.OrdinalIgnoreCase) ||
        sale.ENcf.StartsWith("E34", StringComparison.OrdinalIgnoreCase);

    private static bool HasEffectivePayment(PersistedSaleReportData sale) =>
        !IsCreditNote(sale) && sale.PaymentForm is not (7 or 8);

    private static string ResolvePaymentMethod(PersistedSaleReportData sale)
    {
        if (IsCreditNote(sale))
            return "NO APLICA";

        return sale.PaymentForm switch
        {
            1 => "CONTADO",
            7 or 8 => "CREDITO",
            6 => "DEVOLUCION",
            _ => $"FORMA {sale.PaymentForm}"
        };
    }

    private static void SetXmlIssue(
        IDictionary<int, string> issues,
        int transactionNumber,
        string issue)
    {
        if (!issues.ContainsKey(transactionNumber))
            issues[transactionNumber] = issue;
    }

    private static decimal SignedAmount(decimal value, decimal sign) =>
        DecimalMath.Round2(sign < 0m ? -Math.Abs(value) : Math.Abs(value));

    private static string FormatNullable(decimal? value) =>
        value.HasValue ? value.Value.ToString("N2") : "N/A";

    private static void WriteWorkbook(
        IReadOnlyList<SalesReportRow> rows,
        DateTime startDate,
        DateTime endDate,
        string xmlFolder,
        string outputPath)
    {
        using XLWorkbook workbook = new();
        IXLWorksheet worksheet = workbook.Worksheets.Add("Resumen");

        worksheet.Cell(1, 1).Value = "RESUMEN XML VS POINTSALESOFT";
        worksheet.Range(1, 1, 1, ColumnCount).Merge();
        worksheet.Cell(2, 1).Value =
            $"Período POS: {startDate:dd/MM/yyyy} hasta {endDate:dd/MM/yyyy}";
        worksheet.Range(2, 1, 2, ColumnCount).Merge();
        worksheet.Cell(3, 1).Value = $"Origen XML: {xmlFolder}";
        worksheet.Range(3, 1, 3, ColumnCount).Merge();

        string[] headers =
        [
            "TRN",
            "FECHA POS",
            "TIPO",
            "FORMA DE PAGO",
            "e-NCF",
            "e-NCF REFERENCIA",
            "ESTADO XML",
            "MONTO VENTA XML",
            "MONTO VENTA POS",
            "MONTO PAGO XML",
            "MONTO PAGADO POS",
            "COMPARACION",
            "DETALLE 18%",
            "DETALLE 16%",
            "DETALLE EXENTO",
            "OTROS CONCEPTOS",
            "TOTAL DETALLES"
        ];

        for (int column = 1; column <= headers.Length; column++)
            worksheet.Cell(HeaderRow, column).Value = headers[column - 1];

        int rowNumber = FirstDataRow;
        foreach (SalesReportRow row in rows)
        {
            worksheet.Cell(rowNumber, 1).Value = row.TransactionNumber;
            worksheet.Cell(rowNumber, 2).Value = row.SaleDate;
            worksheet.Cell(rowNumber, 3).Value = row.DocumentType;
            worksheet.Cell(rowNumber, 4).Value = row.PaymentMethod;
            worksheet.Cell(rowNumber, 5).Value = row.ENcf;
            worksheet.Cell(rowNumber, 6).Value = row.ReferenceENcf ?? string.Empty;
            worksheet.Cell(rowNumber, 7).Value = row.XmlStatus;

            if (row.XmlSaleAmount.HasValue)
                worksheet.Cell(rowNumber, 8).Value = row.XmlSaleAmount.Value;

            worksheet.Cell(rowNumber, 9).Value = row.PosSaleAmount;

            if (row.XmlPaymentAmount.HasValue)
                worksheet.Cell(rowNumber, 10).Value = row.XmlPaymentAmount.Value;
            if (row.PosPaymentAmount.HasValue)
                worksheet.Cell(rowNumber, 11).Value = row.PosPaymentAmount.Value;

            worksheet.Cell(rowNumber, 12).Value = row.ComparisonStatus;

            if (row.DetailAmount18.HasValue)
                worksheet.Cell(rowNumber, 13).Value = row.DetailAmount18.Value;
            if (row.DetailAmount16.HasValue)
                worksheet.Cell(rowNumber, 14).Value = row.DetailAmount16.Value;
            if (row.DetailAmountExempt.HasValue)
                worksheet.Cell(rowNumber, 15).Value = row.DetailAmountExempt.Value;
            if (row.DetailAmountOther.HasValue)
                worksheet.Cell(rowNumber, 16).Value = row.DetailAmountOther.Value;
            if (row.DetailAmountTotal.HasValue)
                worksheet.Cell(rowNumber, 17).Value = row.DetailAmountTotal.Value;

            if (!row.HasSignedXml ||
                !string.Equals(row.ComparisonStatus, "OK", StringComparison.Ordinal))
            {
                worksheet.Cell(rowNumber, 7).Style.Font.Bold = true;
                worksheet.Cell(rowNumber, 12).Style.Font.Bold = true;
            }

            rowNumber++;
        }

        int lastDataRow = rowNumber - 1;
        IXLTable table = worksheet
            .Range(HeaderRow, 1, lastDataRow, ColumnCount)
            .CreateTable("VentasXmlVsPos");
        table.Theme = XLTableTheme.TableStyleMedium9;
        table.ShowTotalsRow = true;
        table.Field(0).TotalsRowLabel = "TOTAL GENERAL";

        int[] totalFieldIndexes = [7, 8, 9, 10, 12, 13, 14, 15, 16];
        foreach (int fieldIndex in totalFieldIndexes)
            table.Field(fieldIndex).TotalsRowFunction = XLTotalsRowFunction.Sum;

        IXLRange titleRange = worksheet.Range(1, 1, 1, ColumnCount);
        titleRange.Style.Font.Bold = true;
        titleRange.Style.Font.FontSize = 16;
        titleRange.Style.Font.FontColor = XLColor.White;
        titleRange.Style.Fill.BackgroundColor = XLColor.FromHtml("#1F4E78");
        titleRange.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;

        IXLRange metadataRange = worksheet.Range(2, 1, 3, ColumnCount);
        metadataRange.Style.Font.Italic = true;
        metadataRange.Style.Font.FontColor = XLColor.FromHtml("#404040");

        worksheet.Range(FirstDataRow, 2, lastDataRow, 2)
            .Style.DateFormat.Format = "dd/MM/yyyy";
        worksheet.Range(FirstDataRow, 8, lastDataRow + 1, 11)
            .Style.NumberFormat.Format = "#,##0.00;[Red]-#,##0.00";
        worksheet.Range(FirstDataRow, 13, lastDataRow + 1, 17)
            .Style.NumberFormat.Format = "#,##0.00;[Red]-#,##0.00";
        worksheet.Range(FirstDataRow, 1, lastDataRow, 1)
            .Style.NumberFormat.Format = "0";
        worksheet.Range(FirstDataRow, 5, lastDataRow, 6)
            .Style.NumberFormat.Format = "@";

        worksheet.SheetView.FreezeRows(HeaderRow);
        worksheet.Column(1).Width = 12;
        worksheet.Column(2).Width = 13;
        worksheet.Column(3).Width = 18;
        worksheet.Column(4).Width = 18;
        worksheet.Columns(5, 6).Width = 20;
        worksheet.Column(7).Width = 22;
        worksheet.Columns(8, 11).Width = 18;
        worksheet.Column(12).Width = 24;
        worksheet.Columns(13, 17).Width = 17;
        worksheet.Rows(1, 3).AdjustToContents();

        worksheet.PageSetup.PageOrientation = XLPageOrientation.Landscape;
        worksheet.PageSetup.PaperSize = XLPaperSize.LetterPaper;
        worksheet.PageSetup.FitToPages(1, 0);
        worksheet.PageSetup.Margins.Top = 0.35;
        worksheet.PageSetup.Margins.Bottom = 0.35;
        worksheet.PageSetup.Margins.Left = 0.25;
        worksheet.PageSetup.Margins.Right = 0.25;
        worksheet.PageSetup.CenterHorizontally = true;
        worksheet.PageSetup.SetRowsToRepeatAtTop(1, HeaderRow);

        workbook.SaveAs(outputPath);
    }

    private static bool IsSignedXmlFile(string filePath)
    {
        string fileName = Path.GetFileName(filePath);
        return fileName.Contains("signed", StringComparison.OrdinalIgnoreCase) ||
               fileName.Contains("firmado", StringComparison.OrdinalIgnoreCase);
    }
}
