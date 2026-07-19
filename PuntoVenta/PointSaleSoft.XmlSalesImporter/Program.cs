using System.Globalization;
using PointSaleSoft.XmlSalesImporter.Configuration;
using PointSaleSoft.XmlSalesImporter.Data;
using PointSaleSoft.XmlSalesImporter.Models;
using PointSaleSoft.XmlSalesImporter.Parsing;
using PointSaleSoft.XmlSalesImporter.Services;
using PointSaleSoft.XmlSalesImporter.Utilities;

CultureInfo.DefaultThreadCurrentCulture = CultureInfo.InvariantCulture;
CultureInfo.DefaultThreadCurrentUICulture = CultureInfo.InvariantCulture;

try
{
    string configPath = ImportOptions.FindConfigPath(args);
    ImportOptions options = ImportOptions.Load(configPath);
    options.ApplyCommandLine(args);
    options.Validate();

    if (options.ExcelReportMode)
        return RunExcelReport(options);

    return RunDatabaseImport(options);
}
catch (Exception ex)
{
    Console.Error.WriteLine("ERROR FATAL");
    Console.Error.WriteLine(ex.ToString());
    return 1;
}

static int RunExcelReport(ImportOptions options)
{
    Console.WriteLine("MODO REPORTE EXCEL — NO SE UTILIZARÁ LA BASE DE DATOS");
    Console.WriteLine(
        $"Período: {options.ReportStartDate:dd/MM/yyyy} hasta {options.ReportEndDate:dd/MM/yyyy}");
    Console.WriteLine();

    EcfXmlReader reader = new();
    XmlSalesExcelReportService service = new(options, reader);
    SalesReportResult result = service.Generate();

    Console.WriteLine($"XML firmados revisados: {result.FilesScanned}");
    Console.WriteLine($"Ventas incluidas: {result.SalesIncluded}");
    Console.WriteLine($"Monto venta: {result.TotalSales:N2}");
    Console.WriteLine($"Monto pago: {result.TotalPayments:N2}");

    foreach (string warning in result.Warnings.Distinct())
        Console.WriteLine("ADVERTENCIA: " + warning);

    Console.WriteLine();
    Console.WriteLine($"Excel generado: {result.OutputPath}");
    return 0;
}

static int RunDatabaseImport(ImportOptions options)
{
    string xmlFolder = Path.GetFullPath(options.XmlFolder, Directory.GetCurrentDirectory());
    if (!Directory.Exists(xmlFolder))
        throw new DirectoryNotFoundException($"No existe la carpeta XML: {xmlFolder}");

    string[] files = Directory.GetFiles(xmlFolder, "*.xml", SearchOption.TopDirectoryOnly);
    if (files.Length == 0)
        throw new InvalidOperationException($"No se encontraron XML en {xmlFolder}.");

    EcfXmlReader reader = new();
    InvoiceValidator validator = new();
    List<EcfInvoice> invoices = [];
    List<string> xmlErrors = [];

    foreach (string file in files)
    {
        try
        {
            EcfInvoice invoice = reader.Read(file);
            List<string> errors = validator.Validate(invoice, options);
            if (errors.Count > 0)
                xmlErrors.AddRange(errors.Select(x => $"{Path.GetFileName(file)}: {x}"));
            else
                invoices.Add(invoice);
        }
        catch (Exception ex)
        {
            xmlErrors.Add($"{Path.GetFileName(file)}: {ex.Message}");
        }
    }

    xmlErrors.AddRange(validator.ValidateSet(invoices, options));
    if (xmlErrors.Count > 0)
    {
        Console.Error.WriteLine("VALIDACIÓN XML RECHAZADA");
        foreach (string error in xmlErrors)
            Console.Error.WriteLine("  - " + error);
        return 2;
    }

    invoices = invoices.OrderBy(x => x.ENcfSequence).ToList();
    Console.WriteLine($"XML válidos: {invoices.Count}");
    Console.WriteLine($"Rango: {invoices.First().ENcf} - {invoices.Last().ENcf}");
    Console.WriteLine($"Contado: {invoices.Count(x => x.IsCash)}");
    Console.WriteLine($"Crédito: {invoices.Count(x => x.IsCredit)}");
    Console.WriteLine($"Total: {invoices.Sum(x => x.ValorPagar):N2}");
    Console.WriteLine();

    FirebirdSalesRepository repository = new(options);
    XmlSalesImportService service = new(options, repository);

    Console.WriteLine("Ejecutando prevalidación contra Firebird...");
    List<ImportResult> preflight = service.Preflight(invoices);
    PrintResults(preflight);

    if (preflight.Any(x => x.Status == ImportStatus.Failed))
    {
        string preflightLog = ImportLogWriter.Write(
            Path.Combine(AppContext.BaseDirectory, "logs"), preflight);
        Console.Error.WriteLine($"Prevalidación fallida. Log: {preflightLog}");
        return 3;
    }

    if (options.DryRun)
    {
        string dryRunLog = ImportLogWriter.Write(
            Path.Combine(AppContext.BaseDirectory, "logs"), preflight);
        Console.WriteLine();
        Console.WriteLine("MODO SIMULACIÓN: no se ejecutaron INSERT ni GEN_ID.");
        Console.WriteLine($"Log: {dryRunLog}");
        Console.WriteLine("Para ejecutar la carga real use: --commit");
        return 0;
    }

    Console.WriteLine();
    Console.WriteLine("INICIANDO CARGA REAL. Cada XML se confirma en una transacción independiente.");
    List<ImportResult> imported = service.Import(invoices);
    PrintResults(imported);

    string logPath = ImportLogWriter.Write(
        Path.Combine(AppContext.BaseDirectory, "logs"), imported);
    Console.WriteLine();
    Console.WriteLine($"Log: {logPath}");

    return imported.Any(x => x.Status == ImportStatus.Failed) ? 4 : 0;
}

static void PrintResults(IEnumerable<ImportResult> results)
{
    foreach (ImportResult result in results)
    {
        Console.WriteLine(
            $"[{result.Status}] {result.ENcf} | {result.PaymentType} | {result.Amount:N2} | {result.Message}");
        foreach (string warning in result.Warnings.Distinct())
            Console.WriteLine("    ADVERTENCIA: " + warning);
    }
}
