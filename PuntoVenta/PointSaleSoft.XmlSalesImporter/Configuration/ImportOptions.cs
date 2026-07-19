using System.Globalization;
using System.Text.Json;

namespace PointSaleSoft.XmlSalesImporter.Configuration;

public sealed class ImportOptions
{
    public string ConnectionString { get; set; } = string.Empty;
    public string XmlFolder { get; set; } = @".\Samples";
    public string ReportOutputFolder { get; set; } = @".\reports";
    public bool ReportSearchSubdirectories { get; set; } = true;
    public int CompanyKey { get; set; } = 1;
    public int CreditCustomerCode { get; set; } = 838;
    public int UserCode { get; set; } = 40;
    public string Currency { get; set; } = "1";
    public string ExpectedRncEmisor { get; set; } = string.Empty;
    public int ExpectedStartSequence { get; set; } = 50907;
    public int ExpectedEndSequence { get; set; } = 50921;
    public int ExpectedCount { get; set; } = 15;
    public bool RequireCompleteSequence { get; set; } = true;
    public bool RequireProductInInventory { get; set; } = true;
    public bool ValidatePersistedSale { get; set; } = true;
    public bool DryRun { get; set; } = true;
    public bool StopOnError { get; set; } = true;
    public decimal PriceTolerance { get; set; } = 0.01m;
    public decimal TotalTolerance { get; set; } = 0.01m;

    public bool ExcelReportMode { get; private set; }
    public DateTime? ReportStartDate { get; private set; }
    public DateTime? ReportEndDate { get; private set; }
    public string? ReportOutputPath { get; private set; }

