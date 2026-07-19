namespace PointSaleSoft.XmlSalesImporter.Models;

public sealed class EcfInvoice
{
    public required string FilePath { get; init; }
    public required string FileName { get; init; }
    public required string TipoEcf { get; init; }
    public required string ENcf { get; init; }
    public int ENcfSequence { get; init; }
    public int? OriginalTransactionNumber { get; init; }
    public int TipoIngreso { get; init; }
    public int TipoPago { get; init; }
    public DateTime FechaEmision { get; init; }
    public DateTime? FechaLimitePago { get; init; }
    public DateTime FechaHoraFirma { get; init; }
    public required string RncEmisor { get; init; }
    public decimal MontoGravadoTotal { get; init; }
    public decimal MontoExento { get; init; }
    public decimal TotalItbis { get; init; }
    public decimal MontoTotal { get; init; }
    public decimal ValorPagar { get; init; }
    public bool HasSignatureNode { get; init; }
    public List<EcfPaymentForm> PaymentForms { get; init; } = [];
    public List<EcfItem> Items { get; init; } = [];

    public bool IsCreditNote =>
        string.Equals(TipoEcf, "34", StringComparison.OrdinalIgnoreCase) ||
        ENcf.StartsWith("E34", StringComparison.OrdinalIgnoreCase);

    public string DocumentType => IsCreditNote ? "NOTA DE CREDITO" : "VENTA";
    public bool IsCredit => !IsCreditNote && TipoPago == 2 && PaymentForms.Count == 1 && PaymentForms[0].FormaPago == 4;
    public bool IsCash => !IsCreditNote && TipoPago == 1 && PaymentForms.Count == 1 && PaymentForms[0].FormaPago == 1;

    public string PaymentMethodDescription
    {
        get
        {
            if (IsCreditNote)
                return "NO APLICA";

            if (IsCredit)
                return "CREDITO";

            if (IsCash)
                return "CONTADO";

            if (PaymentForms.Count > 1)
                return "MIXTO";

            if (PaymentForms.Count == 1)
                return $"FORMA {PaymentForms[0].FormaPago}";

            return TipoPago switch
            {
                1 => "CONTADO",
                2 => "CREDITO",
                _ => "NO DEFINIDA"
            };
        }
    }

    public decimal MontoPago => PaymentForms.Sum(x => x.MontoPago);
}

public sealed class EcfPaymentForm
{
    public int FormaPago { get; init; }
    public decimal MontoPago { get; init; }
}

public sealed class EcfItem
{
    public int NumeroLinea { get; init; }
    public int IndicadorFacturacion { get; init; }
    public required string CodigoProducto { get; init; }
    public int IndicadorBienServicio { get; init; }
    public required string Descripcion { get; init; }
    public decimal Cantidad { get; init; }
    public decimal PrecioUnitario { get; init; }
    public decimal MontoItem { get; init; }
}
