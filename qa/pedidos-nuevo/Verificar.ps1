param(
 [string]$Fuentes='C:/Proyectos/PointSaleSoftResp/PuntoVenta/Fuentes',
 [string]$Delphi='C:/Program Files (x86)/Borland/Delphi7',
 [string]$ConexionDfm='C:/Proyectos/PointSaleSoftResp/PuntoVenta/Fuentes/UDatModConectar.dfm',
 [string]$ProveedorFirebird='C:/Users/nosiv/Documents/ChatGPT/Facturacion Electronica RD/Portal-Administracion/paquete/api-runtime/FirebirdSql.Data.FirebirdClient.dll'
)
$ErrorActionPreference='Stop'
$taskBuild=Join-Path $PSScriptRoot 'Build'
[void](New-Item -ItemType Directory -Path $taskBuild -Force)
& (Join-Path $PSScriptRoot 'Crear-Base.ps1') -ProveedorFirebird $ProveedorFirebird -ConexionDfm $ConexionDfm -BuildDir $taskBuild
$taskBase=Get-Content (Join-Path $taskBuild 'base.txt') -Raw
$taskDcc=Join-Path $Delphi 'Bin/dcc32.exe'
$taskU="-U$PSScriptRoot;$Fuentes;$Delphi/quickrpt;$Delphi/RxLib/units"
Push-Location $PSScriptRoot
try {
 foreach($taskName in @('PruebasPedidos','PruebasInterfaz')) {
  & $taskDcc -Q "-E$taskBuild" "-N$taskBuild" "-R$Delphi/Lib" $taskU ($taskName+'.dpr') *> (Join-Path $taskBuild ($taskName+'-compile.log'))
  if($LASTEXITCODE){Get-Content (Join-Path $taskBuild ($taskName+'-compile.log')) -Tail 12;throw "Fallo compilando $taskName"}
  & (Join-Path $taskBuild ($taskName+'.exe')) $taskBase $ConexionDfm *> (Join-Path $taskBuild ($taskName+'-test.log'))
  if($LASTEXITCODE){Get-Content (Join-Path $taskBuild ($taskName+'-test.log')) -Tail 20;throw "Fallo en $taskName"}
  Get-Content (Join-Path $taskBuild ($taskName+'-test.log')) -Tail 1
 }
 $taskCore=[regex]::Match((Get-Content (Join-Path $taskBuild 'PruebasPedidos-test.log') -Raw),'CHECKS=(\d+)').Groups[1].Value
 $taskUi=[regex]::Match((Get-Content (Join-Path $taskBuild 'PruebasInterfaz-test.log') -Raw),'CHECKS=(\d+)').Groups[1].Value
 [pscustomobject]@{Persistencia=[int]$taskCore;Interfaz=[int]$taskUi;Total=([int]$taskCore+[int]$taskUi);BaseComercial=0;EmisionFiscal=0;CompilacionERP=0;Estado='PASS'} | ConvertTo-Json | Set-Content (Join-Path $taskBuild 'resultado.json')
}finally{Pop-Location}
