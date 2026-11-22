<?php
// CP4 QA, PHP 5.6. Guardar directamente en /www/ecf-cp4-qa.php.
ini_set('display_errors', '0');
ini_set('log_errors', '0');
header('Cache-Control: no-store');
header('X-Content-Type-Options: nosniff');

function reply($code, $data) {
    http_response_code($code);
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode($data);
    exit;
}
function query($db, $sql, $args) {
    $statement = $db->prepare($sql);
    $statement->execute($args);
    return $statement;
}
function result($row, $status) {
    return array('resultado' => $status, 'request_id' => $row['request_id'],
        'reserva_id' => (string) $row['id'], 'lote_id' => (string) $row['lote_id'],
        'correlativo' => (string) $row['correlativo'], 'encf' => $row['encf'],
        'fecha_vence' => $row['fecha_vence_reserva']);
}
if (empty($_SERVER['HTTPS']) || strtolower($_SERVER['HTTPS']) === 'off') {
    reply(404, array('resultado' => 'NO_DISPONIBLE'));
}
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    header('Content-Type: text/html; charset=UTF-8');
    echo '<!doctype html><meta charset="utf-8"><title>CP4 QA</title>
<form method="post">
<label>Clave temporal <input type="password" name="token" required></label><br>
<label>ID de solicitud <input name="request_id" size="40" required></label><br>
<label>Documento QA <input name="documento" value="CP4-QA-001" required></label><br>
<button name="accion" value="reservar">Reservar</button>
<button name="accion" value="consultar">Consultar</button></form>';
    exit;
}
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    reply(405, array('resultado' => 'METODO_INVALIDO'));
}
$config = @parse_ini_file(dirname(__DIR__) . '/database/ecf-cp4-qa.ini', true, INI_SCANNER_RAW);
$input = $_POST;
if (isset($_SERVER['CONTENT_TYPE']) && strpos($_SERVER['CONTENT_TYPE'], 'application/json') === 0) {
    $input = json_decode(file_get_contents('php://input', false, null, 0, 8193), true);
}
if (!is_array($input)) {
    reply(400, array('resultado' => 'SOLICITUD_INVALIDA'));
}
$token = isset($input['token']) && is_string($input['token']) ? $input['token'] : '';
$scope = null;
if (is_array($config)) {
    foreach ($config as $name => $candidate) {
        if (strpos($name, 'cliente_') !== 0 || !is_array($candidate)
            || !isset($candidate['token_sha256'])
            || !preg_match('/^[a-f0-9]{64}$/D', $candidate['token_sha256'])) {
            continue;
        }
        if (hash_equals($candidate['token_sha256'], hash('sha256', $token))) {
            if ($scope !== null) {
                reply(503, array('resultado' => 'CONFIGURACION_INVALIDA'));
            }
            $scope = $candidate;
        }
    }
}
if ($scope === null) {
    reply(403, array('resultado' => 'NO_AUTORIZADO'));
}
if (!isset($scope['rnc'], $scope['ambiente'], $scope['sucursal'], $scope['tipo'])
    || !preg_match('/^[0-9]{9,11}$/D', $scope['rnc'])
    || $scope['ambiente'] !== 'TEST'
    || !preg_match('/^[A-Za-z0-9._:-]{1,64}$/D', $scope['sucursal'])
    || !preg_match('/^E[0-9]{2}$/D', $scope['tipo'])) {
    reply(503, array('resultado' => 'CONFIGURACION_INVALIDA'));
}
// Toda identidad enviada debe coincidir con el ámbito autorizado por la clave.
foreach (array('rnc', 'ambiente', 'sucursal', 'tipo') as $field) {
    if (isset($input[$field]) && $input[$field] !== $scope[$field]) {
        reply(403, array('resultado' => 'NO_AUTORIZADO'));
    }
}
foreach (array('request_id', 'documento', 'accion') as $field) {
    if (!isset($input[$field]) || !is_string($input[$field])) {
        reply(400, array('resultado' => 'SOLICITUD_INVALIDA', 'campo' => $field));
    }
}
$request = $input['request_id'];
$document = $input['documento'];
$action = $input['accion'];
$rules = array(
    'request_id' => '/^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/D',
    'documento' => '/^[A-Za-z0-9._:-]{1,128}$/D'
);
foreach ($rules as $field => $pattern) {
    if (!preg_match($pattern, $input[$field])) {
        reply(400, array('resultado' => 'SOLICITUD_INVALIDA', 'campo' => $field));
    }
}
if (!in_array($action, array('reservar', 'consultar'), true)) {
    reply(400, array('resultado' => 'SOLICITUD_INVALIDA', 'campo' => 'accion'));
}

