using ClosedXML.Excel;
using PointSaleSoft.XmlSalesImporter.Configuration;
using PointSaleSoft.XmlSalesImporter.Models;
using PointSaleSoft.XmlSalesImporter.Parsing;
using PointSaleSoft.XmlSalesImporter.Utilities;

namespace PointSaleSoft.XmlSalesImporter.Services;

public sealed class XmlSalesExcelReportService
{
    private const int HeaderRow = 4;
    private const int FirstDataRow = HeaderRow + 1;
    private const int ColumnCount = 10;

    private readonly ImportOptions _options;
    private readonly EcfXmlReader _reader;

    public XmlSalesExcelReportService(ImportOptions options, EcfXmlReader reader)
    {
        _options = options;
        _reader = reader;
    }

    public SalesReportResult Generate()
    {
        if (!_options.ReportStartDate.HasValue || !_options.ReportEndDate.HasValue)
            throw new InvalidOperationException("El rango de fechas del reporte no está definido.");

        DateTime startDate = _options.ReportStartDate.Value.Date;
        DateTime endDate = _options.ReportEndDate.Value.Date;
        string xmlFolder = Path.GetFullPath(_options.XmlFolder, Directory.GetCurrentDirectory());

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

        foreach (string file in files)
        {
            try
            {
                EcfInvoice invoice = _reader.Read(file);

                if (!invoice.HasSignatureNode)
                {
                    warnings.Add($"{Path.GetFileName(file)}: omitido porque no contiene Signature.");
                    continue;
                }

                DateTime saleDate = invoice.FechaEmision.Date;
                if (saleDate < startDate || saleDate > endDate)
                    continue;

                rows.Add(CreateRow(invoice));
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
                "duplicar ventas: " + string.Join(", ", duplicates));
        }

        rows = rows
            .OrderBy(x => x.SaleDate)
            .ThenBy(x => x.SignatureDateTime)
            .ThenBy(x => x.ENcf, StringComparer.OrdinalIgnoreCase)
            .ThenBy(x => x.TransactionNumber ?? int.MaxValue)
            .ToList();

        foreach (SalesReportRow row in rows)
        {
            if (!DecimalMath.EqualsWithin(row.DetailAmountTotal, row.SaleAmount,
                    _options.TotalTolerance))
            {
                warnings.Add(
                    $"{row.ENcf}: suma de detalles={row.DetailAmountTotal:N2}; " +
                    $"MontoTotal={row.SaleAmount:N2}.");
            }

            if (!DecimalMath.EqualsWithin(row.PaymentAmount, row.SaleAmount,
                    _options.TotalTolerance))
            {
                warnings.Add(
                    $"{row.ENcf}: MontoPago={row.PaymentAmount:N2}; " +
                    $"MontoTotal={row.SaleAmount:N2}.");
            }
        }

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
            TotalSales = DecimalMath.Round2(rows.Sum(x => x.SaleAmount)),
            TotalPayments = DecimalMath.Round2(rows.Sum(x => x.PaymentAmount)),
            Warnings = warnings
        };
    }

    private static SalesReportRow CreateRow(EcfInvoice invoice)
    {
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

        return new SalesReportRow
        {
            TransactionNumber = invoice.OriginalTransactionNumber,
            SaleDate = invoice.FechaEmision.Date,
            SignatureDateTime = invoice.FechaHoraFirma,
            ENcf = invoice.ENcf,
            SaleAmount = DecimalMath.Round2(invoice.MontoTotal),
            PaymentAmount = DecimalMath.Round2(invoice.MontoPago),
            DetailAmount18 = DecimalMath.Round2(detail18),
            DetailAmount16 = DecimalMath.Round2(detail16),
            DetailAmountExempt = DecimalMath.Round2(detailExempt),
            DetailAmountOther = DecimalMath.Round2(detailOther),
            DetailAmountTotal = DecimalMath.Round2(invoice.Items.Sum(x => x.MontoItem)),
            SourceFile = invoice.FileName
        };
    }

    private static void WriteWorkbook(
        IReadOnlyList<SalesReportRow> rows,
        DateTime startDate,
        DateTime endDate,
        string xmlFolder,
        string outputPath)
    {
        using XLWorkbook workbook = new();
        IXLWorksheet worksheet = workbook.Worksheets.Add("Resumen");

        worksheet.Cell(1, 1).Value = "RESUMEN DE VENTAS DESDE XML FIRMADOS";
        worksheet.Range(1, 1, 1, ColumnCount).Merge();
        worksheet.Cell(2, 1).Value =
            $"Período: {startDate:dd/MM/yyyy} hasta {endDate:dd/MM/yyyy}";
        worksheet.Range(2, 1, 2, ColumnCount).Merge();
        worksheet.Cell(3, 1).Value = $"Origen: {xmlFolder}";
        worksheet.Range(3, 1, 3, ColumnCount).Merge();

        string[] headers =
        [
            "TRN",
            "FECHA",
            "e-NCF",
            "MONTO VENTA",
            "MONTO PAGO",
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
            worksheet.Cell(rowNumber, 3).Value = row.ENcf;
            worksheet.Cell(rowNumber, 4).Value = row.SaleAmount;
            worksheet.Cell(rowNumber, 5).Value = row.PaymentAmount;
            worksheet.Cell(rowNumber, 6).Value = row.DetailAmount18;
            worksheet.Cell(rowNumber, 7).Value = row.DetailAmount16;
            worksheet.Cell(rowNumber, 8).Value = row.DetailAmountExempt;
            worksheet.Cell(rowNumber, 9).Value = row.DetailAmountOther;
            worksheet.Cell(rowNumber, 10).Value = row.DetailAmountTotal;
            rowNumber++;
        }

        int lastDataRow = rowNumber - 1;
        IXLTable table = worksheet
            .Range(HeaderRow, 1, lastDataRow, ColumnCount)
            .CreateTable("VentasXmlResumen");
        table.Theme = XLTableTheme.TableStyleMedium9;
        table.ShowTotalsRow = true;
        table.Field(0).TotalsRowLabel = "TOTALES";

        for (int columnIndex = 3; columnIndex < ColumnCount; columnIndex++)
            table.Field(columnIndex).TotalsRowFunction = XLTotalsRowFunction.Sum;

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
        worksheet.Range(FirstDataRow, 4, lastDataRow + 1, 10)
            .Style.NumberFormat.Format = "#,##0.00";
        worksheet.Range(FirstDataRow, 1, lastDataRow, 1)
            .Style.NumberFormat.Format = "0";
        worksheet.Range(FirstDataRow, 3, lastDataRow, 3)
            .Style.NumberFormat.Format = "@";

        worksheet.SheetView.FreezeRows(HeaderRow);
        worksheet.Column(1).Width = 12;
        worksheet.Column(2).Width = 13;
        worksheet.Column(3).Width = 19;
        worksheet.Columns(4, 10).Width = 17;
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
