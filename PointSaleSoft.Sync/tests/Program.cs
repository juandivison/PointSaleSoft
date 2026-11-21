using System.Diagnostics;
using System.Globalization;
using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;
using System.Text.RegularExpressions;
using FirebirdSql.Data.FirebirdClient;
using PointSaleSoft.Sync;

if(args.Contains("--mysql")){await MySqlTests.Run();return;}
if(args.Contains("--installation-only")){InstallationTests.Run();return;}
if(args.Contains("--bundle-only")){BundleTests.Run();return;}
if(args.Contains("--transport-only")){await TransportTests.Run();return;}
int checks=0;
void Check(bool condition,string name){if(!condition)throw new Exception(name);Console.WriteLine("PASS "+name);checks++;}
void Reject(Action action,string name){bool failed=false;try{action();}catch(InvalidOperationException){failed=true;}Check(failed,name);}
string work=Path.GetFullPath("artifacts");
using var qa=JsonDocument.Parse(File.ReadAllText(Path.Combine(work,"qa.json")));
string mainPath=qa.RootElement.GetProperty("principal").GetString()!,branchPath=qa.RootElement.GetProperty("sucursal").GetString()!;
foreach(var p in new[]{mainPath,branchPath})
    if(!Path.GetFullPath(p).StartsWith(work+Path.DirectorySeparatorChar,StringComparison.OrdinalIgnoreCase))throw new Exception("Solo bases aisladas dentro de artifacts");
if(mainPath==branchPath)throw new Exception("Destinos iguales");
string dfm=File.ReadAllText(@"C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm");
string Cs(string path)=>new FbConnectionStringBuilder{Database=path,DataSource="localhost",Dialect=1,Charset="ISO8859_1",Pooling=false,
    UserID=Regex.Match(dfm,"user_name=([^']*)'").Groups[1].Value,Password=Regex.Match(dfm,"password=([^']*)'").Groups[1].Value}.ConnectionString;
var mainCs=Cs(mainPath);var branchCs=Cs(branchPath);
object? Scalar(string cs,string sql)
{
    using var c=new FbConnection(cs);c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand(sql,c,tx);
    var result=q.ExecuteScalar();tx.Rollback();return result;
}
void Sql(string cs,string sql)
{
    using var c=new FbConnection(cs);c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand(sql,c,tx);q.ExecuteNonQuery();tx.Commit();
}
var main=new FirebirdCatalog(mainCs);var branch=new FirebirdCatalog(branchCs);
var policy=main.DiscoverPolicy();Check(policy.Tables.Any(t=>t.Name=="PRECIO_UNIDADSURTIDORA"),"incluye precios por unidad");
Check(!policy.Table("INVENTARIO_PRODUCTO").Fields.Contains("CANTIDAD"),"stock fuera del contrato");
Check(policy.Table("UNIDADES").Fields.Contains("CANTIDAD"),"factor de conversion dentro del contrato");
Reject(()=>new CatalogPolicy([new("INVENTARIO_PRODUCTO",["CODIGO"],["CODIGO","CANTIDAD"],0)]).Validate(),"rechaza contrato que copie stock");
Reject(()=>SqlName.Check("INVENTARIO_PRODUCTO;DROP"),"rechaza nombres SQL arbitrarios");
branch.ValidateSchema(policy);
Check(Convert.ToInt32(Scalar(branchCs,"SELECT COUNT(*) FROM VENTAS_MAST"))==0,"sucursal sin ventas antes de carga");
if(Convert.ToInt32(Scalar(branchCs,"SELECT COUNT(*) FROM RDB$RELATIONS WHERE RDB$RELATION_NAME='PSSYNC_META'"))==0)branch.InitializeEmptyBranch();
var epoch=main.Install(policy,"source");branch.Install(policy,"branch",epoch);
File.WriteAllText(Path.Combine(work,"policy.json"),JsonSerializer.Serialize(policy,new JsonSerializerOptions{WriteIndented=true}));
File.WriteAllText(Path.Combine(work,"epoch.txt"),epoch);
Check(main.Install(policy,"source")==epoch,"instalacion repetida conserva identidad");
Reject(()=>branch.Install(policy,"source"),"impide invertir roles de las bases");
var baseline=main.Export(policy,"PROSESUR_QA",epoch);
Console.WriteLine("BOOTSTRAP_PACKETS="+baseline.Count);
var watch=Stopwatch.StartNew();int index=0;
foreach(var packet in baseline){branch.Apply(policy,packet,"PROSESUR_QA",epoch);if(++index%50==0)Console.WriteLine("BOOTSTRAP_APPLIED="+index);}
Console.WriteLine("BOOTSTRAP_SECONDS="+watch.Elapsed.TotalSeconds.ToString("F2",CultureInfo.InvariantCulture));
foreach(var t in policy.Tables)
    Check(Convert.ToInt32(Scalar(mainCs,$"SELECT COUNT(*) FROM {t.Name}"))==Convert.ToInt32(Scalar(branchCs,$"SELECT COUNT(*) FROM {t.Name}")),"cantidad inicial "+t.Name);
