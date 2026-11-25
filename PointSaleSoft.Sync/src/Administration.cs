using System.Text.Json;

namespace PointSaleSoft.Sync;

public sealed record AdministrationOptions(
    string Tenant,
    string Role,
    string Directory,
    string? Epoch = null,
    CatalogPolicy? Policy = null,
    bool CentralizarCosto = false
);
public sealed record SnapshotManifest(string Tenant,string Epoch,CatalogPolicy Policy,Dictionary<string,int> Counts,string[] Hashes);

public static class Administration
{
    private static readonly JsonSerializerOptions Json=new(){WriteIndented=true};
    private static T Read<T>(string path)=>JsonSerializer.Deserialize<T>(File.ReadAllText(path))??throw new InvalidOperationException("Archivo vacio");
    public static void Run(string mode,string config)
    {
        var o=Read<AdministrationOptions>(config);
        if(string.IsNullOrWhiteSpace(o.Tenant) || o.Role is not ("source" or "branch"))throw new InvalidOperationException("Identidad invalida");
        var cs=Environment.GetEnvironmentVariable("PSSYNC_FIREBIRD")??
        throw new InvalidOperationException("Falta conexion privada Firebird");
        var catalog=new FirebirdCatalog(cs);
        var directory=Path.GetFullPath(o.Directory);
        if (mode == "init-source")
        {
            if (o.Role != "source")
                throw new InvalidOperationException("Requiere principal");

            // Validate the output before changing database metadata.
            if (System.IO.Directory.Exists(directory))
                throw new InvalidOperationException(
                    "El directorio de contrato ya existe");

            System.IO.Directory.CreateDirectory(directory);

            // Generar politica segun la configuracion de costos.
            var policy = catalog.DiscoverPolicy(o.CentralizarCosto);

            var epoch = catalog.Install(policy, "source", o.Epoch);

            File.WriteAllText(
                Path.Combine(directory, "source.json"),
                JsonSerializer.Serialize(
                    o with { Epoch = epoch, Policy = policy },
                    Json));

            Console.WriteLine("SYNC_SOURCE_INITIALIZED");
            return;
        }
        if(mode=="bootstrap")
        {
            if(o.Role!="branch")throw new InvalidOperationException("Requiere sucursal");
            var manifest=Read<SnapshotManifest>(Path.Combine(directory,"manifest.json"));
            if(manifest.Tenant!=o.Tenant || (o.Epoch is not null && o.Epoch!=manifest.Epoch) ||
                (o.Policy is not null && o.Policy.Hash!=manifest.Policy.Hash))throw new InvalidOperationException("Carga de otra identidad");
            manifest.Policy.Validate();
            var packets=Enumerable.Range(0,manifest.Hashes.Length).Select(i=>Read<Envelope>(Path.Combine(directory,$"packet-{i:D6}.json"))).ToArray();
            for(int i=0;i<packets.Length;i++)
            {
                packets[i].Validate(manifest.Policy,o.Tenant,manifest.Epoch);
                if(packets[i].Hash!=manifest.Hashes[i])throw new InvalidOperationException("Paquete alterado");
            }
            var counts=manifest.Policy.Tables.ToDictionary(t=>t.Name,t=>packets.SelectMany(p=>p.Changes).Count(c=>c.Table==t.Name));
            if(counts.Any(x=>!manifest.Counts.TryGetValue(x.Key,out var n)||n!=x.Value))throw new InvalidOperationException("Manifiesto incompleto");
            // A fresh destination must be entirely empty; existing nodes must match identity.
            catalog.PrepareBranch(manifest.Policy,manifest.Epoch);
            for(int i=0;i<packets.Length;i++)
            {
                catalog.Apply(manifest.Policy,packets[i],o.Tenant,manifest.Epoch);
                if((i+1)%50==0)Console.WriteLine("SYNC_BOOTSTRAP_PACKETS="+(i+1));
            }
            catalog.MarkReady(manifest.Policy,manifest.Epoch,manifest.Counts);
            Console.WriteLine("SYNC_BOOTSTRAP_READY");return;
        }
        if(mode=="init-empty-branch")
        {
            if(o.Role!="branch")throw new InvalidOperationException("Requiere sucursal");
            catalog.InitializeEmptyBranch();Console.WriteLine("SYNC_EMPTY_BRANCH_INITIALIZED");return;
        }
        var contract=o.Policy??throw new InvalidOperationException("Falta contrato");
        var identity=o.Epoch??throw new InvalidOperationException("Falta epoch");
        if(mode=="verify-clean")
        {
            if(o.Role!="branch")throw new InvalidOperationException("Requiere sucursal");
            Console.WriteLine(JsonSerializer.Serialize(catalog.VerifyCleanBranch(contract,identity),Json));return;
        }
        if(mode=="status")
        {
            Console.WriteLine(JsonSerializer.Serialize(catalog.Status(contract,identity,o.Role),Json));return;
        }
        if(mode!="export" || o.Role!="source")throw new InvalidOperationException("Modo administrativo invalido");
        if(System.IO.Directory.Exists(directory))throw new InvalidOperationException("La exportacion requiere directorio nuevo");
        var export=catalog.Export(contract,o.Tenant,identity);
        System.IO.Directory.CreateDirectory(directory);
        for(int i=0;i<export.Count;i++)File.WriteAllText(Path.Combine(directory,$"packet-{i:D6}.json"),export[i].Json);
        var totals=contract.Tables.ToDictionary(t=>t.Name,t=>export.SelectMany(e=>e.Changes).Count(c=>c.Table==t.Name));
        // Manifest is the completion marker. An interrupted export cannot be imported.
        File.WriteAllText(Path.Combine(directory,"manifest.json"),JsonSerializer.Serialize(new SnapshotManifest(o.Tenant,identity,contract,totals,export.Select(e=>e.Hash).ToArray()),Json));
        Console.WriteLine("SYNC_EXPORTED_PACKETS="+export.Count);
    }
}
