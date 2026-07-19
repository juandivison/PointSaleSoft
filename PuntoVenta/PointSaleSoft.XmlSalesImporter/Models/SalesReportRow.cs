namespace PointSaleSoft.XmlSalesImporter.Models;

public sealed class SalesReportRow
{
    public int? TransactionNumber { get; init; }
    public int? XmlTransactionNumber { get; init; }
    public DateTime SaleDate { get; init; }
    public DateTime SignatureDateTime { get; init; }
    public required string DocumentType { get; init; }
    public required string ENcf { get; init; }
    public decimal XmlSaleAmount { get; init; }
    public decimal? PosSaleAmount { get; init; }
    public decimal? XmlPaymentAmount { get; init; }
    public decimal? PosPaymentAmount { get; init; }
    public required string ComparisonStatus { get; init; }
    public decimal DetailAmount18 { get; init; }
    public decimal DetailAmount16 { get; init; }
    public decimal DetailAmountExempt { get; init; }
    public decimal DetailAmountOther { get; init; }
    public decimal DetailAmountTotal { get; init; }
    public bool IsCreditNote { get; init; }
    public bool FoundInPos { get; init; }
    public required string SourceFile { get; init; }
}

public sealed class PersistedSaleReportData
{
    public int TransactionNumber { get; init; }
    public decimal SaleAmount { get; init; }
    public decimal PaymentAmount { get; init; }
    public required string MatchSource { get; init; }
}

public sealed class SalesReportResult
{
    public required string OutputPath { get; init; }
    public int FilesScanned { get; init; }
    public int SalesIncluded { get; init; }
    public int SalesNotFoundInPos { get; init; }
    public int SalesWithDifferences { get; init; }
    public decimal TotalXmlSales { get; init; }
    public decimal TotalPosSales { get; init; }
    public decimal TotalXmlPayments { get; init; }
    public decimal TotalPosPayments { get; init; }
    public List<string> Warnings { get; init; } = [];
}