Check(Convert.ToInt32(Scalar(branchCs,"SELECT COUNT(*) FROM INVENTARIO_PRODUCTO WHERE CANTIDAD<>0 OR BLCE_CANT_ENTRADA<>0 OR BLCE_CANT_SALIDA<>0"))==0,"existencias y acumulados iniciales cero");
Check(Convert.ToInt32(Scalar(branchCs,"SELECT COUNT(*) FROM VENTAS_MAST"))==0,"carga no crea ventas");
branch.MarkReady(policy,epoch,policy.Tables.ToDictionary(t=>t.Name,t=>baseline.SelectMany(e=>e.Changes).Count(c=>c.Table==t.Name)));
Reject(()=>main.Apply(policy,baseline[0],"PROSESUR_QA",epoch),"impide aplicar cambios en la principal por error de configuracion");
Check(!branch.Apply(policy,baseline[0],"PROSESUR_QA",epoch),"repetir carga no duplica filas");
var changedPayload=baseline[0] with{Tenant="OTRO"};Reject(()=>branch.Apply(policy,changedPayload,"PROSESUR_QA",epoch),"aislamiento de cliente");

int code=Convert.ToInt32(Scalar(mainCs,"SELECT MAX(CODIGO) FROM INVENTARIO_PRODUCTO"))+100;
string tag="SYNCQA"+Guid.NewGuid().ToString("N")[..12];
Sql(mainCs,$"INSERT INTO INVENTARIO_PRODUCTO(CODIGO,CODIGO_TEXTO,CODIGO_BARRA,DESCRIPCION,TIPO,STATUS,CANTIDAD,BLCE_CANT_ENTRADA,BLCE_CANT_SALIDA,PRECIO) VALUES({code},'{tag}','{tag}','Prueba sincronizacion',1,'A',50,70,20,123.45)");
var first=main.NextPending(policy,"PROSESUR_QA",epoch)!;Check(first is not null,"trigger registra alta");
Check(first!.Changes.Single(c=>c.Table=="INVENTARIO_PRODUCTO").Values.ContainsKey("PRECIO"),"captura incluye precio");
Check(!first.Changes.Single(c=>c.Table=="INVENTARIO_PRODUCTO").Values.ContainsKey("CANTIDAD"),"captura excluye stock fuente");
branch.Apply(policy,first,"PROSESUR_QA",epoch);main.Published(first.EventId);
Check(Convert.ToDouble(Scalar(branchCs,$"SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==0,"producto nuevo nace con cero stock");
Sql(branchCs,$"UPDATE INVENTARIO_PRODUCTO SET CANTIDAD=7,BLCE_CANT_ENTRADA=9,BLCE_CANT_SALIDA=2,PRECIO_COMPRA=40 WHERE CODIGO={code}");
Sql(mainCs,$"UPDATE INVENTARIO_PRODUCTO SET DESCRIPCION='Descripcion nueva',PRECIO=200 WHERE CODIGO={code}");
var second=main.NextPending(policy,"PROSESUR_QA",epoch)!;
Sql(mainCs,$"UPDATE INVENTARIO_PRODUCTO SET PRECIO=300 WHERE CODIGO={code}");
Check(main.NextPending(policy,"PROSESUR_QA",epoch)!.Hash==second.Hash,"reintento conserva cuerpo congelado aunque cambie origen");
main.Published(second.EventId);var third=main.NextPending(policy,"PROSESUR_QA",epoch)!;
branch.Apply(policy,third,"PROSESUR_QA",epoch);main.Published(third.EventId);
branch.Apply(policy,second,"PROSESUR_QA",epoch);
Check(Convert.ToDouble(Scalar(branchCs,$"SELECT PRECIO FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==300,"envio antiguo no retrocede precio");
Check(Convert.ToString(Scalar(branchCs,$"SELECT DESCRIPCION FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))=="Descripcion nueva","actualiza descripcion sin conflicto falso");
Check(Convert.ToDouble(Scalar(branchCs,$"SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==7,"precio nuevo preserva existencias locales");
Check(Convert.ToDouble(Scalar(branchCs,$"SELECT PRECIO_COMPRA FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==40,"preserva costo local");
Check(!branch.Apply(policy,third,"PROSESUR_QA",epoch),"reenvio no repite aplicacion");
var before=Convert.ToInt32(Scalar(mainCs,"SELECT COUNT(*) FROM PSSYNC_OUTBOX"));
Sql(mainCs,$"UPDATE INVENTARIO_PRODUCTO SET CANTIDAD=CANTIDAD-1 WHERE CODIGO={code}");
Check(Convert.ToInt32(Scalar(mainCs,"SELECT COUNT(*) FROM PSSYNC_OUTBOX"))==before,"venta que cambia stock no genera envio de catalogo");
using(var c=new FbConnection(mainCs))
{
    c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand($"UPDATE INVENTARIO_PRODUCTO SET PRECIO=999 WHERE CODIGO={code}",c,tx);q.ExecuteNonQuery();tx.Rollback();
}
Check(Convert.ToInt32(Scalar(mainCs,"SELECT COUNT(*) FROM PSSYNC_OUTBOX"))==before,"rollback comercial tampoco deja evento");

var relayTenant=new RelayTenant("PROSESUR_QA",epoch,policy.Hash,["0002","0003"]);
var storePath=Path.Combine(work,"relay-"+Guid.NewGuid().ToString("N")+".json");
var store=new FileQaRelayStore(storePath);
await store.Publish(third,relayTenant,default);await store.Publish(third,relayTenant,default);
Check((await store.Pending("PROSESUR_QA","0002",default)).Length==1,"relay no duplica publicacion");
await store.Ack("PROSESUR_QA","0002",third.EventId,default);
Check((await store.Pending("PROSESUR_QA","0003",default)).Length==1,"primera confirmacion no borra envio de otra sucursal");
store=new FileQaRelayStore(storePath);Check((await store.Pending("PROSESUR_QA","0003",default)).Length==1,"reinicio del relay conserva pendientes");
await store.Ack("PROSESUR_QA","0003",third.EventId,default);
Check(!File.ReadAllText(storePath).Contains("Descripcion nueva",StringComparison.Ordinal),"ultima confirmacion purga contenido");
await store.Publish(third,relayTenant,default);
Check((await store.Pending("PROSESUR_QA","0003",default)).Length==0,"reenvio tras purga no resucita evento confirmado");

var sourceToken=Guid.NewGuid().ToString("N");var branchToken=Guid.NewGuid().ToString("N");
var options=new RelayOptions("http://127.0.0.1:5193",[relayTenant],
    [new("PROSESUR_QA","principal","source",Hashing.Sha(sourceToken)),new("PROSESUR_QA","0002","branch",Hashing.Sha(branchToken))],
    new(){{"PROSESUR_QA",policy}});
await using var app=RelayHost.Build(options,store);await app.StartAsync();
try
{
    using var http=new HttpClient{BaseAddress=new Uri(options.Url)};
    Check((await http.GetAsync("/v1/pending")).StatusCode==HttpStatusCode.Unauthorized,"API exige credencial");
    http.DefaultRequestHeaders.Authorization=new AuthenticationHeaderValue("Bearer",branchToken);
    Check((await http.PostAsJsonAsync("/v1/events",third)).StatusCode==HttpStatusCode.Forbidden,"sucursal no puede publicar cambios");
    http.DefaultRequestHeaders.Authorization=new AuthenticationHeaderValue("Bearer",sourceToken);
    Check((await http.GetAsync("/v1/pending")).StatusCode==HttpStatusCode.Forbidden,"principal no consume cola de sucursal");
    Check((await http.PostAsJsonAsync("/v1/events",third with{Tenant="OTRO"})).StatusCode==HttpStatusCode.Conflict,"API rechaza cruce de cliente");
    Sql(mainCs,$"UPDATE INVENTARIO_PRODUCTO SET PRECIO=401 WHERE CODIGO={code}");
    using var producer=new SyncAgent(new("source","PROSESUR_QA",epoch,options.Url+"/",sourceToken,mainCs,policy));
    using var consumer=new SyncAgent(new("branch","PROSESUR_QA",epoch,options.Url+"/",branchToken,branchCs,policy));
    watch.Restart();Check(await producer.Once(default)>=1,"agente principal publica por HTTP");
    Check(await consumer.Once(default)>=1,"agente sucursal aplica y confirma por HTTP");
    Check(Convert.ToDouble(Scalar(branchCs,$"SELECT PRECIO FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==401,"precio HTTP real persistido en Firebird");
    Console.WriteLine("HTTP_APPLY_MILLISECONDS="+watch.ElapsedMilliseconds);
    Check(Convert.ToDouble(Scalar(branchCs,$"SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==7,"flujo HTTP conserva stock local");
}
finally{await app.StopAsync();}
Console.WriteLine($"SYNC_QA=PASS; CHECKS={checks}; ORIGINAL_MODIFIED=0; FISCAL_REQUESTS=0");