// El INI privado vincula cada clave a empresa, ambiente TEST, tipo y sucursal.
$db = null;
try {
    if (!isset($config['dsn'], $config['user'], $config['password'])
        || strpos($config['dsn'], 'mysql:') !== 0) {
        throw new RuntimeException();
    }
    $db = new PDO($config['dsn'], $config['user'], $config['password'], array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false,
        PDO::ATTR_TIMEOUT => 5,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ));
    $db->exec('SET SESSION innodb_lock_wait_timeout=5');
    $db->beginTransaction();
    $control = query($db, "SELECT id FROM ecf_control_secuencia
        WHERE rnc_emisor=? AND ambiente=? AND tipo_cf=? FOR UPDATE",
        array($scope['rnc'], $scope['ambiente'], $scope['tipo']))->fetch();
    if (!$control) {
        throw new RuntimeException();
    }
    $existing = query($db, 'SELECT * FROM ecf_reservas_secuencia WHERE request_id=? FOR UPDATE',
        array($request))->fetch();
    if ($existing) {
        if ((string) $existing['control_id'] !== (string) $control['id']
            || $existing['sucursal_id'] !== $scope['sucursal']
            || $existing['documento_clave'] !== $document
            || (string) $existing['generacion'] !== '1') {
            $db->rollBack();
            reply(409, array('resultado' => 'CONFLICTO_SOLICITUD'));
        }
        $db->commit();
        reply(200, result($existing, 'MISMA_RESERVA'));
    }
    if ($action === 'consultar') {
        $db->commit();
        reply(404, array('resultado' => 'NO_ENCONTRADA'));
    }
    $previous = query($db, "SELECT id FROM ecf_reservas_secuencia
        WHERE control_id=? AND sucursal_id=? AND documento_clave=? LIMIT 1 FOR UPDATE",
        array($control['id'], $scope['sucursal'], $document))->fetch();
    if ($previous) {
        $db->rollBack();
        reply(409, array('resultado' => 'DOCUMENTO_YA_RESERVADO'));
    }
    $today = new DateTime('now', new DateTimeZone('America/Santo_Domingo'));
    $lot = query($db, "SELECT id FROM ecf_lotes_secuencia
        WHERE control_id=? AND modalidad='CENTRAL' AND activo=1
          AND fecha_vence >= ? AND ultimo_asignado < hasta
        ORDER BY fecha_vence, id LIMIT 1 FOR UPDATE",
        array($control['id'], $today->format('Y-m-d')))->fetch();
    if (!$lot) {
        $db->rollBack();
        reply(409, array('resultado' => 'SIN_LOTE'));
    }
    // MySQL calcula el entero exacto. PHP conserva los valores BIGINT como strings.
    $changed = query($db, "UPDATE ecf_lotes_secuencia SET ultimo_asignado=ultimo_asignado+1
        WHERE id=? AND ultimo_asignado>=desde-1 AND ultimo_asignado<hasta
          AND hasta<=9999999999", array($lot['id']));
    if ($changed->rowCount() !== 1) {
        throw new RuntimeException();
    }
    query($db, "INSERT INTO ecf_reservas_secuencia
        (request_id,control_id,lote_id,sucursal_id,documento_clave,generacion,correlativo,encf,estado,fecha_vence_reserva)
        SELECT ?,control_id,id,?,?,1,ultimo_asignado,
          CONCAT(?,LPAD(CAST(ultimo_asignado AS CHAR),10,'0')),'RESERVADA',fecha_vence
        FROM ecf_lotes_secuencia WHERE id=?",
        array($request, $scope['sucursal'], $document, $scope['tipo'], $lot['id']));
    $row = query($db, 'SELECT * FROM ecf_reservas_secuencia WHERE request_id=?',
        array($request))->fetch();
    $db->commit();
    // Inyección QA, habilitada solo desde el INI privado.
    if (isset($config['qa_post_commit_delay']) && $config['qa_post_commit_delay'] === '1'
        && isset($input['qa_delay']) && $input['qa_delay'] === '1') {
        ignore_user_abort(true);
        sleep(8);
    }
    reply(200, result($row, 'ASIGNADO'));
} catch (Exception $exception) {
    if ($db && $db->inTransaction()) {
        $db->rollBack();
    }
    // También cubre respuesta ambigua al COMMIT. Recuperar siempre con el mismo ID.
    reply(503, array('resultado' => 'NO_DISPONIBLE', 'request_id' => $request,
        'recuperacion' => 'CONSULTAR_O_REPETIR_MISMO_ID'));
}
