<?php
/* CP7 QA - Consola de autorizacion Principal. PHP 5.6 + MySQL 5.6.
   Login por secreto administrativo de alta entropia, almacenado solo como hash.
   La consola nunca permite asignar E33-E47 sin ruta integrada y lote vigente.
*/
ini_set('display_errors','0');
ini_set('log_errors','1');
header('Cache-Control: no-store, private');
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
if (empty($_SERVER['HTTPS']) || strtolower($_SERVER['HTTPS'])==='off') {http_response_code(404);exit;}
ini_set('session.use_only_cookies','1');
ini_set('session.cookie_httponly','1');
ini_set('session.cookie_secure','1');
ini_set('session.use_strict_mode','1');
session_start();
$cfg=@parse_ini_file(dirname(__DIR__).'/database/ecf-config-central-qa.ini',false,INI_SCANNER_RAW);
if (!is_array($cfg) || !isset($cfg['dsn'],$cfg['user'],$cfg['password'],$cfg['ambiente'],$cfg['master_key_hex'],$cfg['admin_token_sha256'],$cfg['reservas_url'])
  || $cfg['ambiente']!=='TEST' || !preg_match('/^[0-9a-f]{64}$/D',$cfg['master_key_hex'])
  || !preg_match('/^[0-9a-f]{64}$/D',$cfg['admin_token_sha256'])) {http_response_code(503);exit('Servicio no configurado');}
