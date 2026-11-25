using System.Globalization;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;

namespace PointSaleSoft.Sync;

public sealed record Cell(string Type, string? Value)
{
    public static Cell From(object? value) => value switch
    {
        null or DBNull => new("null", null),
        short or int or long => new("int", Convert.ToString(value, CultureInfo.InvariantCulture)),
        decimal v => new("decimal", v.ToString(CultureInfo.InvariantCulture)),
        double v => new("double", v.ToString("R", CultureInfo.InvariantCulture)),
        float v => new("double", v.ToString("R", CultureInfo.InvariantCulture)),
        DateTime v => new("date", v.ToString("yyyy-MM-dd HH:mm:ss.ffff", CultureInfo.InvariantCulture)),
        string v => new("text", v),
        _ => throw new InvalidOperationException("Tipo de dato no permitido en catalogo: " + value.GetType().Name)
    };
    public object ToValue() => Type switch
    {
        "null" when Value is null => DBNull.Value,
        "int" => long.Parse(Value!, CultureInfo.InvariantCulture),
        "decimal" => decimal.Parse(Value!, CultureInfo.InvariantCulture),
        "double" => double.Parse(Value!, CultureInfo.InvariantCulture),
        "date" => DateTime.ParseExact(Value!, "yyyy-MM-dd HH:mm:ss.ffff", CultureInfo.InvariantCulture),
        "text" => Value ?? throw new InvalidOperationException("Texto nulo"),
        _ => throw new InvalidOperationException("Tipo de celda invalido")
    };
}

public sealed record TablePolicy(string Name, string[] Keys, string[] Fields, int Order);
public sealed record CatalogPolicy(TablePolicy[] Tables)
{
    public string Hash => Hashing.Sha(JsonSerializer.Serialize(Tables.OrderBy(x => x.Order).ThenBy(x => x.Name)));
    public TablePolicy Table(string name) => Tables.SingleOrDefault(x => x.Name == name)
        ?? throw new InvalidOperationException("Tabla fuera del catalogo: " + name);
    public void Validate()
    {
        if (Tables.Length == 0 || Tables.Select(t => t.Name).Distinct().Count() != Tables.Length)
            throw new InvalidOperationException("Contrato vacio o duplicado");
        foreach (var t in Tables)
        {
            SqlName.Check(t.Name);
            if(!KnownTables.Contains(t.Name))throw new InvalidOperationException("Tabla no autorizada para distribucion");
            if (t.Keys.Length is < 1 or > 3 || t.Fields.Distinct().Count() != t.Fields.Length)
                throw new InvalidOperationException("Claves o campos invalidos");
            foreach (var f in t.Fields.Concat(t.Keys)) SqlName.Check(f);
            if (t.Keys.Any(k => !t.Fields.Contains(k))) throw new InvalidOperationException("Clave ausente del contrato");
            if (t.Name == "INVENTARIO_PRODUCTO" && t.Fields.Any(ProtectedFields.Contains))
                throw new InvalidOperationException("El contrato intenta distribuir datos locales");
        }
    }
    public static readonly HashSet<string> ProtectedFields = new(StringComparer.Ordinal)
    { "CANTIDAD", "BLCE_CANT_ENTRADA", "BLCE_CANT_SALIDA", "PRECIO_ANT",
      "FECHA_ULTIMA_TRN", "FOTO", "RUTAIMAGEN", "CANTIDAD_REORDEN", "UBICACION", "KILOMETROS",
      "AUD_COD_USUARIO", "AUD_APP_USER", "AUD_PC_NAME" };
    public static readonly HashSet<string> KnownTables = new(StringComparer.Ordinal)
    { "TIPO_INVENTARIO","INVENTARIO_CATEGORIA","INVENTARIO_SUBCATEGORIA","UNIDADES","MONEDA","MONEDA_DET",
      "TASA_ITBIS","TIPO_PRECIO","INVENTARIO_PRODUCTO","PRECIO_UNIDADSURTIDORA","PRECIO_INVENTARIO","CLASIF_PRECIO" };
}

public sealed record CatalogChange(string Table, string[] Key, long Revision, bool Deleted,
    Dictionary<string, Cell> Values);
public sealed record Envelope(Guid EventId, string Tenant, string Epoch, string PolicyHash,
    CatalogChange[] Changes)
{
    [System.Text.Json.Serialization.JsonIgnore]
    public string Json => JsonSerializer.Serialize(this);
    [System.Text.Json.Serialization.JsonIgnore]
    public string Hash => Hashing.Sha(Json);
    public void Validate(CatalogPolicy policy, string tenant, string epoch)
    {
        policy.Validate();
        if (EventId == Guid.Empty || Tenant != tenant || Epoch != epoch || PolicyHash != policy.Hash)
            throw new InvalidOperationException("Identidad o contrato del envio no coincide");
        if (Changes.Length is < 1 or > 500) throw new InvalidOperationException("Tamano de lote invalido");
        foreach (var c in Changes)
        {
            var t = policy.Table(c.Table);
            if (c.Revision < 0 || c.Key.Length != t.Keys.Length || c.Key.Any(k => k.Length > 80 || k.Contains('\u001f')))
                throw new InvalidOperationException("Identidad de fila invalida");
            if (c.Values.Keys.Any(f => !t.Fields.Contains(f))) throw new InvalidOperationException("Campo no autorizado");
            if (!c.Deleted && t.Fields.Any(f => !c.Values.ContainsKey(f))) throw new InvalidOperationException("Fila incompleta");
            if (!c.Deleted)
                for (int i = 0; i < t.Keys.Length; i++)
                    if (c.Values[t.Keys[i]].Value?.TrimEnd() != c.Key[i]) throw new InvalidOperationException("Clave no corresponde a los datos");
        }
    }
}

public static class Hashing
{
    public static string Sha(string text) => Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(text))).ToLowerInvariant();
}
public static partial class SqlName
{
    [GeneratedRegex("^[A-Z][A-Z0-9_]{0,30}$", RegexOptions.CultureInvariant)]
    private static partial Regex Identifier();
    public static string Check(string s) => Identifier().IsMatch(s) ? s : throw new InvalidOperationException("Identificador SQL invalido");
}
