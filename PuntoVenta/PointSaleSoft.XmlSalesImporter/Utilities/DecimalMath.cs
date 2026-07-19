namespace PointSaleSoft.XmlSalesImporter.Utilities;

public static class DecimalMath
{
    public static decimal Round2(decimal value) =>
        Math.Round(value, 2, MidpointRounding.AwayFromZero);

    public static bool EqualsWithin(decimal left, decimal right, decimal tolerance) =>
        Math.Abs(left - right) <= tolerance;
}

public readonly record struct TaxRule(decimal Rate, int TaxRateId, bool IsExempt)
{
    public static TaxRule FromIndicadorFacturacion(int indicator) => indicator switch
    {
        1 => new TaxRule(18m, 6, false),
        2 => new TaxRule(16m, 5, false),
        3 => new TaxRule(0m, 1, true),
        4 => new TaxRule(0m, 1, true),
        _ => throw new InvalidOperationException(
            $"IndicadorFacturacion no soportado: {indicator}. Valores válidos: 1, 2, 3 o 4.")
    };

    public decimal CalculateBase(decimal amount)
    {
        if (Rate <= 0)
            return DecimalMath.Round2(amount);

        return DecimalMath.Round2(amount / (1m + (Rate / 100m)));
    }

    public decimal CalculateTax(decimal amount) =>
        DecimalMath.Round2(amount - CalculateBase(amount));
}
