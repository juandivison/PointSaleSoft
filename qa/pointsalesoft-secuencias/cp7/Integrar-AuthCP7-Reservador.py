#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Integrar autenticacion de tokens SQL CP7 en el reservador QA CP4.
Usar --verificar ANTES de aplicar. Nunca ejecutar sobre PROD.
No se modifica una reserva ni un correlativo existente.
"""
import argparse
from pathlib import Path
import datetime
import shutil
import sys

parser=argparse.ArgumentParser()
parser.add_argument('php_qa',type=Path)
parser.add_argument('--verificar',action='store_true')
a=parser.parse_args()
p=a.php_qa.resolve()
if not p.is_file():sys.exit('No existe: '+str(p))
s=p.read_text(encoding='utf-8')
if 'CP7_AUTH_DINAMICA' in s:sys.exit('Ya contiene autenticacion CP7; revisar antes de repetir')

old1="""if ($scope === null) {
    reply(403, array('resultado' => 'NO_AUTORIZADO'));
}
"""
new1="""// CP7_AUTH_DINAMICA: Solo para credenciales previamente aprobadas.
$scopeDinamico = false;
if ($scope === null && $token !== '' && is_array($config)) {
    try {
        if (!isset($config['dsn'],$config['user'],$config['password'])) {
            throw new RuntimeException();
        }
        $authDb = new PDO($config['dsn'],$config['user'],$config['password'],array(
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_EMULATE_PREPARES => false,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_TIMEOUT => 5
        ));
        $auth = $authDb->prepare("SELECT s.rnc_emisor AS rnc,s.ambiente,
                s.sucursal_id AS sucursal,t.tipo_cf AS tipo
            FROM ecf_config_solicitud_tipo t
            JOIN ecf_config_solicitud s ON s.solicitud_id=t.solicitud_id
            JOIN ecf_config_tipo c ON c.tipo_cf=t.tipo_cf
            WHERE t.token_sha256=? AND t.autorizado=1 AND t.activo=1
              AND c.integrado=1 AND s.estado='ACTIVA' AND s.ambiente='TEST'
            LIMIT 2");
        $auth->execute(array(hash('sha256',$token)));
        $found = $auth->fetchAll();
        if (count($found) === 1) {
            $scope = $found[0];
            $scopeDinamico = true;
        }
        $authDb = null;
    } catch (Exception $ex) {
        reply(503, array('resultado' => 'NO_DISPONIBLE'));
    }
}
if ($scope === null) {
    reply(403, array('resultado' => 'NO_AUTORIZADO'));
}
"""
old2="""    if (!$control) {
        throw new RuntimeException();
    }
    $existing = query($db, 'SELECT * FROM ecf_reservas_secuencia WHERE request_id=? FOR UPDATE',
"""
new2="""    if (!$control) {
        throw new RuntimeException();
    }
    if ($scopeDinamico) {
        // Revalidar en transaccion para serializar revocaciones simultaneas.
        $authCheck = query($db, "SELECT t.tipo_cf FROM ecf_config_solicitud_tipo t
            JOIN ecf_config_solicitud s ON s.solicitud_id=t.solicitud_id
            WHERE t.token_sha256=? AND t.activo=1 AND t.autorizado=1
              AND t.tipo_cf=? AND s.rnc_emisor=? AND s.ambiente=?
              AND s.sucursal_id=? AND s.estado='ACTIVA' FOR UPDATE",
            array(hash('sha256',$token),$scope['tipo'],$scope['rnc'],
              $scope['ambiente'],$scope['sucursal']))->fetch();
        if (!$authCheck) {
            $db->rollBack();
            reply(403, array('resultado' => 'NO_AUTORIZADO'));
        }
    }
    $existing = query($db, 'SELECT * FROM ecf_reservas_secuencia WHERE request_id=? FOR UPDATE',
"""
assert s.count(old1)==1, 'Ancla autenticacion no coincide'
assert s.count(old2)==1, 'Ancla transaccion no coincide'
s=s.replace(old1,new1,1).replace(old2,new2,1)
print('OK: dos anclas presentes. Cambio localizado en autenticacion QA.')
if a.verificar:
    print('VERIFICACION PASS. No se modifico archivo PHP.')
    sys.exit(0)
bkp=p.with_name(p.name+'.cp7-'+datetime.datetime.now().strftime('%Y%m%d-%H%M%S')+'.bak')
shutil.copy2(p,bkp)
try:
    p.write_text(s,encoding='utf-8',newline='\n')
except Exception:
    shutil.copy2(bkp,p)
    raise
print('APLICADO: '+str(p))
print('RESPALDO: '+str(bkp))
print('VALIDAR: php -l y probar autenticacion con token QA antes de uso.')
