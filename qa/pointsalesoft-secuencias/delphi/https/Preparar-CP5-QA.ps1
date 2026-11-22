param(
    [string] $IniPath = 'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Bin\Idesi\repconf_cr.ini',
    [int] $Cia = 1,
    [string] $Sucursal = '0001',
    [string] $Tipo = 'E31',
    [string] $Rnc
)

$ErrorActionPreference = 'Stop'
if ($Cia -le 0 -or $Sucursal -notmatch '^[A-Za-z0-9._:-]{1,64}$' -or $Tipo -notmatch '^E[0-9]{2}$') {
    throw 'Empresa, sucursal o tipo invalido.'
}
if ([string]::IsNullOrWhiteSpace($Rnc)) {
    $Rnc = Read-Host 'RNC de la empresa de QA, como figura en COMPANIA'
}
if ($Rnc -notmatch '^([0-9]{9}|[0-9]{11})$') {
    throw 'El RNC debe contener 9 u 11 digitos.'
}
$IniPath = [IO.Path]::GetFullPath($IniPath)
if (-not (Test-Path -LiteralPath (Split-Path -Parent $IniPath) -PathType Container)) {
    throw 'No existe la carpeta del INI. Indica la ruta usada por el ejecutable QA.'
}

Add-Type -AssemblyName System.Security
if (-not ('PointSaleSoftSecuenciaIni' -as [type])) {
    Add-Type -TypeDefinition @'
using System;
using System.Text;
using System.Runtime.InteropServices;
public static class PointSaleSoftSecuenciaIni {
    [DllImport("kernel32.dll", CharSet=CharSet.Unicode, SetLastError=true)]
    public static extern bool WritePrivateProfileString(string section, string key, string value, string path);
    [DllImport("kernel32.dll", CharSet=CharSet.Unicode)]
    public static extern uint GetPrivateProfileString(string section, string key, string defaultValue,
        StringBuilder buffer, uint size, string path);
}
'@
}
function Write-IniValue([string] $Key, [string] $Value) {
    if (-not [PointSaleSoftSecuenciaIni]::WritePrivateProfileString($section, $Key, $Value, $IniPath)) {
        throw "No se pudo guardar el campo $Key."
    }
}
$section = "ECF_SECUENCIA_${Cia}_$Sucursal"
$entropy = [Text.Encoding]::UTF8.GetBytes("PointSaleSoft|IDESI_API|${section}_${Tipo}|v1")
$bytes = New-Object byte[] 32
$rng = [Security.Cryptography.RandomNumberGenerator]::Create()
$sha = [Security.Cryptography.SHA256]::Create()
try {
    $rng.GetBytes($bytes)
    $token = [Convert]::ToBase64String($bytes)
    $plain = [Text.Encoding]::UTF8.GetBytes($token)
    $encrypted = [Security.Cryptography.ProtectedData]::Protect(
        $plain, $entropy, [Security.Cryptography.DataProtectionScope]::CurrentUser)
    $protected = [Convert]::ToBase64String($encrypted)
    $hash = [BitConverter]::ToString($sha.ComputeHash($plain)).Replace('-', '').ToLowerInvariant()

    # Confirmar compatibilidad DPAPI antes de cambiar configuracion.
    $recovered = [Security.Cryptography.ProtectedData]::Unprotect(
        $encrypted, $entropy, [Security.Cryptography.DataProtectionScope]::CurrentUser)
    if ([Text.Encoding]::UTF8.GetString($recovered) -cne $token) {
        throw 'No se pudo comprobar el cifrado DPAPI.'
    }

    if (Test-Path -LiteralPath $IniPath) {
        $backup = $IniPath + '.cp5-' + [DateTime]::Now.ToString('yyyyMMddHHmmssfff') + '.bak'
        [IO.File]::Copy($IniPath, $backup, $false)
    }
    Write-IniValue "TokenProtected_$Tipo" $protected
    Write-IniValue 'Ambiente' 'TEST'
    Write-IniValue 'Url' 'https://idesisa.com/ecf-cp4-qa.php'
    $buffer = New-Object Text.StringBuilder 64
    [void][PointSaleSoftSecuenciaIni]::GetPrivateProfileString(
        $section, 'Origen', '', $buffer, 64, $IniPath)
    if ($buffer.Length -eq 0) { Write-IniValue 'Origen' 'LOCAL' }

    $privateDir = Join-Path ([Environment]::GetFolderPath('LocalApplicationData')) 'PointSaleSoft\SecuenciasQA'
    New-Item -ItemType Directory -Path $privateDir -Force | Out-Null
    $fragment = @"
[cliente_delphi_${Sucursal}_$Tipo]
token_sha256 = "$hash"
rnc = "$Rnc"
ambiente = "TEST"
sucursal = "$Sucursal"
tipo = "$Tipo"
"@
    $fragmentPath = Join-Path $privateDir "Servidor-$Sucursal-$Tipo.ini.fragment"
    [IO.File]::WriteAllText($fragmentPath, $fragment, [Text.UTF8Encoding]::new($false))

    $sql = @"
-- Datos sinteticos exclusivamente en MySQL QA. Ejecutar una vez.
INSERT INTO ecf_control_secuencia (rnc_emisor, ambiente, tipo_cf)
VALUES ('$Rnc','TEST','$Tipo')
ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id);
SET @control = LAST_INSERT_ID();
CALL ecf_alta_lote(@control,7000000000,7000000999,
    CURDATE() + INTERVAL 30 DAY,'CENTRAL',NULL);
SELECT id,desde,hasta,ultimo_asignado,fecha_vence
FROM ecf_lotes_secuencia WHERE control_id=@control ORDER BY fecha_vence,id;
"@
    $sqlPath = Join-Path $privateDir "Lote-QA-$Sucursal-$Tipo.sql"
    [IO.File]::WriteAllText($sqlPath, $sql, [Text.UTF8Encoding]::new($false))
    Write-Output 'CP5_DPAPI=OK'
    Write-Output "Cuenta Windows: $([Security.Principal.WindowsIdentity]::GetCurrent().Name)"
    Write-Output "INI del cliente: $IniPath"
    Write-Output "Fragmento para agregar al INI privado del servidor: $fragmentPath"
    Write-Output "SQL sintetico para MySQL QA: $sqlPath"
}
finally {
    $rng.Dispose()
    $sha.Dispose()
    if ($plain) { [Array]::Clear($plain, 0, $plain.Length) }
    if ($recovered) { [Array]::Clear($recovered, 0, $recovered.Length) }
    $token = $null
}
