using System.Reflection;
using DGIIFacturaElectronica.Models;
using IdesiToolECF.Services.Gastos;
// Provider substitute for an isolated Firebird regression. No HTTP or issuance.
if(args.Length!=3||args[0]!="--gasto"||args[2]!="--xml-firmado=0") return 10;
var number=int.Parse(args[1]);
var encf=number==9002?"E439999999992":number==9003?"E419999999999":"E419999999991";
var stamp=new Timbre {codigoSeguridad="QASIGN",encf=encf,fechaEmision="20-11-2026",fechaFirma="20-11-2026 14:02:34",montoTotal="1180.00",urlImage="https://example.invalid/timbre"};
var reader=typeof(GastoEcfProcessor).Assembly.GetType("IdesiToolECF.Services.Gastos.GastoEcfReflection")!.GetMethod("GetString")!;
string Read(params string[] names)=>(string)reader.Invoke(null,new object[]{stamp,names})!;
var result=new GastoEcfProcessResult {
 Estado="ACEPTADO",ExitCode=0,ENcf=encf,TrackId="QA-TRACK-"+number,Mensaje="Aceptado sintetico",
 Timbre=File.Exists(Path.Combine(AppContext.BaseDirectory,"sin-timbre.flag"))?null:new GastoEcfTimbreData {
 CodigoSeguridad=Read("codigoSeguridad","CodigoSeguridad"),ENcf=Read("encf","ENcf"),FechaEmision=Read("fechaEmision","FechaEmision"),
 FechaFirma=Read("fechaFirma","FechaFirma"),MontoTotal=Read("montoTotal","MontoTotal"),UrlImage=Read("urlImage","UrlImage")}
};
GastoEcfCliProtocol.EmitResult(result);
return 0;
