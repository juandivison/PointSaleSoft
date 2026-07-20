namespace PointSaleSoft.XmlSalesImporter.Models;

public sealed class SalesReportRow
{
    public int TransactionNumber { get; init; }
    public int? XmlTransactionNumber { get; init; }
    public DateTime SaleDate { get; init; }
    public DateTime? XmlSaleDate { get; init; }
    public DateTime? SignatureDateTime { get; init; }
    public required string DocumentType { get; init; }
    public required string PaymentMethod { get; init; }
    public required string ENcf { get; init; }
    public string? ReferenceENcf { get; init; }
    public required string XmlStatus { get; init; }
    public decimal? XmlSaleAmount { get; init; }
    public decimal PosSaleAmount { get; init; }
    public decimal? XmlPaymentAmount { get; init; }
    public decimal? PosPaymentAmount { get; init; }
    public required string ComparisonStatus { get; init; }
    public decimal? DetailAmount18 { get; init; }
    public decimal? DetailAmount16 { get; init; }
    public decimal? DetailAmountExempt { get; init; }
    public decimal? DetailAmountOther { get; init; }
    public decimal? DetailAmountTotal { get; init; }
    public bool IsCreditNote { get; init; }
    public bool HasSignedXml { get; init; }
    public string? SourceFile { get; init; }
}

public sealed class PersistedSaleReportData
{
    public int TransactionNumber { get; init; }
    public DateTime SaleDate { get; init; }
    public decimal SaleAmount { get; init; }
    public decimal PaymentAmount { get; init; }
    public int PaymentForm { get; init; }
    public required string ENcf { get; init; }
    public string? ReferenceENcf { get; init; }
    public required string EcfType { get; init; }
    public required string MatchSource { get; init; }
}

public sealed class EcfFileIdentity
{
    public required string FilePath { get; init; }
    public required string FileName { get; init; }
    public required string EcfType { get; init; }
    public int Sequence { get; init; }
    public int TransactionNumber { get; init; }

    public string ENcf => $"E{EcfType}{Sequence:D10}";
}

public sealed class SalesReportResult
{
    public required string OutputPath { get; init; }
    public int FilesScanned { get; init; }
    public int CandidateFiles { get; init; }
    public int XmlFilesOpened { get; init; }
    public int DatabaseSalesLoaded { get; init; }
    public int SalesIncluded { get; init; }
    public int SalesWithoutSignedXml { get; init; }
    public int SalesWithDifferences { get; init; }
    public decimal TotalXmlSales { get; init; }
    public decimal TotalPosSales { get; init; }
    public decimal TotalXmlPayments { get; init; }
    public decimal TotalPosPayments { get; init; }
    public List<string> Warnings { get; init; } = [];
}
