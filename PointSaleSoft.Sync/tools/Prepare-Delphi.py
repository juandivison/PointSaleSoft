from pathlib import Path
import hashlib, json, re, sys
root=Path(__file__).resolve().parent.parent
source=Path(r'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UInventarioProd.pas')
original=source.read_bytes()
if (root/'delphi/manifest.json').exists():
    previous=json.loads((root/'delphi/manifest.json').read_text(encoding='utf-8-sig'))
    if any(item['target']==str(source) and item['after']==hashlib.sha256(original).hexdigest() for item in previous):
        print('CANDIDATO_DELPHI=YA_INSTALADO; RESPALDO_CONSERVADO=1')
        sys.exit(0)
text=original.decode('cp1252')
original_text=text
assert text.count('UDatosVentas, UInventarioCodigoGrupo;')==1
text=text.replace('UDatosVentas, UInventarioCodigoGrupo;','UDatosVentas, UInventarioCodigoGrupo, UPuenteCatalogoConfig;')
start=text.index('procedure TfrmInventarioProd.BitBtn4Click(')
end=text.index('{antes',start)
body=text[start:end]
anchor='    GlbSalvarQuery(dmInventario.tblInventarioProd);'
assert body.count(anchor)==1
body=body.replace(anchor,'    VerificarPuenteCatalogo(dmInventario.tblInventarioProd.Database,\r\n      dmInventario.tblInventarioProd.Transaction);\r\n'+anchor)
assert body.count('if GlbProsesur = 1 then')==1
body=body.replace('if GlbProsesur = 1 then','if (GlbProsesur = 1) and (not PuenteCatalogoActivo) then')
text=text[:start]+body+text[end:]
anchor='procedure TfrmInventarioProd.SincronizarProductoActual;\r\nbegin\r\n'
assert text.count(anchor)==1
text=text.replace(anchor,anchor+'  if PuenteCatalogoActivo then Exit;\r\n')
anchor='procedure TfrmInventarioProd.GuardarProducto;'
start=text.index(anchor)
end=text.index('procedure ',start+len(anchor))
method=text[start:end]
match=re.search(r'(?m)^begin\r?\n',method)
assert match is not None, 'GuardarProducto no tiene cuerpo reconocido'
pos=start+match.end()
newline='\r\n' if '\r\n' in match.group() else '\n'
text=text[:pos]+'''  if PuenteCatalogoActivo then
  begin
    VerificarPuenteCatalogo(dmInventario.tblInventarioProd.Database,
      dmInventario.tblInventarioProd.Transaction);
    GlbSalvarQuery(dmInventario.tblInventarioProd);
    Exit;
  end;
'''.replace('\n',newline)+text[pos:]
# Legacy sources contain mixed line endings. Never cross a method boundary
# while locating its begin; doing so could insert a save into a UI event.
def method_body(value,name):
    start=value.index('procedure TfrmInventarioProd.'+name)
    end=value.find('procedure ',start+len('procedure '))
    return value[start:] if end<0 else value[start:end]
assert method_body(text,'DBEdit3Enter')==method_body(original_text,'DBEdit3Enter')
assert 'if PuenteCatalogoActivo then' in method_body(text,'GuardarProducto;')
(root/'delphi/Antes').mkdir(exist_ok=True)
(root/'delphi/Antes/UInventarioProd.pas').write_bytes(original)
(root/'delphi/UInventarioProd.pas').write_bytes(text.encode('cp1252'))
manifest=[]
for name in ['UInventarioProd.pas','UPuenteCatalogoConfig.pas']:
    path=root/'delphi'/name
    manifest.append({'source':str(path),'target':str(source.parent/name),
       'before':hashlib.sha256(original).hexdigest() if name==source.name else None,
       'after':hashlib.sha256(path.read_bytes()).hexdigest()})
(root/'delphi/manifest.json').write_text(json.dumps(manifest,indent=2),encoding='utf8')
print('CANDIDATO_DELPHI=PREPARADO; MODO_PREDETERMINADO=DIRECTO; INSTALADO=0')
