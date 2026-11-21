$ErrorActionPreference='Stop'
$repoRoot=Split-Path (Split-Path $PSScriptRoot)
$env:PSS_TEST_DFM=Join-Path $repoRoot 'PuntoVenta/Fuentes/UDatModConectar.dfm'
if(-not $env:PSS_FIREBIRD_PROVIDER){$env:PSS_FIREBIRD_PROVIDER=Join-Path $repoRoot 'PointSaleSoft.Sync/src/bin/Release/net10.0/FirebirdSql.Data.FirebirdClient.dll'}
$dcc=if($env:PSS_DCC32){$env:PSS_DCC32}else{'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe'}
$build=Join-Path $PSScriptRoot 'Build';[void][IO.Directory]::CreateDirectory($build)
& (Join-Path $PSScriptRoot 'CrearBase.ps1')
Push-Location $PSScriptRoot
try{
 & $dcc -Q ('-E'+$build) ('-N'+$build) ('-U'+(Join-Path $repoRoot 'PuntoVenta/Fuentes')+';C:\Program Files (x86)\Borland\Delphi7\Lib') QAInventarioGrupo.dpr *> (Join-Path $build 'compile.log')
 if($LASTEXITCODE){throw 'Fallo compilacion prueba inventario'}
 Push-Location $build
 try{& ./QAInventarioGrupo.exe *> test.log;$code=$LASTEXITCODE;Get-Content test.log -Tail 5;if($code){throw 'Fallo inventario'}}finally{Pop-Location}
}finally{Pop-Location}