function esc($s) {return htmlspecialchars((string)$s,ENT_QUOTES,'UTF-8');}
function qry($pdo,$sql,$args) {$q=$pdo->prepare($sql);$q->execute($args);return $q;}
function token_de($master,$r,$tipo) {
  return hash_hmac('sha256','PS-ECF-CP7|'.$r['solicitud_id'].'|'.$r['rnc_emisor'].'|'.
      $r['ambiente'].'|'.$r['sucursal_id'].'|'.$r['dispositivo_id'].'|'.$tipo,$master);
}
$mensaje='';
if (isset($_POST['salir'])) {$_SESSION=array();session_destroy();header('Location: '.$_SERVER['SCRIPT_NAME']);exit;}
if (isset($_POST['entrar'])) {
  $t=isset($_POST['clave']) && is_string($_POST['clave']) ? $_POST['clave']:'';
  if (strlen($t)>=40 && hash_equals($cfg['admin_token_sha256'],hash('sha256',$t))) {
    session_regenerate_id(true);$_SESSION['ecf_admin_qa']=time();
    $_SESSION['csrf']=bin2hex(openssl_random_pseudo_bytes(32));
  } else {$mensaje='Credenciales no validas';}
}
$autorizado=isset($_SESSION['ecf_admin_qa']) && time()-$_SESSION['ecf_admin_qa']<=900;
if (!$autorizado) {
  $_SESSION=array();
  echo '<!doctype html><meta charset="utf-8"><title>Principal | e-CF QA</title>';
  echo '<h2>Principal: secuencias e-CF (TEST)</h2><p>'.esc($mensaje).'</p>';
  echo '<form method="post"><label>Clave de administrador central <input type="password" name="clave" required autocomplete="off"></label>';
  echo '<button name="entrar" value="1">Ingresar</button></form>';
  exit;
}
$_SESSION['ecf_admin_qa']=time();
$pdo=null;
try {
  $pdo=new PDO($cfg['dsn'],$cfg['user'],$cfg['password'],array(
    PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_EMULATE_PREPARES=>false,
    PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
    PDO::ATTR_TIMEOUT=>5));
  if (isset($_POST['aprobar'])) {
    $id=isset($_POST['solicitud_id']) && is_string($_POST['solicitud_id']) ? $_POST['solicitud_id']:'';
    $csrf=isset($_POST['csrf']) && is_string($_POST['csrf']) ? $_POST['csrf']:'';
    $seleccion=isset($_POST['tipo']) && is_array($_POST['tipo']) ? $_POST['tipo']:array();
    if (!hash_equals($_SESSION['csrf'],$csrf) || !preg_match('/^[a-f0-9-]{36}$/D',$id) ||
        count($seleccion)<1 || count($seleccion)>10) throw new RuntimeException('Peticion invalida.');
    $seleccion=array_values(array_unique($seleccion));
    foreach($seleccion as $tipo)
      if (!is_string($tipo) || !preg_match('/^E[0-9]{2}$/D',$tipo)) throw new RuntimeException('Tipo invalido.');
    $pdo->beginTransaction();
    $r=qry($pdo,'SELECT * FROM ecf_config_solicitud WHERE solicitud_id=? FOR UPDATE',array($id))->fetch();
    if (!$r || $r['ambiente']!=='TEST' || $r['estado']!=='PENDIENTE') throw new RuntimeException('Solicitud inexistente o ya procesada.');
    $master=pack('H*',$cfg['master_key_hex']);
    foreach($seleccion as $tipo) {
      $existe=qry($pdo,'SELECT t.tipo_cf FROM ecf_config_solicitud_tipo t JOIN ecf_config_tipo c ON c.tipo_cf=t.tipo_cf AND c.integrado=1 WHERE t.solicitud_id=? AND t.tipo_cf=?',array($id,$tipo))->fetch();
      if (!$existe) throw new RuntimeException('Tipo no solicitado o pendiente de integracion: '.$tipo);
      $lote=qry($pdo,"SELECT l.id FROM ecf_lotes_secuencia l
        JOIN ecf_control_secuencia c ON c.id=l.control_id
        WHERE c.rnc_emisor=? AND c.ambiente='TEST' AND c.tipo_cf=?
         AND l.modalidad='CENTRAL' AND l.activo=1 AND l.fecha_vence>=CURDATE()
         AND l.ultimo_asignado<l.hasta LIMIT 1",array($r['rnc_emisor'],$tipo))->fetch();
      if (!$lote) throw new RuntimeException('No existe lote vigente sin agotar: '.$tipo);
      $hash=hash('sha256',token_de($master,$r,$tipo));
      qry($pdo,'UPDATE ecf_config_solicitud_tipo SET autorizado=1,token_sha256=? WHERE solicitud_id=? AND tipo_cf=?',array($hash,$id,$tipo));
    }
    qry($pdo,"UPDATE ecf_config_solicitud SET estado='APROBADA',autorizada_en=NOW() WHERE solicitud_id=?",array($id));
    $pdo->commit();
    $mensaje='Solicitud aprobada. La sucursal puede pulsar Consultar aprobacion.';
  }
} catch(Exception $e) {
  if ($pdo && $pdo->inTransaction()) $pdo->rollBack();
  $mensaje='Operacion no completada: '.esc($e->getMessage());
}
$rows=array();
if ($pdo) {
  try {
    $rows=qry($pdo,"SELECT solicitud_id,rnc_emisor,sucursal_id,dispositivo_id,solicitada_en
      FROM ecf_config_solicitud WHERE ambiente='TEST' AND estado='PENDIENTE'
      ORDER BY solicitada_en DESC LIMIT 50",array())->fetchAll();
  } catch(Exception $e) {$mensaje='No se pudieron consultar solicitudes';}
}
echo '<!doctype html><meta charset="utf-8"><title>Principal - e-CF</title>';
echo '<style>body{font:15px Arial;max-width:1100px;margin:24px auto}table{width:100%;border-collapse:collapse}td,th{border:1px solid #bbb;padding:10px;text-align:left}th{background:#eee}button{padding:8px} .error{color:#a33}</style>';
echo '<h2>Principal: solicitudes de secuencias e-CF</h2><p>Ambiente de pruebas (TEST). Las autorizaciones requieren un lote central vigente.</p>';
echo '<p class="error">'.esc($mensaje).'</p>';
echo '<form method="post"><button name="salir" value="1">Cerrar sesion</button></form>';
echo '<table><thead><tr><th>Solicitud</th><th>Empresa/sucursal</th><th>Tipos solicitados</th><th>Accion</th></tr></thead><tbody>';
foreach($rows as $r) {
  $t=qry($pdo,'SELECT t.tipo_cf,c.nombre,c.integrado FROM ecf_config_solicitud_tipo t JOIN ecf_config_tipo c ON c.tipo_cf=t.tipo_cf WHERE t.solicitud_id=? ORDER BY t.tipo_cf',array($r['solicitud_id']))->fetchAll();
  echo '<tr><td>'.esc($r['solicitud_id']).'<small> '.esc($r['solicitada_en']).'</small></td>';
  echo '<td>RNC '.esc($r['rnc_emisor']).' / '.esc($r['sucursal_id']).'<small> Equipo '.esc($r['dispositivo_id']).'</small></td><td>';
  echo '<form id="sol-'.esc($r['solicitud_id']).'" method="post"><input type="hidden" name="csrf" value="'.esc($_SESSION['csrf']).'">';
  echo '<input type="hidden" name="solicitud_id" value="'.esc($r['solicitud_id']).'">';
  $alguno=false;
  foreach($t as $tipo) {
    if ($tipo['integrado']==1) {
      echo '<label><input type="checkbox" name="tipo[]" value="'.esc($tipo['tipo_cf']).'" checked> '.esc($tipo['tipo_cf']).' '.esc($tipo['nombre']).'</label><br>';
      $alguno=true;
    } else echo '<small>'.esc($tipo['tipo_cf']).' pendiente de integracion</small><br>';
  }
  echo '</form></td><td>';
  if ($alguno) echo '<button form="sol-'.esc($r['solicitud_id']).'" type="submit" name="aprobar" value="1" onclick="return confirm(\'Autorizar esta sucursal y los tipos seleccionados?\')">Aprobar</button>';
  else echo 'Sin rutas habilitadas';
  echo '</td></tr>';
}
echo '</tbody></table>';