    public static ImportOptions Load(string path)
    {
        if (!File.Exists(path))
            throw new FileNotFoundException("No se encontró el archivo de configuración.", path);

        string json = File.ReadAllText(path);
        ImportOptions? options = JsonSerializer.Deserialize<ImportOptions>(json,
            new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

        return options ?? throw new InvalidOperationException("No fue posible leer appsettings.json.");
    }

    public void ApplyCommandLine(string[] args)
    {
        for (int i = 0; i < args.Length; i++)
        {
            string arg = args[i].Trim();
            switch (arg.ToLowerInvariant())
            {
                case "--excel-report":
                case "--report":
                case "--reporte-excel":
                    ExcelReportMode = true;
                    break;
                case "--from":
                case "--desde":
                    ReportStartDate = ParseReportDate(ReadValue(args, ref i, arg), arg);
                    break;
                case "--to":
                case "--hasta":
                    ReportEndDate = ParseReportDate(ReadValue(args, ref i, arg), arg);
                    break;
                case "--output":
                case "--salida":
                    ReportOutputPath = ReadValue(args, ref i, arg);
                    break;
                case "--commit":
                    DryRun = false;
                    break;
                case "--dry-run":
                    DryRun = true;
                    break;
                case "--continue-on-error":
                    StopOnError = false;
                    break;
                case "--stop-on-error":
                    StopOnError = true;
                    break;
                case "--folder":
                    XmlFolder = ReadValue(args, ref i, arg);
                    break;
                case "--connection":
                    ConnectionString = ReadValue(args, ref i, arg);
                    break;
                case "--config":
                    i++;
                    break;
                default:
                    if (arg.StartsWith("--", StringComparison.Ordinal))
                        throw new ArgumentException($"Parámetro no reconocido: {arg}");
                    break;
            }
        }
    }

    public void Validate()
    {
        if (string.IsNullOrWhiteSpace(XmlFolder))
            throw new InvalidOperationException("XmlFolder es obligatorio.");

        if (ExcelReportMode)
        {
            ValidateExcelReport();
            return;
        }

        ValidateImport();
    }

    public string ResolveReportOutputPath()
    {
        if (!ExcelReportMode || !ReportStartDate.HasValue || !ReportEndDate.HasValue)
            throw new InvalidOperationException("El modo de reporte no está configurado correctamente.");

        string defaultFileName =
            $"Ventas_XML_{ReportStartDate.Value:yyyyMMdd}_{ReportEndDate.Value:yyyyMMdd}.xlsx";

        if (string.IsNullOrWhiteSpace(ReportOutputPath))
        {
            string folder = Path.GetFullPath(
                ReportOutputFolder,
                AppContext.BaseDirectory);
            return Path.Combine(folder, defaultFileName);
        }

        string resolved = Path.GetFullPath(ReportOutputPath, Directory.GetCurrentDirectory());
        if (string.Equals(Path.GetExtension(resolved), ".xlsx", StringComparison.OrdinalIgnoreCase))
            return resolved;

        return Path.Combine(resolved, defaultFileName);
    }

    public static string FindConfigPath(string[] args)
    {
        for (int i = 0; i < args.Length - 1; i++)
        {
            if (string.Equals(args[i], "--config", StringComparison.OrdinalIgnoreCase))
                return args[i + 1];
        }

        return Path.Combine(AppContext.BaseDirectory, "appsettings.json");
    }

    private void ValidateExcelReport()
    {
        if (string.IsNullOrWhiteSpace(ConnectionString))
            throw new InvalidOperationException(
                "ConnectionString es obligatorio para cruzar el reporte con VENTAS_MAST.");

        if (CompanyKey <= 0)
            throw new InvalidOperationException(
                "CompanyKey debe ser mayor que cero para generar el reporte.");

        if (!ReportStartDate.HasValue)
            throw new InvalidOperationException(
                "Debe indicar la fecha inicial con --from o --desde.");

        if (!ReportEndDate.HasValue)
            throw new InvalidOperationException(
                "Debe indicar la fecha final con --to o --hasta.");

        if (ReportEndDate.Value.Date < ReportStartDate.Value.Date)
            throw new InvalidOperationException(
                "La fecha final del reporte no puede ser menor que la fecha inicial.");

        if (string.IsNullOrWhiteSpace(ReportOutputFolder) &&
            string.IsNullOrWhiteSpace(ReportOutputPath))
        {
            throw new InvalidOperationException(
                "Debe configurar ReportOutputFolder o indicar --output.");
        }
    }

    private void ValidateImport()
    {
        if (string.IsNullOrWhiteSpace(ConnectionString))
            throw new InvalidOperationException("ConnectionString es obligatorio.");
        if (CompanyKey <= 0)
            throw new InvalidOperationException("CompanyKey debe ser mayor que cero.");
        if (CreditCustomerCode <= 0)
            throw new InvalidOperationException("CreditCustomerCode debe ser mayor que cero.");
        if (UserCode <= 0)
            throw new InvalidOperationException("UserCode debe ser mayor que cero.");
        if (ExpectedCount <= 0)
            throw new InvalidOperationException("ExpectedCount debe ser mayor que cero.");
        if (ExpectedEndSequence < ExpectedStartSequence)
            throw new InvalidOperationException("El rango esperado de e-NCF es inválido.");
        if (PriceTolerance < 0 || TotalTolerance < 0)
            throw new InvalidOperationException("Las tolerancias no pueden ser negativas.");
    }

    private static DateTime ParseReportDate(string value, string parameter)
    {
        string normalized = value.Trim().ToLowerInvariant();

        string[] numericFormats =
        [
            "d/M/yyyy",
            "dd/MM/yyyy",
            "d-M-yyyy",
            "dd-MM-yyyy",
            "yyyy-MM-dd"
        ];

        if (DateTime.TryParseExact(
                normalized,
                numericFormats,
                CultureInfo.InvariantCulture,
                DateTimeStyles.None,
                out DateTime numericDate))
        {
            return numericDate.Date;
        }

        string[] parts = normalized.Split(['/', '-'],
            StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);

        if (parts.Length == 3 &&
            int.TryParse(parts[0], NumberStyles.Integer, CultureInfo.InvariantCulture, out int day) &&
            int.TryParse(parts[2], NumberStyles.Integer, CultureInfo.InvariantCulture, out int year))
        {
            int month = ParseSpanishMonth(parts[1]);
            if (month > 0)
            {
                try
                {
                    return new DateTime(year, month, day);
                }
                catch (ArgumentOutOfRangeException)
                {
                    // Se genera el mensaje uniforme al final.
                }
            }
        }

        throw new ArgumentException(
            $"Fecha inválida para {parameter}: '{value}'. " +
            "Use formatos como 06/06/2026, 2026-06-06 o 6/jun/2026.");
    }

    private static int ParseSpanishMonth(string value)
    {
        string month = value.Trim().ToLowerInvariant();
        return month switch
        {
            "ene" or "enero" => 1,
            "feb" or "febrero" => 2,
            "mar" or "marzo" => 3,
            "abr" or "abril" => 4,
            "may" or "mayo" => 5,
            "jun" or "junio" => 6,
            "jul" or "julio" => 7,
            "ago" or "agosto" => 8,
            "sep" or "sept" or "septiembre" => 9,
            "oct" or "octubre" => 10,
            "nov" or "noviembre" => 11,
            "dic" or "diciembre" => 12,
            _ => 0
        };
    }

    private static string ReadValue(string[] args, ref int index, string parameter)
    {
        if (index + 1 >= args.Length)
            throw new ArgumentException($"Falta el valor para {parameter}.");

        index++;
        return args[index];
    }
}
