using System.Globalization;
using System.Text;
using PointSaleSoft.XmlSalesImporter.Models;

namespace PointSaleSoft.XmlSalesImporter.Utilities;

public static class ImportLogWriter
{
    public static string Write(string folder, IReadOnlyCollection<ImportResult> results)
    {
        Directory.CreateDirectory(folder);
        string filePath = Path.Combine(folder,
            $"carga_xml_{DateTime.Now:yyyyMMdd_HHmmss}.csv");

        StringBuilder csv = new();
        csv.AppendLine("Archivo;eNCF;FormaPago;Monto;TRN_XML;TRN_GENERADO;NUMERO_FACTURA;Estado;Mensaje;Advertencias");

        foreach (ImportResult result in results)
        {
            csv.Append(Escape(result.FileName)).Append(';')
               .Append(Escape(result.ENcf)).Append(';')
               .Append(Escape(result.PaymentType)).Append(';')
               .Append(result.Amount.ToString("0.00", CultureInfo.InvariantCulture)).Append(';')
               .Append(result.OriginalTransactionNumber?.ToString(CultureInfo.InvariantCulture) ?? string.Empty).Append(';')
               .Append(result.GeneratedTransactionNumber?.ToString(CultureInfo.InvariantCulture) ?? string.Empty).Append(';')
               .Append(result.InvoiceNumber?.ToString(CultureInfo.InvariantCulture) ?? string.Empty).Append(';')
               .Append(result.Status).Append(';')
               .Append(Escape(result.Message)).Append(';')
               .Append(Escape(string.Join(" | ", result.Warnings)))
               .AppendLine();
        }

        File.WriteAllText(filePath, csv.ToString(), new UTF8Encoding(true));
        return filePath;
    }

    private static string Escape(string value)
    {
        value = value.Replace("\"", "\"\"");
        return $"\"{value}\"";
    }
}
