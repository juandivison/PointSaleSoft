#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""CP7 QA: actualiza el configurador E31-E47 y sus adaptadores de secuencias.
No modifica ventas ni el menu. Nunca escribe con --verificar.
Si el formulario local fue modificado, requiere autorizacion EXPLICITA para
reemplazarlo; siempre conserva una copia en backup-ecf-cp7-*.
"""
import argparse
import datetime
import hashlib
import os
import shutil
import sys
import uuid
from pathlib import Path

OLD_SHA = '077d4232241b3aae87deb74dc494b73fadbf7f1ad227dc31332b5d8460cc8eb9'
OLD_FORM = 'UfrmEcfSecuenciasConfig.pas'
REMOTE = 'UEcfSecuenciaRemota.pas'
VENTA = 'UEcfSecuenciaVenta.pas'


def one(s, old, new, name):
    count = s.count(old)
    if count != 1:
        raise RuntimeError('%s: se esperaba una coincidencia de %r, hay %d' % (name, old[:100], count))
    return s.replace(old, new, 1)


def pas_content(p):
    data=p.read_bytes()
    return data.decode('latin-1'), '\r\n' if b'\r\n' in data else '\n'


def nljoin(s, nl):
    return s.replace('\n', nl)


def change_remote(s):
    nl = '\r\n' if '\r\n' in s else '\n'
    old = nljoin("""  if (AUrl <> 'https://idesisa.com/ecf-cp4-qa.php') and
     (AUrl <> 'https://www.idesisa.com/ecf-cp4-qa.php') then
    raise Exception.Create('Endpoint de secuencias TEST no autorizado.');""", nl)
    new = nljoin("""  { URL proveida por la Principal y verificada por UEcfSecuenciaVenta. }
  if (Copy(LowerCase(Trim(AUrl)), 1, 8) <> 'https://') or
     (Pos('@', AUrl) > 0) or (Pos('#', AUrl) > 0) or
     (Pos(#13, AUrl) > 0) or (Pos(#10, AUrl) > 0) then
    raise Exception.Create('Endpoint de secuencias HTTPS invalido.');""", nl)
    return one(s, old, new, REMOTE)


def change_venta(s):
    nl = '\r\n' if '\r\n' in s else '\n'
    anchor = nljoin("""function Seccion(ACia: Integer; const ASucursal: string): string;
begin
  Result := 'ECF_SECUENCIA_' + IntToStr(ACia) + '_' + ASucursal;
end;""", nl)
    helper = nljoin("""

function OrigenHttpsSecuencia(const AUrl: string): string;
var U: string; I: Integer;
begin
  U := Trim(AUrl);
  if (Copy(LowerCase(U), 1, 8) <> 'https://') or
     (Pos('@', U) > 0) or (Pos('#', U) > 0) or
     (Pos(#13, U) > 0) or (Pos(#10, U) > 0) then
    raise Exception.Create('URL HTTPS de secuencia no confiable.');
  I := Pos('/', Copy(U, 9, Length(U)));
  if I <= 1 then raise Exception.Create('Ruta HTTPS de secuencia incompleta.');
  Result := LowerCase(Copy(U, 1, 8 + I - 1));
end;""", nl)
    s = one(s, anchor, anchor+helper, VENTA)
    s = one(s,
        'Rnc, Documento, Tipo, Url, TokenProtegido, Token: string;',
        'Rnc, Documento, Tipo, Url, TokenProtegido, Token, UrlActivacion, EstadoActivacion: string;', VENTA)
    old = nljoin("""      Url := Ini.ReadString(Seccion(ACia,ASucursal),'Url',
        'https://idesisa.com/ecf-cp4-qa.php');
      TokenProtegido := Ini.ReadString(Seccion(ACia,ASucursal),'TokenProtected_' + Tipo,'');""", nl)
    new = nljoin("""      Url := Ini.ReadString(Seccion(ACia,ASucursal),'Url',
        'https://idesisa.com/ecf-cp4-qa.php');
      UrlActivacion := Ini.ReadString(Seccion(ACia,ASucursal),'UrlActivacion','');
      EstadoActivacion := Ini.ReadString(Seccion(ACia,ASucursal),'EstadoActivacion','');
      TokenProtegido := Ini.ReadString(Seccion(ACia,ASucursal),'TokenProtected_' + Tipo,'');""", nl)
    s = one(s, old, new, VENTA)
    old = nljoin("""    Token := DescifrarDPAPI(TokenProtegido,Seccion(ACia,ASucursal) + '_' + Tipo);
    Result := SolicitarSecuenciaTest(Url,Token,ARequestId,Documento,Rnc,ASucursal,Tipo,False);""", nl)
    new = nljoin("""    if UpperCase(Trim(EstadoActivacion)) = 'ACTIVA' then
    begin
      { Credenciales nuevas: solo el mismo origen HTTPS que autorizo la Principal. }
      if OrigenHttpsSecuencia(Url) <> OrigenHttpsSecuencia(UrlActivacion) then
        raise Exception.Create('URL reservadora diferente de la Central autorizada.');
    end
    else
    begin
      { Compatibilidad CP4 anterior exclusivamente en TEST durante migracion. }
      if (Url <> 'https://idesisa.com/ecf-cp4-qa.php') and
         (Url <> 'https://www.idesisa.com/ecf-cp4-qa.php') then
        raise Exception.Create('Endpoint legacy TEST no autorizado.');
    end;
    Token := DescifrarDPAPI(TokenProtegido,Seccion(ACia,ASucursal) + '_' + Tipo);
    Result := SolicitarSecuenciaTest(Url,Token,ARequestId,Documento,Rnc,ASucursal,Tipo,False);""", nl)
    s=one(s,old,new,VENTA)
    return s


def write_atomic(path, data):
    tmp=path.with_name('.'+path.name+'.cp7-'+uuid.uuid4().hex+'.tmp')
    try:
        with tmp.open('xb') as fd: fd.write(data)
        os.replace(str(tmp),str(path))
    finally:
        if tmp.exists():tmp.unlink()


def main():
    p=argparse.ArgumentParser()
    p.add_argument('fuentes',type=Path)
    p.add_argument('--verificar',action='store_true')
    p.add_argument('--aceptar-reemplazo-formulario',action='store_true',
        help='Autorizar reemplazo del .pas local diferente, conservando respaldo completo')
    a=p.parse_args()
    src=a.fuentes.resolve()
    if not src.is_dir():raise RuntimeError('No existe Fuentes: '+str(src))
    form_new=Path(__file__).resolve().parent/OLD_FORM
    if not form_new.is_file():raise RuntimeError('Falta formulario CP7 junto al script')
    if not form_new.read_bytes().startswith(b'unit UfrmEcfSecuenciasConfig;'):
        raise RuntimeError('El formulario CP7 no tiene unit esperada')
    olds={}
    edits={}
    for n in (OLD_FORM,REMOTE,VENTA):
        path=src/n
        if not path.is_file():raise RuntimeError('Falta: '+str(path))
        olds[n]=path.read_bytes()
    # El hash canonico pertenece al prototipo entregado anteriormente.
    # Solo normalizamos CRLF y BOM; NUNCA ignoramos cambios de codigo.
    original_norm = olds[OLD_FORM].replace(b'\r\n', b'\n')
    if original_norm.startswith(b'\xef\xbb\xbf'):
        original_norm = original_norm[3:]
    actual_sha = hashlib.sha256(original_norm).hexdigest()
    coincide_prototipo = (actual_sha == OLD_SHA)
    if not coincide_prototipo:
        # No aceptamos archivos con otra unit, ni siquiera con la opcion explicita.
        comienzo = original_norm.lstrip().decode('latin-1')
        if not comienzo.startswith('unit UfrmEcfSecuenciasConfig;') or \
           'TfrmEcfSecuenciasConfig = class(TForm)' not in comienzo or \
           'MostrarConfiguracionSecuencias(' not in comienzo:
            raise RuntimeError('El archivo local no es un formulario de secuencias reconocido; no reemplazar.')
        if 'CP7 QA' in comienzo[:1000]:
            raise RuntimeError('El formulario local ya parece CP7. No se aplicara el parche dos veces.')
        print('AVISO: el formulario local NO coincide con el prototipo original.')
        print('  SHA-256 esperado: '+OLD_SHA)
        print('  SHA-256 local:    '+actual_sha)
        print('  Bytes actuales:   '+str(len(olds[OLD_FORM])))
        if not a.aceptar_reemplazo_formulario:
            raise RuntimeError(
                'Proteccion contra sobrescritura activada. Revise sus cambios locales. '
                'Para reemplazar conscientemente el formulario, agregue '
                '--aceptar-reemplazo-formulario. Se creara respaldo antes de escribir.')
        print('  REEMPLAZO EXPLICITAMENTE AUTORIZADO: se respaldara el archivo local.')
    else:
        print('OK: formulario local coincide con el prototipo anterior.')
    edits[OLD_FORM]=form_new.read_bytes()
    if b'\r\n' in olds[OLD_FORM]:
        edits[OLD_FORM]=edits[OLD_FORM].replace(b'\n',b'\r\n')
    for name, fn in ((REMOTE,change_remote),(VENTA,change_venta)):
        s,_=pas_content(src/name)
        edits[name]=fn(s).encode('latin-1')
    if any(edits[n]==olds[n] for n in edits):raise RuntimeError('Cambio vacio')
    for n in edits:print('OK: %s - %d -> %d bytes'%(n,len(olds[n]),len(edits[n])))
    if a.verificar:
        print('CP7 VERIFICACION PASS: no se escribio ningun archivo')
        return
    backup=src/('backup-ecf-cp7-'+datetime.datetime.now().strftime('%Y%m%d-%H%M%S-%f'))
    backup.mkdir()
    escritos=[]
    try:
        for n in edits:shutil.copy2(src/n,backup/n)
        for n in edits:
            if (src/n).read_bytes()!=olds[n]:raise RuntimeError('Archivo cambio durante aplicacion: '+n)
        for n, data in edits.items():
            write_atomic(src/n,data)
            escritos.append(n)
    except Exception:
        for n in escritos:
            try:shutil.copy2(backup/n,src/n)
            except OSError as ex:print('RESTAURAR MANUALMENTE %s: %s'%(n,ex),file=sys.stderr)
        raise
    print('CP7 APLICADO. BACKUP '+str(backup))
    print('Verificar git diff y compilar Delphi 7. No se emiten comprobantes.')

if __name__=='__main__':
    try:main()
    except (ValueError,RuntimeError,OSError) as e:
        print('ERROR: '+str(e),file=sys.stderr)
        sys.exit(1)
