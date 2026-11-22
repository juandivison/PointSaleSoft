from pathlib import Path
r=Path(__file__).resolve().parent
p=r/'UProcVentaRapida.pas'
if not p.exists():p=r.parent.parent/'PuntoVenta'/'Fuentes'/'UProcVentaRapida.pas'
s=p.read_bytes().decode('cp1252')
helper=s[s.index('function UsarCodigoTextoFerreteria('):s.index('//Proceso de totales inicia')]
a=s.index('procedure TfrmProcVentaRapida.AsignarSqlText(')
method=s[a:s.index('procedure TfrmProcVentaRapida.chkExentoEnter',a)]
shim='''unit FuentePrueba;
interface
uses SysUtils,Classes,IBQuery;
type TEtiqueta=class public Caption:string;end;
TfrmProcVentaRapida=class
 public qryProductos:TIBQuery;sqlAsignado:Boolean;Label64:TEtiqueta;
 procedure AsignarSqlText(campo,valor,OrderBy:string);
end;
var GlbFerreteria,GlbVenderDesdeAlmacenP,GlbCodDivInventario,glbCia_Key:Integer;
function UsarCodigoTextoFerreteria(AFerreteria:Integer;const ACodigo:string):Boolean;
implementation
'''+helper+method+'end.\n'
(r/'Build').mkdir(exist_ok=True)
(r/'Build'/'FuentePrueba.pas').write_bytes(shim.encode('cp1252'))
print('PRUEBA_USA_HELPER_Y_METODO_SQL_EXTRAIDOS_DEL_CANDIDATO')
