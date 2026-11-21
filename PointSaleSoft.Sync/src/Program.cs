using System.Text.Json;
using PointSaleSoft.Sync;

if(args.Length!=2 || args[0] is not ("relay" or "agent" or "init-source" or "init-empty-branch" or "bootstrap" or "export" or "status" or "verify-clean" or "maintenance"))
{
    Console.Error.WriteLine("Uso: PointSaleSoft.Sync relay|agent|init-source|init-empty-branch|bootstrap|export|status|verify-clean|maintenance archivo-config.json");return 2;
}
try
{
    if(args[0] is not ("relay" or "agent" or "maintenance")){Administration.Run(args[0],args[1]);return 0;}
    var json=await File.ReadAllTextAsync(args[1]);
    if(args[0] is "relay" or "maintenance")
    {
        var options=JsonSerializer.Deserialize<RelayOptions>(json) ?? throw new InvalidOperationException("Configuracion vacia");
        // Secrets are supplied to this process by the DPAPI launcher, not committed in JSON.
        var cs=Environment.GetEnvironmentVariable("PSSYNC_MYSQL");if(cs is not null)options=options with{MySqlConnectionString=cs};
        if(args[0]=="maintenance")
        {
            var store=new MySqlRelayStore(options.MySqlConnectionString??throw new InvalidOperationException("Se requiere MySQL"));
            await store.Initialize(default);
            foreach(var tenant in options.Tenants)Console.WriteLine("SYNC_PRUNED="+await store.PruneConfirmed(tenant.Id,30,default));
            return 0;
        }
        if(options.MySqlConnectionString is not null)await new MySqlRelayStore(options.MySqlConnectionString).Initialize(default);
        await RelayHost.Build(options).RunAsync();
    }
    else
    {
        var options=JsonSerializer.Deserialize<AgentOptions>(json) ?? throw new InvalidOperationException("Configuracion vacia");
        options=options with
        {
            Token=Environment.GetEnvironmentVariable("PSSYNC_TOKEN")??options.Token,
            FirebirdConnectionString=Environment.GetEnvironmentVariable("PSSYNC_FIREBIRD")??options.FirebirdConnectionString
        };
        using var agent=new SyncAgent(options);using var stop=new CancellationTokenSource();
        Console.CancelKeyPress+=(_,e)=>{e.Cancel=true;stop.Cancel();};
        await agent.Run(stop.Token);
    }
    return 0;
}
catch(Exception e){Console.Error.WriteLine("SYNC_START_FAILED "+e.GetType().Name);return 1;}
