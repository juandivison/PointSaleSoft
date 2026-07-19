using System.Globalization;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using PointSaleSoft.XmlSalesImporter.Models;

namespace PointSaleSoft.XmlSalesImporter.Parsing;

public sealed partial class EcfXmlReader
{
    private static readonly CultureInfo Invariant = CultureInfo.InvariantCulture;

    public EcfInvoice Read(string filePath)
    {
        XDocument document = XDocument.Load(filePath, LoadOptions.PreserveWhitespace);
        XElement root = document.Root ?? throw new InvalidDataException("El XML no contiene el elemento ECF.");
        XElement header = Required(root, "Encabezado");
        XElement idDoc = Required(header, "IdDoc");
        XElement emitter = Required(header, "Emisor");
        XElement totals = Required(header, "Totales");

        string eNcf = Text(idDoc, "eNCF");
        Match nameMatch = FileNamePattern().Match(Path.GetFileName(filePath));
        int? originalTrn = nameMatch.Success
            ? ParseInt(nameMatch.Groups["trn"].Value, "TRN del nombre del archivo")
            : null;

        int sequence = ParseENcfSequence(eNcf);
        if (nameMatch.Success)
        {
            int fileSequence = ParseInt(nameMatch.Groups["seq"].Value,
                "secuencia e-NCF del nombre del archivo");
            if (fileSequence != sequence)
                throw new InvalidDataException(
                    $"La secuencia del nombre ({fileSequence}) no coincide con el e-NCF ({sequence}).");

            string fileType = nameMatch.Groups["type"].Value;
            string xmlType = Text(idDoc, "TipoeCF");
            if (!string.Equals(fileType, xmlType, StringComparison.Ordinal))
                throw new InvalidDataException(
                    $"El tipo del nombre (E{fileType}) no coincide con TipoeCF ({xmlType}).");
        }
        List<EcfPaymentForm> payments = idDoc
            .Element("TablaFormasPago")?
            .Elements("FormaDePago")
            .Select(x => new EcfPaymentForm
            {
                FormaPago = ParseInt(Text(x, "FormaPago"), "FormaPago"),
                MontoPago = ParseDecimal(Text(x, "MontoPago"), "MontoPago")
            })
            .ToList() ?? [];

        XElement itemRoot = Required(root, "DetallesItems");
        List<EcfItem> items = itemRoot.Elements("Item")
            .Select(x => new EcfItem
            {
                NumeroLinea = ParseInt(Text(x, "NumeroLinea"), "NumeroLinea"),
                IndicadorFacturacion = ParseInt(Text(x, "IndicadorFacturacion"), "IndicadorFacturacion"),
                CodigoProducto = Text(x, "NombreItem").Trim(),
                IndicadorBienServicio = ParseInt(Text(x, "IndicadorBienoServicio"), "IndicadorBienoServicio"),
                Descripcion = Text(x, "DescripcionItem").Trim(),
                Cantidad = ParseDecimal(Text(x, "CantidadItem"), "CantidadItem"),
                PrecioUnitario = ParseDecimal(Text(x, "PrecioUnitarioItem"), "PrecioUnitarioItem"),
                MontoItem = ParseDecimal(Text(x, "MontoItem"), "MontoItem")
            })
            .OrderBy(x => x.NumeroLinea)
            .ToList();

        string? dueDateText = idDoc.Element("FechaLimitePago")?.Value.Trim();

        return new EcfInvoice
        {
            FilePath = filePath,
            FileName = Path.GetFileName(filePath),
            TipoEcf = Text(idDoc, "TipoeCF"),
            ENcf = eNcf,
            ENcfSequence = sequence,
            OriginalTransactionNumber = originalTrn,
            TipoIngreso = ParseInt(Text(idDoc, "TipoIngresos"), "TipoIngresos"),
            TipoPago = OptionalInt(idDoc, "TipoPago"),
            FechaEmision = ParseDate(Text(emitter, "FechaEmision"), "FechaEmision"),
            FechaLimitePago = string.IsNullOrWhiteSpace(dueDateText)
                ? null
                : ParseDate(dueDateText, "FechaLimitePago"),
            FechaHoraFirma = ParseDateTime(Text(root, "FechaHoraFirma"), "FechaHoraFirma"),
            RncEmisor = Text(emitter, "RNCEmisor"),
            MontoGravadoTotal = OptionalDecimal(totals, "MontoGravadoTotal"),
            MontoExento = OptionalDecimal(totals, "MontoExento"),
            TotalItbis = OptionalDecimal(totals, "TotalITBIS"),
            MontoTotal = ParseDecimal(Text(totals, "MontoTotal"), "MontoTotal"),
            ValorPagar = OptionalDecimal(totals, "ValorPagar", ParseDecimal(Text(totals, "MontoTotal"), "MontoTotal")),
            HasSignatureNode = root.Descendants().Any(x => x.Name.LocalName == "Signature"),
            PaymentForms = payments,
            Items = items
        };
    }

