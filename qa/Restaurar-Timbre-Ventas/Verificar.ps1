$ErrorActionPreference='Stop'
$repoRoot=Split-Path (Split-Path $PSScriptRoot)
$env:PSS_TEST_DFM=Join-Path $repoRoot 'PuntoVenta/Fuentes/UDatModConectar.dfm'
if(-not $env:PSS_FIREBIRD_PROVIDER){$env:PSS_FIREBIRD_PROVIDER=Join-Path $repoRoot 'PointSaleSoft.Sync/src/bin/Release/net10.0/FirebirdSql.Data.FirebirdClient.dll'}
$dcc=if($env:PSS_DCC32){$env:PSS_DCC32}else{'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe'}
[void][IO.Directory]::CreateDirectory((Join-Path $PSScriptRoot 'Build'))
Push-Location $PSScriptRoot
try{
 & ./Crear-Base.ps1
 & $dcc -Q '-EBuild' '-NBuild' Fixture.dpr *> Build/fixture-compile.log
 if($LASTEXITCODE){throw 'Fallo proveedor simulado.'}
 & $dcc -Q '-EBuild' '-NBuild' ('-U.;..\Integracion-IDESI-PointSaleSoft\TestSupport;'+(Join-Path $repoRoot 'PuntoVenta\Fuentes')+';C:\Program Files (x86)\Borland\Delphi7\Lib') Pruebas.dpr *> Build/compile.log
 if($LASTEXITCODE){Get-Content Build/compile.log -Tail 12;throw 'Fallo compilacion prueba Delphi.'}
 $taskRun=Join-Path $PSScriptRoot ('Build/run-'+[guid]::NewGuid().ToString('N'))
 [void](New-Item -ItemType Directory -Path $taskRun)
 Copy-Item Build/Pruebas.exe,Build/Fixture.exe -Destination $taskRun
 & (Join-Path $taskRun 'Pruebas.exe') (Get-Content Build/base.txt -Raw) *> Build/test.log
 Get-Content Build/test.log -Tail 12
 if($LASTEXITCODE){throw 'Fallo restauracion timbre en base aislada.'}
}finally{Pop-Location}
