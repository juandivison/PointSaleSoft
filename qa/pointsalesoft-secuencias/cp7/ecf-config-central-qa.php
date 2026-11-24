<?php
/* CP7 - Activacion central e-CF TEST, PHP 5.6 / MySQL 5.6.
   Endpoint separado del reservador actual. Sin envio fiscal.
   El ADMIN solo existe en la Principal. No crear aprobacion automatica.
   Requiere integrar autenticacion de tokens dinamicos en ecf-cp4-qa.php.
*/
ini_set('display_errors', '0');
ini_set('log_errors', '1');
header('Cache-Control: no-store, private');
header('Pragma: no-cache');
header('X-Content-Type-Options: nosniff');
function responder($http, $datos) {
    http_response_code($http);
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode($datos, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}
function dato($entrada, $clave, $regex, $max) {
    $valor = isset($entrada[$clave]) && is_string($entrada[$clave]) ? $entrada[$clave] : '';
    if (strlen($valor) > $max || !preg_match($regex, $valor)) {
        responder(400, array('resultado'=>'PARAMETRO_INVALIDO','campo'=>$clave));
    }
    return $valor;
}
function sql($db, $texto, $args) {
    $q=$db->prepare($texto);
    $q->execute($args);
    return $q;
}
function verificar_secret($candidate, $hash) {
    return is_string($hash) && strlen($hash) === 64
        && hash_equals($hash, hash('sha256',$candidate));
}
function token_tipo($master,$row,$tipo) {
    // HMAC basado en secreto del servidor: token reproduccible hasta CONFIRMAR.
    // Nunca se almacena token en texto claro en MySQL.
    return hash_hmac('sha256', 'PS-ECF-CP7|'.$row['solicitud_id'].'|'.
        $row['rnc_emisor'].'|'.$row['ambiente'].'|'.$row['sucursal_id'].'|'.
        $row['dispositivo_id'].'|'.$tipo, $master);
}
function lista_tipos($s) {
    $tipos=explode(',',$s);
    if (count($tipos)<1 || count($tipos)>10) responder(400,array('resultado'=>'TIPOS_INVALIDOS'));
    $unicos=array();
    foreach($tipos as $t) {
        if(!preg_match('/^E[0-9]{2}$/D',$t) || isset($unicos[$t]))
            responder(400,array('resultado'=>'TIPOS_INVALIDOS'));
        $unicos[$t]=true;
    }
    return array_keys($unicos);
}
function autorizar_admin($input,$config) {
    $token=isset($input['admin_token']) && is_string($input['admin_token']) ? $input['admin_token']:'';
    if (strlen($token)<40 || !verificar_secret($token,$config['admin_token_sha256']))
        responder(403,array('resultado'=>'ADMIN_NO_AUTORIZADO'));
}
function peticion_autenticada($db,$id,$secret,$bloquear) {
    $query='SELECT * FROM ecf_config_solicitud WHERE solicitud_id=?'.($bloquear?' FOR UPDATE':'');
    $r=sql($db,$query,array($id))->fetch();
    if (!$r || !verificar_secret($secret,$r['secreto_sha256']))
        responder(403,array('resultado'=>'NO_AUTORIZADO'));
    if ($r['estado']==='REVOCADA') responder(403,array('resultado'=>'REVOCADA'));
    return $r;
}
if (empty($_SERVER['HTTPS']) || strtolower($_SERVER['HTTPS']) === 'off')
    responder(404,array('resultado'=>'NO_DISPONIBLE'));
if ($_SERVER['REQUEST_METHOD']!=='POST')
    responder(405,array('resultado'=>'METODO_INVALIDO'));
$config=@parse_ini_file(dirname(__DIR__).'/database/ecf-config-central-qa.ini',false,INI_SCANNER_RAW);
if (!is_array($config) || !isset($config['dsn'],$config['user'],$config['password'],
    $config['ambiente'],$config['master_key_hex'],$config['admin_token_sha256'],$config['reservas_url']) ||
    $config['ambiente']!=='TEST' ||
    !preg_match('/^[0-9a-f]{64}$/D',$config['master_key_hex']) ||
    !preg_match('/^[0-9a-f]{64}$/D',$config['admin_token_sha256']) ||
    !preg_match('#^https://[A-Za-z0-9.-]+(?::[0-9]{1,5})?/[A-Za-z0-9._/-]+$#D',$config['reservas_url']))
    responder(503,array('resultado'=>'SERVICIO_NO_CONFIGURADO'));
$input=$_POST;
if (!is_array($input)) responder(400,array('resultado'=>'SOLICITUD_INVALIDA'));
$accion=dato($input,'accion','/^[a-z_]{3,30}$/D',30);
try {
    $db=new PDO($config['dsn'],$config['user'],$config['password'],array(
        PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES=>false,
        PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
        PDO::ATTR_TIMEOUT=>5
    ));
    $db->exec('SET SESSION innodb_lock_wait_timeout=5');
    if ($accion==='catalogo') {
        $rows=sql($db,'SELECT tipo_cf,nombre,integrado FROM ecf_config_tipo ORDER BY tipo_cf',array())->fetchAll();
        $out=array('resultado'=>'OK','cantidad'=>(string)count($rows));
        foreach($rows as $r) {
            $out['nombre_'.$r['tipo_cf']]=$r['nombre'];
            $out['integrado_'.$r['tipo_cf']]=(string)$r['integrado'];
        }
        responder(200,$out);
    }
    if ($accion==='solicitar') {
        $id=dato($input,'solicitud_id','/^[a-f0-9-]{36}$/D',36);
        $rnc=dato($input,'rnc','/^[0-9]{9}(?:[0-9]{2})?$/D',11);
        $suc=dato($input,'sucursal','/^[A-Za-z0-9._:-]{1,64}$/D',64);
        $equipo=dato($input,'dispositivo_id','/^[a-f0-9-]{36}$/D',36);
        $secret=dato($input,'secreto','/^[a-f0-9]{64}$/D',64);
        $tipos=lista_tipos(dato($input,'tipos','/^[A-Z0-9,]{3,40}$/D',40));
        $db->beginTransaction();
        $existente=sql($db,'SELECT * FROM ecf_config_solicitud WHERE solicitud_id=? FOR UPDATE',array($id))->fetch();
        if ($existente) {
            if ($existente['rnc_emisor']!==$rnc || $existente['sucursal_id']!==$suc ||
                $existente['dispositivo_id']!==$equipo ||
                !verificar_secret($secret,$existente['secreto_sha256']) ||
                $existente['ambiente']!=='TEST') {
                $db->rollBack(); responder(409,array('resultado'=>'CONFLICTO_SOLICITUD'));
            }
            $anteriores=sql($db,'SELECT tipo_cf FROM ecf_config_solicitud_tipo WHERE solicitud_id=? ORDER BY tipo_cf',array($id))->fetchAll(PDO::FETCH_COLUMN);
            $t=$tipos;sort($t);sort($anteriores);
            if($t!==$anteriores) {
                $db->rollBack(); responder(409,array('resultado'=>'TIPOS_CAMBIADOS'));
            }
            $db->commit(); responder(200,array('resultado'=>'PENDIENTE','solicitud_id'=>$id,'estado'=>$existente['estado']));
        }
        $ip=isset($_SERVER['REMOTE_ADDR']) ? substr($_SERVER['REMOTE_ADDR'],0,45) : '';
        $n=sql($db,"SELECT COUNT(*) FROM ecf_config_solicitud WHERE solicitante_ip=? AND solicitada_en >= DATE_SUB(NOW(),INTERVAL 1 HOUR)",array($ip))->fetchColumn();
        if ($n>=10) {
            $db->rollBack(); responder(429,array('resultado'=>'LIMITE_SOLICITUDES'));
        }
        foreach($tipos as $tipo) {
            $v=sql($db,'SELECT tipo_cf FROM ecf_config_tipo WHERE tipo_cf=?',array($tipo))->fetch();
            if (!$v) { $db->rollBack(); responder(400,array('resultado'=>'TIPO_NO_CATALOGADO')); }
        }
        sql($db,"INSERT INTO ecf_config_solicitud
            (solicitud_id,rnc_emisor,ambiente,sucursal_id,dispositivo_id,secreto_sha256,estado,solicitada_en,solicitante_ip)
            VALUES (?,?,?,?,?,?,'PENDIENTE',NOW(),?)",
            array($id,$rnc,'TEST',$suc,$equipo,hash('sha256',$secret),$ip));
        foreach($tipos as $tipo)
            sql($db,'INSERT INTO ecf_config_solicitud_tipo(solicitud_id,tipo_cf) VALUES (?,?)',array($id,$tipo));
        $db->commit();
        responder(200,array('resultado'=>'PENDIENTE','solicitud_id'=>$id,'estado'=>'PENDIENTE'));
    }
    if ($accion==='estado' || $accion==='confirmar') {
        $id=dato($input,'solicitud_id','/^[a-f0-9-]{36}$/D',36);
        $secret=dato($input,'secreto','/^[a-f0-9]{64}$/D',64);
        $db->beginTransaction();
        $row=peticion_autenticada($db,$id,$secret,true);
        if ($accion==='confirmar') {
            if ($row['estado']!=='APROBADA' && $row['estado']!=='ACTIVA') {
                $db->rollBack(); responder(409,array('resultado'=>'AUN_NO_APROBADA'));
            }
            sql($db,'UPDATE ecf_config_solicitud_tipo SET activo=1 WHERE solicitud_id=? AND autorizado=1',array($id));
            sql($db,"UPDATE ecf_config_solicitud SET estado='ACTIVA',activada_en=COALESCE(activada_en,NOW()) WHERE solicitud_id=?",array($id));
            $db->commit();responder(200,array('resultado'=>'CONFIRMADA'));
        }
        $out=array('resultado'=>'OK','solicitud_id'=>$id,'estado'=>$row['estado']);
        if ($row['estado']==='APROBADA' || $row['estado']==='ACTIVA')
            $out['url_reservas']=$config['reservas_url'];
        if ($row['estado']==='APROBADA' || $row['estado']==='ACTIVA') {
            $aprobados=sql($db,'SELECT tipo_cf FROM ecf_config_solicitud_tipo WHERE solicitud_id=? AND autorizado=1 ORDER BY tipo_cf',array($id))->fetchAll(PDO::FETCH_COLUMN);
            $out['autorizados']=implode(',',$aprobados);
            if ($row['estado']==='APROBADA') {
                $master=pack('H*',$config['master_key_hex']);
                foreach($aprobados as $tipo) $out['token_'.$tipo]=token_tipo($master,$row,$tipo);
            }
        }
        $db->commit(); responder(200,$out);
    }
    if ($accion==='pendientes' || $accion==='aprobar' || $accion==='revocar') {
        autorizar_admin($input,$config);
        if ($accion==='pendientes') {
            $rows=sql($db,"SELECT s.solicitud_id,s.rnc_emisor,s.sucursal_id,s.dispositivo_id,
              GROUP_CONCAT(t.tipo_cf ORDER BY t.tipo_cf) AS tipos FROM ecf_config_solicitud s
              JOIN ecf_config_solicitud_tipo t ON t.solicitud_id=s.solicitud_id
              WHERE s.ambiente='TEST' AND s.estado='PENDIENTE'
              GROUP BY s.solicitud_id ORDER BY s.solicitada_en DESC LIMIT 50",array())->fetchAll();
            responder(200,array('resultado'=>'OK','solicitudes'=>$rows));
        }
        $id=dato($input,'solicitud_id','/^[a-f0-9-]{36}$/D',36);
        $db->beginTransaction();
        $row=sql($db,'SELECT * FROM ecf_config_solicitud WHERE solicitud_id=? FOR UPDATE',array($id))->fetch();
        if (!$row || $row['ambiente']!=='TEST') {
            $db->rollBack();responder(404,array('resultado'=>'NO_ENCONTRADA'));
        }
        if ($accion==='revocar') {
            sql($db,'UPDATE ecf_config_solicitud_tipo SET activo=0 WHERE solicitud_id=?',array($id));
            sql($db,"UPDATE ecf_config_solicitud SET estado='REVOCADA' WHERE solicitud_id=?",array($id));
            $db->commit();responder(200,array('resultado'=>'REVOCADA'));
        }
        if ($row['estado']!=='PENDIENTE') {
            $db->rollBack();responder(409,array('resultado'=>'ESTADO_INVALIDO'));
        }
        $seleccion=lista_tipos(dato($input,'tipos','/^[A-Z0-9,]{3,40}$/D',40));
        $master=pack('H*',$config['master_key_hex']);
        $autorizados=array();
        foreach($seleccion as $tipo) {
            $x=sql($db,"SELECT t.tipo_cf FROM ecf_config_solicitud_tipo t
                INNER JOIN ecf_config_tipo c ON c.tipo_cf=t.tipo_cf AND c.integrado=1
                INNER JOIN ecf_control_secuencia k ON k.rnc_emisor=? AND k.ambiente='TEST' AND k.tipo_cf=t.tipo_cf
                WHERE t.solicitud_id=? AND t.tipo_cf=?",array($row['rnc_emisor'],$id,$tipo))->fetch();
            if (!$x) {
                $db->rollBack();responder(409,array('resultado'=>'TIPO_SIN_PERMISO_O_SIN_CONTROL','tipo'=>$tipo));
            }
            // Debe existir un lote CENTRAL vigente. SELECT sin alterar correlativos.
            $lot=sql($db,"SELECT l.id FROM ecf_lotes_secuencia l
                JOIN ecf_control_secuencia c ON c.id=l.control_id
                WHERE c.rnc_emisor=? AND c.ambiente='TEST' AND c.tipo_cf=?
                 AND l.modalidad='CENTRAL' AND l.activo=1 AND l.fecha_vence>=CURDATE()
                 AND l.ultimo_asignado<l.hasta LIMIT 1",
                array($row['rnc_emisor'],$tipo))->fetch();
            if (!$lot) {
                $db->rollBack();responder(409,array('resultado'=>'TIPO_SIN_LOTE','tipo'=>$tipo));
            }
            $token=token_tipo($master,$row,$tipo);
            sql($db,"UPDATE ecf_config_solicitud_tipo SET autorizado=1,token_sha256=?
                WHERE solicitud_id=? AND tipo_cf=?",array(hash('sha256',$token),$id,$tipo));
            $autorizados[]=$tipo;
        }
        sql($db,"UPDATE ecf_config_solicitud SET estado='APROBADA',autorizada_en=NOW() WHERE solicitud_id=?",array($id));
        $db->commit();responder(200,array('resultado'=>'APROBADA','autorizados'=>implode(',',$autorizados)));
    }
    responder(400,array('resultado'=>'ACCION_INVALIDA'));
} catch (Exception $e) {
    if (isset($db) && $db->inTransaction()) $db->rollBack();
    // No exponer SQL, tokens ni claves al cliente.
    responder(503,array('resultado'=>'NO_DISPONIBLE'));
}