    private static XElement Required(XElement parent, string name) =>
        parent.Element(name) ?? throw new InvalidDataException($"No se encontró el elemento obligatorio {name}.");

    private static string Text(XElement parent, string name) =>
        Required(parent, name).Value.Trim();


    private static decimal OptionalDecimal(XElement parent, string name, decimal defaultValue = 0m)
    {
        string? value = parent.Element(name)?.Value.Trim();
        return string.IsNullOrWhiteSpace(value)
            ? defaultValue
            : ParseDecimal(value, name);
    }

    private static int OptionalInt(XElement parent, string name, int defaultValue = 0)
    {
        string? value = parent.Element(name)?.Value.Trim();
        return string.IsNullOrWhiteSpace(value)
            ? defaultValue
            : ParseInt(value, name);
    }

    private static decimal ParseDecimal(string value, string field)
    {
        if (!decimal.TryParse(value, NumberStyles.Number, Invariant, out decimal result))
            throw new InvalidDataException($"{field} contiene un decimal inválido: {value}");
        return result;
    }

    private static int ParseInt(string value, string field)
    {
        if (!int.TryParse(value, NumberStyles.Integer, Invariant, out int result))
            throw new InvalidDataException($"{field} contiene un entero inválido: {value}");
        return result;
    }

    private static DateTime ParseDate(string value, string field)
    {
        if (!DateTime.TryParseExact(value, "dd-MM-yyyy", Invariant,
                DateTimeStyles.None, out DateTime result))
            throw new InvalidDataException($"{field} contiene una fecha inválida: {value}");
        return result;
    }

    private static DateTime ParseDateTime(string value, string field)
    {
        string[] formats = ["dd-MM-yyyy HH:mm:ss", "dd-MM-yyyy H:mm:ss"];
        if (!DateTime.TryParseExact(value, formats, Invariant,
                DateTimeStyles.None, out DateTime result))
            throw new InvalidDataException($"{field} contiene una fecha/hora inválida: {value}");
        return result;
    }

    private static int ParseENcfSequence(string eNcf)
    {
        Match match = ENcfPattern().Match(eNcf);
        if (!match.Success)
            throw new InvalidDataException(
                $"El e-NCF no tiene el formato E seguido del tipo y 10 dígitos: {eNcf}");

        return ParseInt(match.Groups["seq"].Value, "secuencia e-NCF");
    }

    [GeneratedRegex(@"^Factura_E(?<type>\d{2})_(?<seq>\d+)TRN(?<trn>\d+)_(?:signed|firmado)\.xml$", RegexOptions.IgnoreCase)]
    private static partial Regex FileNamePattern();

    [GeneratedRegex(@"^E(?<type>\d{2})(?<seq>\d{10})$", RegexOptions.IgnoreCase)]
    private static partial Regex ENcfPattern();
}
