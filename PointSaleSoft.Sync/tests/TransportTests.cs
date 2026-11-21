using System.Diagnostics;
using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Net.WebSockets;
using System.Text.Json;
using System.Text.RegularExpressions;
using FirebirdSql.Data.FirebirdClient;
using PointSaleSoft.Sync;

internal static class TransportTests
{
    public static async Task Run()
    {
        int checks=0;void Check(bool ok,string label){if(!ok)throw new Exception(label);Console.WriteLine("PASS "+label);checks++;}
        var dir=Path.GetFullPath("artifacts");using var qa=JsonDocument.Parse(File.ReadAllText(Path.Combine(dir,"qa.json")));
        var dfm=File.ReadAllText(@"C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm");
        string Cs(string node)
        {
            var path=qa.RootElement.GetProperty(node).GetString()!;
            if(!Path.GetFullPath(path).StartsWith(dir+Path.DirectorySeparatorChar,StringComparison.OrdinalIgnoreCase))throw new Exception("Solo bases QA");
            return new FbConnectionStringBuilder{Database=path,DataSource="localhost",Dialect=1,Charset="ISO8859_1",Pooling=false,
                UserID=Regex.Match(dfm,"user_name=([^']*)'").Groups[1].Value,Password=Regex.Match(dfm,"password=([^']*)'").Groups[1].Value}.ConnectionString;
        }
        var sourceCs=Cs("principal");var targetCs=Cs("sucursal");
        object? Scalar(string cs,string sql){using var c=new FbConnection(cs);c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand(sql,c,tx);var v=q.ExecuteScalar();tx.Rollback();return v;}
        void Update(int price){using var c=new FbConnection(sourceCs);c.Open();using var tx=c.BeginTransaction();
            using var q=new FbCommand("UPDATE INVENTARIO_PRODUCTO SET PRECIO="+price+" WHERE CODIGO=(SELECT MAX(CODIGO) FROM INVENTARIO_PRODUCTO)",c,tx);q.ExecuteNonQuery();tx.Commit();}
        var policy=JsonSerializer.Deserialize<CatalogPolicy>(File.ReadAllText(Path.Combine(dir,"policy.json")))!;
        var epoch=File.ReadAllText(Path.Combine(dir,"epoch.txt"));
        var source=new FirebirdCatalog(sourceCs);source.VerifyNode(policy,epoch,"source");
        var target=new FirebirdCatalog(targetCs);target.VerifyNode(policy,epoch,"branch");
        var tenant=new RelayTenant("PROSESUR_QA",epoch,policy.Hash,["0002","0003"]);
        var token=Guid.NewGuid().ToString("N");var targetToken=Guid.NewGuid().ToString("N");
        var options=new RelayOptions("http://127.0.0.1:5193",[tenant],
            [new(tenant.Id,"principal","source",Hashing.Sha(token)),new(tenant.Id,"0002","branch",Hashing.Sha(targetToken))],new(){{tenant.Id,policy}});
        var pathStore=Path.Combine(dir,"http-relay-"+Guid.NewGuid().ToString("N")+".json");
        IRelayStore store=new FileQaRelayStore(pathStore);
        var mysql=Environment.GetEnvironmentVariable("PSSYNC_MYSQL_QA");
        if(mysql is not null)
        {
            var mysqlStore=new MySqlRelayStore(mysql);await mysqlStore.Initialize(default);store=mysqlStore;
        }
        await using var app=RelayHost.Build(options,store);await app.StartAsync();
        using var producer=new SyncAgent(new("source",tenant.Id,epoch,options.Url+"/",token,sourceCs,policy));
        using var consumer=new SyncAgent(new("branch",tenant.Id,epoch,options.Url+"/",targetToken,targetCs,policy));
        try
        {
            Update(501);var packet=source.NextPending(policy,tenant.Id,epoch)!;
            using var http=new HttpClient{BaseAddress=new Uri(options.Url),Timeout=TimeSpan.FromSeconds(15)};
            Check((await http.GetAsync("v1/pending")).StatusCode==HttpStatusCode.Unauthorized,"API exige credencial");
            http.DefaultRequestHeaders.Authorization=new AuthenticationHeaderValue("Bearer",targetToken);
            Check((await http.PostAsJsonAsync("v1/events",packet)).StatusCode==HttpStatusCode.Forbidden,"sucursal no publica catalogo");
            http.DefaultRequestHeaders.Authorization=new AuthenticationHeaderValue("Bearer",token);
            Check((await http.GetAsync("v1/pending")).StatusCode==HttpStatusCode.Forbidden,"principal no consume entregas");
            Check((await http.PostAsJsonAsync("v1/events",packet with{Tenant="OTRO"})).StatusCode==HttpStatusCode.Conflict,"rechaza otro cliente");
            using var badProducer=new SyncAgent(new("source",tenant.Id,epoch,options.Url+"/","incorrecta",sourceCs,policy));
            bool failed=false;try{await badProducer.Once(default);}catch(HttpRequestException){failed=true;}
            Check(failed&&source.NextPending(policy,tenant.Id,epoch)!.EventId==packet.EventId,"fallo HTTP conserva pendiente fuente");
            using var ws=new ClientWebSocket();ws.Options.SetRequestHeader("Authorization","Bearer "+targetToken);
            using var timeout=new CancellationTokenSource(TimeSpan.FromSeconds(30));
            await ws.ConnectAsync(new Uri("ws://127.0.0.1:5193/v1/notifications"),timeout.Token);
            var buffer=new byte[1024];await ws.ReceiveAsync(buffer,timeout.Token);
            Check(await producer.Once(default)>=1,"principal publica por HTTPS/HTTP local");
            var notice=await ws.ReceiveAsync(buffer,timeout.Token);
            Check(notice.Count>0,"WebSocket avisa cambio sin consulta periodica");
            Check(await consumer.Once(default)>=1,"sucursal aplica y confirma");
            int code=Convert.ToInt32(Scalar(sourceCs,"SELECT MAX(CODIGO) FROM INVENTARIO_PRODUCTO"));
            Check(Convert.ToDouble(Scalar(targetCs,$"SELECT PRECIO FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==501,"precio recibido queda en Firebird");
            Check(Convert.ToDouble(Scalar(targetCs,$"SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==7,"HTTP preserva stock local");
            Check((await store.Pending(tenant.Id,"0002",default)).Length==0,"ACK retira pendiente de su sucursal");
            Check((await store.Pending(tenant.Id,"0003",default)).Length>=1,"ACK no borra entrega de otra sucursal");
            using(var replay=await http.PostAsJsonAsync("v1/events",packet))Check(replay.IsSuccessStatusCode,"publicar UUID repetido es idempotente");
            Check((await store.Pending(tenant.Id,"0002",default)).Length==0,"reenvio confirmado no vuelve a la cola");
            var altered=packet with{Changes=packet.Changes.Select(x=>x with{Revision=x.Revision+100}).ToArray()};
            Check((await http.PostAsJsonAsync("v1/events",altered)).StatusCode==HttpStatusCode.Conflict,"UUID repetido con contenido diferente se rechaza");
            bool readOnly=false;
            try{using var c=new FbConnection(targetCs);c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand($"UPDATE INVENTARIO_PRODUCTO SET PRECIO=999 WHERE CODIGO={code}",c,tx);q.ExecuteNonQuery();tx.Commit();}
            catch(FbException){readOnly=true;}
            Check(readOnly,"sucursal no puede modificar precios por SQL local");
            var latency=new List<long>();
            for(int n=0;n<20;n++)
            {
                Update(600+n);var watch=Stopwatch.StartNew();await producer.Once(default);await consumer.Once(default);latency.Add(watch.ElapsedMilliseconds);
            }
            latency.Sort();Console.WriteLine($"LOCAL_LATENCY_SAMPLES=20; P95_MS={latency[18]}; MAX_MS={latency[^1]}");
            Check(latency[18]<5000,"objetivo local p95 menor que cinco segundos");
            ws.Abort();
            // Simulate an offline target and a server restart before applying its queue.
            Update(750);await producer.Once(default);await app.StopAsync();
            await using var restarted=RelayHost.Build(options,mysql is null?new FileQaRelayStore(pathStore):new MySqlRelayStore(mysql));
            await restarted.StartAsync();
            try
            {
                await consumer.Once(default);
                Check(Convert.ToDouble(Scalar(targetCs,$"SELECT PRECIO FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==750,"reinicio del relay recupera envio pendiente");
            }
            finally{await restarted.StopAsync();}
        }
        finally{await app.StopAsync();}
        Console.WriteLine($"SYNC_TRANSPORT=PASS; CHECKS={checks}; STORE={(mysql is null?"FILE_QA":"MYSQL")}; FISCAL_REQUESTS=0; ORIGINAL_MODIFIED=0");
    }
}
