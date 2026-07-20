using System.Globalization;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;
using PointSaleSoft.XmlSalesImporter.Models;

namespace PointSaleSoft.XmlSalesImporter.Parsing;

public sealed partial class EcfXmlReader
{
    public bool TryReadFileIdentity(string filePath, out EcfFileIdentity? identity)
    {
        string fileName = Path.GetFileName(filePath);

        // Formato normal:
        // Factura_E32_50907TRN51248_signed.xml
        Match standardMatch = FileNamePattern().Match(fileName);
        if (standardMatch.Success)
        {
            identity = CreateIdentity(
                filePath,
                standardMatch.Groups["type"].Value,
                standardMatch.Groups["seq"].Value,
                standardMatch.Groups["trn"].Value);
            return true;
        }

        // Formato alternativo usado por la descarga de recuperación:
        // Factura_E32_320000035097_signed.xml
        // El bloque numérico equivale al e-NCF sin la letra inicial E:
        // 32 + secuencia de 10 dígitos.
        Match recoveryMatch = RecoveryFileNamePattern().Match(fileName);
        if (recoveryMatch.Success)
        {
            string declaredType = recoveryMatch.Groups["type"].Value;
            string embeddedType = recoveryMatch.Groups["embeddedType"].Value;

            if (!string.Equals(
                    declaredType,
                    embeddedType,
                    StringComparison.Ordinal))
            {
                identity = null;
                return false;
            }

            identity = CreateIdentity(
                filePath,
                declaredType,
                recoveryMatch.Groups["seq"].Value,
                transactionText: null);
            return true;
        }

        // Compatibilidad con nombres históricos que contienen e-NCF y TRN,
        // aunque agreguen otros textos entre ambos valores.
        Match reportMatch = ReportFileIdentityPattern().Match(fileName);
        if (reportMatch.Success)
        {
            identity = CreateIdentity(
                filePath,
                reportMatch.Groups["type"].Value,
                reportMatch.Groups["seq"].Value,
                reportMatch.Groups["trn"].Value);
            return true;
        }

        identity = null;
        return false;
    }

    private static EcfFileIdentity CreateIdentity(
        string filePath,
        string ecfType,
        string sequenceText,
        string? transactionText)
    {
        return new EcfFileIdentity
        {
            FilePath = filePath,
            FileName = Path.GetFileName(filePath),
            EcfType = ecfType,
            Sequence = ParseInt(
                sequenceText,
                "secuencia e-CF del nombre del archivo"),
            TransactionNumber = string.IsNullOrWhiteSpace(transactionText)
                ? null
                : ParseInt(
                    transactionText,
                    "TRN del nombre del archivo")
        };
    }

    private static readonly CultureInfo Invariant = CultureInfo.InvariantCulture;

    public DateTime ReadFechaEmision(string filePath)
    {
        XmlReaderSettings settings = new()
        {
            DtdProcessing = DtdProcessing.Prohibit,
            IgnoreComments = true,
            IgnoreWhitespace = true,
            CloseInput = true
        };

        using FileStream stream = new(
            filePath,
            FileMode.Open,
            FileAccess.Read,
            FileShare.Read,
            bufferSize: 16 * 1024,
            options: FileOptions.SequentialScan);
        using XmlReader reader = XmlReader.Create(stream, settings);

        while (reader.Read())
        {
            if (reader.NodeType != XmlNodeType.Element ||
                !string.Equals(
                    reader.LocalName,
                    "FechaEmision",
                    StringComparison.Ordinal))
            {
                continue;
            }

            string value = reader.ReadElementContentAsString().Trim();
            return ParseDate(value, "FechaEmision");
        }

        throw new InvalidDataException(
            "No se encontró el elemento obligatorio FechaEmision.");
    }

    public EcfInvoice Read(string filePath)
    {
        XDocument document = XDocument.Load(filePath, LoadOptions.PreserveWhitespace);
        XElement root = document.Root ?? throw new InvalidDataException("El XML no contiene el elemento ECF.");
        XElement header = Required(root, "Encabezado");
        XElement idDoc = Required(header, "IdDoc");
        XElement emitter = Required(header, "Emisor");
        XElement totals = Required(header, "Totales");

        string eNcf = Text(idDoc, "eNCF");
        TryReadFileIdentity(filePath, out EcfFileIdentity? fileIdentity);
        int? originalTrn = fileIdentity?.TransactionNumber;

        int sequence = ParseENcfSequence(eNcf);
        if (fileIdentity is not null)
        {
            if (fileIdentity.Sequence != sequence)
            {
                throw new InvalidDataException(
                    $"La secuencia del nombre ({fileIdentity.Sequence}) no coincide " +
                    $"con el e-NCF ({sequence}).");
            }

            string xmlType = Text(idDoc, "TipoeCF");
            if (!string.Equals(
                    fileIdentity.EcfType,
                    xmlType,
                    StringComparison.Ordinal))
            {
                throw new InvalidDataException(
                    $"El tipo del nombre (E{fileIdentity.EcfType}) no coincide " +
                    $"con TipoeCF ({xmlType}).");
            }

            if (!string.Equals(
                    fileIdentity.ENcf,
                    eNcf,
                    StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidDataException(
                    $"El e-NCF derivado del nombre ({fileIdentity.ENcf}) no coincide " +
                    $"con el e-NCF del XML ({eNcf}).");
            }
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

    [GeneratedRegex(@"^Factura_E(?<type>\d{2})_(?<embeddedType>\d{2})(?<seq>\d{10})_(?:signed|firmado)\.xml$", RegexOptions.IgnoreCase)]
    private static partial Regex RecoveryFileNamePattern();

    [GeneratedRegex(@"E(?<type>\d{2})[_-]?(?<seq>\d+).*TRN(?<trn>\d+).*(?:signed|firmado)\.xml$", RegexOptions.IgnoreCase)]
    private static partial Regex ReportFileIdentityPattern();

    [GeneratedRegex(@"^E(?<type>\d{2})(?<seq>\d{10})$", RegexOptions.IgnoreCase)]
    private static partial Regex ENcfPattern();
}
