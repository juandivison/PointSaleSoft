namespace PointSaleSoft.XmlSalesImporter.Models;

public enum ImportStatus
{
    Validated,
    Imported,
    Failed
}

public sealed class ImportResult
{
    public required string FileName { get; init; }
    public string ENcf { get; init; } = string.Empty;
    public int? OriginalTransactionNumber { get; init; }
    public int? GeneratedTransactionNumber { get; set; }
    public int? InvoiceNumber { get; set; }
    public decimal Amount { get; init; }
    public string PaymentType { get; init; } = string.Empty;
    public ImportStatus Status { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<string> Warnings { get; } = [];
}

public sealed class ProductLookup
{
    public int ProductCode { get; init; }
    public bool Exists { get; init; }
    public string Barcode { get; init; } = string.Empty;
    public decimal PurchasePrice { get; init; }
    public int PriceLevel { get; init; } = 5;
    public List<string> Warnings { get; } = [];
}

public sealed class PersistedValidationResult
{
    public bool IsValid { get; init; }
    public string Message { get; init; } = string.Empty;
}
