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
    private const int ColumnCount = 14;

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

        string[] files = Directory
            .GetFiles(xmlFolder, "*.xml", searchOption)
            .Where(IsSignedXmlFile)
            .OrderBy(x => x, StringComparer.OrdinalIgnoreCase)
            .ToArray();

        if (files.Length == 0)
            throw new InvalidOperationException(
                $"No se encontraron XML firmados en {xmlFolder}.");

        List<SalesReportRow> rows = [];
        List<string> warnings = [];

        using FbConnection connection = _repository.OpenConnection();
        _repository.ValidateReportDependencies(connection);

        foreach (string file in files)
        {
            try
            {
                EcfInvoice invoice = _reader.Read(file);

                if (!invoice.HasSignatureNode)
                {
                    warnings.Add(
                        $"{Path.GetFileName(file)}: omitido porque no contiene Signature.");
                    continue;
                }

                DateTime saleDate = invoice.FechaEmision.Date;
                if (saleDate < startDate || saleDate > endDate)
                    continue;

                PersistedSaleReportData? persisted = null;
                try
                {
                    persisted = _repository.GetPersistedSaleForReport(
                        connection,
                        invoice.ENcf,
                        invoice.OriginalTransactionNumber);
                }
                catch (Exception databaseException)
                {
                    warnings.Add(
                        $"{invoice.ENcf}: no fue posible consultar VENTAS_MAST: " +
                        databaseException.Message);
                }

                SalesReportRow row = CreateRow(invoice, persisted);
                rows.Add(row);

                AddRowWarnings(row, persisted, warnings);
            }
            catch (Exception ex)
            {
                warnings.Add($"{Path.GetFileName(file)}: {ex.Message}");
            }
        }

        if (rows.Count == 0)
        {
            throw new InvalidOperationException(
                $"No se encontraron ventas XML entre {startDate:dd/MM/yyyy} " +
                $"y {endDate:dd/MM/yyyy}.");
        }

        string[] duplicates = rows
            .GroupBy(x => x.ENcf, StringComparer.OrdinalIgnoreCase)
            .Where(x => x.Count() > 1)
            .Select(x => x.Key)
            .OrderBy(x => x, StringComparer.OrdinalIgnoreCase)
            .ToArray();

        if (duplicates.Length > 0)
        {
            throw new InvalidOperationException(
                "Se encontraron e-NCF duplicados y el reporte fue detenido para evitar " +
                "duplicar documentos: " + string.Join(", ", duplicates));
        }

        rows = rows
            .OrderBy(x => x.SaleDate)
            .ThenBy(x => x.SignatureDateTime)
            .ThenBy(x => x.ENcf, StringComparer.OrdinalIgnoreCase)
            .ThenBy(x => x.TransactionNumber ?? int.MaxValue)
            .ToList();

        string outputPath = _options.ResolveReportOutputPath();
        string? outputDirectory = Path.GetDirectoryName(outputPath);
        if (!string.IsNullOrWhiteSpace(outputDirectory))
            Directory.CreateDirectory(outputDirectory);

        WriteWorkbook(rows, startDate, endDate, xmlFolder, outputPath);

        return new SalesReportResult
        {
            OutputPath = outputPath,
            FilesScanned = files.Length,
            SalesIncluded = rows.Count,
            SalesNotFoundInPos = rows.Count(x => !x.FoundInPos),
            SalesWithDifferences = rows.Count(x =>
                x.FoundInPos &&
                !string.Equals(x.ComparisonStatus, "OK", StringComparison.Ordinal)),
            TotalXmlSales = DecimalMath.Round2(rows.Sum(x => x.XmlSaleAmount)),
            TotalPosSales = DecimalMath.Round2(rows.Sum(x => x.PosSaleAmount ?? 0m)),
            TotalXmlPayments = DecimalMath.Round2(rows.Sum(x => x.XmlPaymentAmount ?? 0m)),
            TotalPosPayments = DecimalMath.Round2(rows.Sum(x => x.PosPaymentAmount ?? 0m)),
            Warnings = warnings
        };
    }

    private SalesReportRow CreateRow(
        EcfInvoice invoice,
        PersistedSaleReportData? persisted)
    {
        decimal sign = invoice.IsCreditNote ? -1m : 1m;
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
        decimal? xmlPaymentAmount = invoice.IsCreditNote
            ? null
            : invoice.PaymentForms.Count == 0
                ? null
                : SignedAmount(invoice.MontoPago, sign);

        decimal? posSaleAmount = persisted is null
            ? null
            : SignedAmount(persisted.SaleAmount, sign);

        decimal? posPaymentAmount = invoice.IsCreditNote || persisted is null
            ? null
            : SignedAmount(persisted.PaymentAmount, sign);

        string comparisonStatus = ResolveComparisonStatus(
            xmlSaleAmount,
            posSaleAmount,
            xmlPaymentAmount,
            posPaymentAmount,
            invoice.IsCreditNote,
            persisted is not null);

        return new SalesReportRow
        {
            TransactionNumber = persisted?.TransactionNumber ??
                                invoice.OriginalTransactionNumber,
            XmlTransactionNumber = invoice.OriginalTransactionNumber,
            SaleDate = invoice.FechaEmision.Date,
            SignatureDateTime = invoice.FechaHoraFirma,
            DocumentType = invoice.DocumentType,
            ENcf = invoice.ENcf,
            XmlSaleAmount = xmlSaleAmount,
            PosSaleAmount = posSaleAmount,
            XmlPaymentAmount = xmlPaymentAmount,
            PosPaymentAmount = posPaymentAmount,
            ComparisonStatus = comparisonStatus,
            DetailAmount18 = SignedAmount(detail18, sign),
            DetailAmount16 = SignedAmount(detail16, sign),
            DetailAmountExempt = SignedAmount(detailExempt, sign),
            DetailAmountOther = SignedAmount(detailOther, sign),
            DetailAmountTotal = SignedAmount(
                invoice.Items.Sum(x => x.MontoItem), sign),
            IsCreditNote = invoice.IsCreditNote,
            FoundInPos = persisted is not null,
            SourceFile = invoice.FileName
        };
    }

    private void AddRowWarnings(
        SalesReportRow row,
        PersistedSaleReportData? persisted,
        ICollection<string> warnings)
    {
        if (!DecimalMath.EqualsWithin(
                row.DetailAmountTotal,
                row.XmlSaleAmount,
                _options.TotalTolerance))
        {
            warnings.Add(
                $"{row.ENcf}: suma de detalles XML={row.DetailAmountTotal:N2}; " +
                $"MontoTotal XML={row.XmlSaleAmount:N2}.");
        }

        if (persisted is null)
        {
            warnings.Add(
                $"{row.ENcf}: no se encontró la venta correspondiente en VENTAS_MAST.");
            return;
        }

        if (string.Equals(
                persisted.MatchSource,
                "TRN del archivo",
                StringComparison.Ordinal))
        {
            warnings.Add(
                $"{row.ENcf}: la venta se localizó por TRN " +
                $"{persisted.TransactionNumber}, no por relación de e-NCF.");
        }

        if (row.XmlTransactionNumber.HasValue &&
            row.XmlTransactionNumber.Value != persisted.TransactionNumber)
        {
            warnings.Add(
                $"{row.ENcf}: TRN del archivo={row.XmlTransactionNumber.Value}; " +
                $"TRN registrado en POS={persisted.TransactionNumber}.");
        }

        if (!string.Equals(row.ComparisonStatus, "OK", StringComparison.Ordinal))
        {
            warnings.Add(
                $"{row.ENcf}: {row.ComparisonStatus}. " +
                $"Venta XML={row.XmlSaleAmount:N2}; " +
                $"Venta POS={FormatNullable(row.PosSaleAmount)}; " +
                $"Pago XML={FormatNullable(row.XmlPaymentAmount)}; " +
                $"Pago POS={FormatNullable(row.PosPaymentAmount)}.");
        }
    }

    private string ResolveComparisonStatus(
        decimal xmlSaleAmount,
        decimal? posSaleAmount,
        decimal? xmlPaymentAmount,
        decimal? posPaymentAmount,
        bool isCreditNote,
        bool foundInPos)
    {
        if (!foundInPos || !posSaleAmount.HasValue)
            return "NO ENCONTRADO EN POS";

        bool saleMatches = DecimalMath.EqualsWithin(
            xmlSaleAmount,
            posSaleAmount.Value,
            _options.TotalTolerance);

        bool paymentMatches = true;
        bool paymentComparable = !isCreditNote && xmlPaymentAmount.HasValue;

        if (paymentComparable)
        {
            paymentMatches = posPaymentAmount.HasValue &&
                DecimalMath.EqualsWithin(
                    xmlPaymentAmount!.Value,
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

    private static decimal SignedAmount(decimal value, decimal sign) =>
        DecimalMath.Round2(sign < 0m ? -Math.Abs(value) : value);

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
            $"Período: {startDate:dd/MM/yyyy} hasta {endDate:dd/MM/yyyy}";
        worksheet.Range(2, 1, 2, ColumnCount).Merge();
        worksheet.Cell(3, 1).Value = $"Origen XML: {xmlFolder}";
        worksheet.Range(3, 1, 3, ColumnCount).Merge();

        string[] headers =
        [
            "TRN",
            "FECHA",
            "TIPO",
            "e-NCF",
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
            if (row.TransactionNumber.HasValue)
                worksheet.Cell(rowNumber, 1).Value = row.TransactionNumber.Value;

            worksheet.Cell(rowNumber, 2).Value = row.SaleDate;
            worksheet.Cell(rowNumber, 3).Value = row.DocumentType;
            worksheet.Cell(rowNumber, 4).Value = row.ENcf;
            worksheet.Cell(rowNumber, 5).Value = row.XmlSaleAmount;

            if (row.PosSaleAmount.HasValue)
                worksheet.Cell(rowNumber, 6).Value = row.PosSaleAmount.Value;
            if (row.XmlPaymentAmount.HasValue)
                worksheet.Cell(rowNumber, 7).Value = row.XmlPaymentAmount.Value;
            if (row.PosPaymentAmount.HasValue)
                worksheet.Cell(rowNumber, 8).Value = row.PosPaymentAmount.Value;

            worksheet.Cell(rowNumber, 9).Value = row.ComparisonStatus;
            worksheet.Cell(rowNumber, 10).Value = row.DetailAmount18;
            worksheet.Cell(rowNumber, 11).Value = row.DetailAmount16;
            worksheet.Cell(rowNumber, 12).Value = row.DetailAmountExempt;
            worksheet.Cell(rowNumber, 13).Value = row.DetailAmountOther;
            worksheet.Cell(rowNumber, 14).Value = row.DetailAmountTotal;

            if (!string.Equals(
                    row.ComparisonStatus,
                    "OK",
                    StringComparison.Ordinal))
            {
                worksheet.Cell(rowNumber, 9).Style.Font.Bold = true;
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

        int[] totalFieldIndexes = [4, 5, 6, 7, 9, 10, 11, 12, 13];
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
        worksheet.Range(FirstDataRow, 5, lastDataRow + 1, 8)
            .Style.NumberFormat.Format = "#,##0.00;[Red]-#,##0.00";
        worksheet.Range(FirstDataRow, 10, lastDataRow + 1, 14)
            .Style.NumberFormat.Format = "#,##0.00;[Red]-#,##0.00";
        worksheet.Range(FirstDataRow, 1, lastDataRow, 1)
            .Style.NumberFormat.Format = "0";
        worksheet.Range(FirstDataRow, 4, lastDataRow, 4)
            .Style.NumberFormat.Format = "@";

        worksheet.SheetView.FreezeRows(HeaderRow);
        worksheet.Column(1).Width = 12;
        worksheet.Column(2).Width = 13;
        worksheet.Column(3).Width = 18;
        worksheet.Column(4).Width = 19;
        worksheet.Columns(5, 8).Width = 18;
        worksheet.Column(9).Width = 24;
        worksheet.Columns(10, 14).Width = 17;
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
