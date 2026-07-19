namespace PointSaleSoft.XmlSalesImporter.Models;

public sealed class SalesReportRow
{
    public int? TransactionNumber { get; init; }
    public DateTime SaleDate { get; init; }
    public DateTime SignatureDateTime { get; init; }
    public required string ENcf { get; init; }
    public decimal SaleAmount { get; init; }
    public decimal PaymentAmount { get; init; }
    public decimal DetailAmount18 { get; init; }
    public decimal DetailAmount16 { get; init; }
    public decimal DetailAmountExempt { get; init; }
    public decimal DetailAmountOther { get; init; }
    public decimal DetailAmountTotal { get; init; }
    public required string SourceFile { get; init; }
}

public sealed class SalesReportResult
{
    public required string OutputPath { get; init; }
    public int FilesScanned { get; init; }
    public int SalesIncluded { get; init; }
    public decimal TotalSales { get; init; }
    public decimal TotalPayments { get; init; }
    public List<string> Warnings { get; init; } = [];
}
