using System.Text.Json;

namespace PointSaleSoft.XmlSalesImporter.Configuration;

public sealed class ImportOptions
{
    public string ConnectionString { get; set; } = string.Empty;
    public string XmlFolder { get; set; } = @".\Samples";
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
        if (string.IsNullOrWhiteSpace(ConnectionString))
            throw new InvalidOperationException("ConnectionString es obligatorio.");
        if (string.IsNullOrWhiteSpace(XmlFolder))
            throw new InvalidOperationException("XmlFolder es obligatorio.");
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

    public static string FindConfigPath(string[] args)
    {
        for (int i = 0; i < args.Length - 1; i++)
        {
            if (string.Equals(args[i], "--config", StringComparison.OrdinalIgnoreCase))
                return args[i + 1];
        }

        return Path.Combine(AppContext.BaseDirectory, "appsettings.json");
    }

    private static string ReadValue(string[] args, ref int index, string parameter)
    {
        if (index + 1 >= args.Length)
            throw new ArgumentException($"Falta el valor para {parameter}.");

        index++;
        return args[index];
    }
}
