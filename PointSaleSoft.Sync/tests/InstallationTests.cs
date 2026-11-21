using System.Text.Json;
using System.Text.RegularExpressions;
using FirebirdSql.Data.FirebirdClient;
using PointSaleSoft.Sync;

internal static class InstallationTests
{
    public static void Run()
    {
        var root=Path.GetFullPath("artifacts");
        using var qa=JsonDocument.Parse(File.ReadAllText(Path.Combine(root,"qa.json")));
        var dfm=File.ReadAllText(@"C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm");
        var policy=JsonSerializer.Deserialize<CatalogPolicy>(File.ReadAllText(Path.Combine(root,"policy.json")))!;
        var epoch=File.ReadAllText(Path.Combine(root,"epoch.txt"));
        int checks=0;
        void Reject(Action action,string label)
        {
            bool rejected=false;try{action();}catch(InvalidOperationException){rejected=true;}
            if(!rejected)throw new Exception(label);checks++;Console.WriteLine("PASS "+label);
        }
        foreach(var role in new[]{"source","branch"})
        {
            var path=qa.RootElement.GetProperty(role=="source"?"principal":"sucursal").GetString()!;
            if(!Path.GetFullPath(path).StartsWith(root+Path.DirectorySeparatorChar,StringComparison.OrdinalIgnoreCase))throw new Exception("Solo copias QA");
            var cs=new FbConnectionStringBuilder{Database=path,DataSource="localhost",Dialect=1,Charset="ISO8859_1",Pooling=false,
                UserID=Regex.Match(dfm,"user_name=([^']*)'").Groups[1].Value,Password=Regex.Match(dfm,"password=([^']*)'").Groups[1].Value}.ConnectionString;
            void Exec(string sql){using var c=new FbConnection(cs);c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand(sql,c,tx);q.ExecuteNonQuery();tx.Commit();}
            var catalog=new FirebirdCatalog(cs);catalog.VerifyNode(policy,epoch,role);
            var name=role=="source"?"PSSYNC_C_0":"PSSYNC_G_0";
            Exec($"ALTER TRIGGER {name} INACTIVE");
            try
            {
                Reject(()=>catalog.VerifyNode(policy,epoch,role),role+" agente rechaza trigger inactivo");
                Reject(()=>catalog.Install(policy,role,epoch),role+" instalacion repetida detecta componente incompleto");
                if(role=="branch")Reject(()=>catalog.MarkReady(policy,epoch,[]),"READY rechaza guardas incompletas");
            }
            finally{Exec($"ALTER TRIGGER {name} ACTIVE");}
            catalog.VerifyNode(policy,epoch,role);checks++;Console.WriteLine("PASS "+role+" recupera verificacion al restaurar trigger");
        }
        Console.WriteLine($"SYNC_INSTALLATION=PASS; CHECKS={checks}; ORIGINAL_MODIFIED=0");
    }
}
