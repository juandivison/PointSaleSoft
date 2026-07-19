using PointSaleSoft.XmlSalesImporter.Configuration;
using PointSaleSoft.XmlSalesImporter.Models;
using PointSaleSoft.XmlSalesImporter.Utilities;

namespace PointSaleSoft.XmlSalesImporter.Services;

public sealed class InvoiceValidator
{
    public List<string> Validate(EcfInvoice invoice, ImportOptions options)
    {
        List<string> errors = [];

        if (!string.Equals(invoice.TipoEcf, "32", StringComparison.Ordinal))
            errors.Add($"TipoeCF inválido: {invoice.TipoEcf}. Solo se permite E32.");

        if (!string.IsNullOrWhiteSpace(options.ExpectedRncEmisor) &&
            !string.Equals(invoice.RncEmisor, options.ExpectedRncEmisor, StringComparison.Ordinal))
            errors.Add($"RNCEmisor {invoice.RncEmisor} no coincide con {options.ExpectedRncEmisor}.");

        if (!invoice.HasSignatureNode)
            errors.Add("El documento no contiene el nodo Signature.");

        if (!invoice.OriginalTransactionNumber.HasValue)
            errors.Add("El nombre del archivo no contiene el TRN esperado.");

        if (invoice.ENcfSequence < options.ExpectedStartSequence ||
            invoice.ENcfSequence > options.ExpectedEndSequence)
            errors.Add($"Secuencia {invoice.ENcfSequence} fuera del rango " +
                       $"{options.ExpectedStartSequence}-{options.ExpectedEndSequence}.");

        if (!invoice.IsCash && !invoice.IsCredit)
            errors.Add("La combinación TipoPago/FormaPago no corresponde a contado 1/1 ni crédito 2/4.");

        if (invoice.IsCredit && invoice.FechaLimitePago is null)
            errors.Add("La venta a crédito no contiene FechaLimitePago.");

        if (invoice.Items.Count == 0)
            errors.Add("La factura no contiene ítems.");

        decimal detailTotal = 0m;
        decimal detailBase = 0m;
        decimal detailTax = 0m;
        decimal detailExempt = 0m;
        HashSet<int> lines = [];

        foreach (EcfItem item in invoice.Items)
        {
            if (!lines.Add(item.NumeroLinea))
                errors.Add($"Número de línea duplicado: {item.NumeroLinea}.");
            if (item.Cantidad <= 0)
                errors.Add($"Línea {item.NumeroLinea}: cantidad debe ser mayor que cero.");
            if (item.PrecioUnitario < 0)
                errors.Add($"Línea {item.NumeroLinea}: precio inválido.");
            if (item.MontoItem < 0)
                errors.Add($"Línea {item.NumeroLinea}: monto inválido.");
            if (string.IsNullOrWhiteSpace(item.CodigoProducto) ||
                !int.TryParse(item.CodigoProducto, out _))
                errors.Add($"Línea {item.NumeroLinea}: NombreItem debe contener el código numérico del producto.");
            if (string.IsNullOrWhiteSpace(item.Descripcion))
                errors.Add($"Línea {item.NumeroLinea}: DescripcionItem está vacía.");

            decimal expectedItem = DecimalMath.Round2(item.Cantidad * item.PrecioUnitario);
            if (!DecimalMath.EqualsWithin(expectedItem, item.MontoItem, options.TotalTolerance))
                errors.Add($"Línea {item.NumeroLinea}: Cantidad x Precio = {expectedItem:N2}, " +
                           $"pero MontoItem = {item.MontoItem:N2}.");

            try
            {
                TaxRule rule = TaxRule.FromIndicadorFacturacion(item.IndicadorFacturacion);
                detailTotal += item.MontoItem;
                if (rule.IsExempt)
                    detailExempt += item.MontoItem;
                else
                    detailBase += rule.CalculateBase(item.MontoItem);
                detailTax += rule.CalculateTax(item.MontoItem);
            }
            catch (InvalidOperationException ex)
            {
                errors.Add($"Línea {item.NumeroLinea}: {ex.Message}");
            }
        }

        detailTotal = DecimalMath.Round2(detailTotal);
        detailBase = DecimalMath.Round2(detailBase);
        detailTax = DecimalMath.Round2(detailTax);
        detailExempt = DecimalMath.Round2(detailExempt);

        Compare(errors, "Suma MontoItem", detailTotal, invoice.ValorPagar, options.TotalTolerance);
        Compare(errors, "MontoTotal", invoice.MontoTotal, invoice.ValorPagar, options.TotalTolerance);
        Compare(errors, "MontoPago", invoice.MontoPago, invoice.ValorPagar, options.TotalTolerance);
        Compare(errors, "MontoGravadoTotal", detailBase, invoice.MontoGravadoTotal, options.TotalTolerance);
        Compare(errors, "MontoExento", detailExempt, invoice.MontoExento, options.TotalTolerance);
        Compare(errors, "TotalITBIS", detailTax, invoice.TotalItbis, options.TotalTolerance);
        Compare(errors, "Gravado + Exento + ITBIS",
            invoice.MontoGravadoTotal + invoice.MontoExento + invoice.TotalItbis,
            invoice.ValorPagar, options.TotalTolerance);

        return errors;
    }

    public List<string> ValidateSet(IReadOnlyCollection<EcfInvoice> invoices, ImportOptions options)
    {
        List<string> errors = [];

        if (invoices.Count != options.ExpectedCount)
            errors.Add($"Se esperaban {options.ExpectedCount} XML y se encontraron {invoices.Count}.");

        IGrouping<string, EcfInvoice>[] duplicateENcfs = invoices
            .GroupBy(x => x.ENcf, StringComparer.OrdinalIgnoreCase)
            .Where(x => x.Count() > 1)
            .ToArray();

        foreach (IGrouping<string, EcfInvoice> duplicate in duplicateENcfs)
            errors.Add($"e-NCF duplicado en la carpeta: {duplicate.Key}.");

        if (options.RequireCompleteSequence)
        {
            HashSet<int> found = invoices.Select(x => x.ENcfSequence).ToHashSet();
            for (int sequence = options.ExpectedStartSequence;
                 sequence <= options.ExpectedEndSequence;
                 sequence++)
            {
                if (!found.Contains(sequence))
                    errors.Add($"Falta el e-NCF con secuencia {sequence}.");
            }
        }

        return errors;
    }

    private static void Compare(List<string> errors, string field,
        decimal calculated, decimal expected, decimal tolerance)
    {
        calculated = DecimalMath.Round2(calculated);
        expected = DecimalMath.Round2(expected);
        if (!DecimalMath.EqualsWithin(calculated, expected, tolerance))
            errors.Add($"{field} no cuadra. Calculado={calculated:N2}; XML={expected:N2}.");
    }
}
