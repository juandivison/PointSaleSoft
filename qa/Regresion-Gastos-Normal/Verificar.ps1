$ErrorActionPreference='Stop'
$repoRoot=Split-Path (Split-Path $PSScriptRoot)
$env:PSS_TEST_DFM=Join-Path $repoRoot 'PuntoVenta/Fuentes/UDatModConectar.dfm'
if(-not $env:PSS_FIREBIRD_PROVIDER){$env:PSS_FIREBIRD_PROVIDER=Join-Path $repoRoot 'PointSaleSoft.Sync/src/bin/Release/net10.0/FirebirdSql.Data.FirebirdClient.dll'}
$dcc=if($env:PSS_DCC32){$env:PSS_DCC32}else{'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe'}
[void][IO.Directory]::CreateDirectory((Join-Path $PSScriptRoot 'Build'))
Push-Location $PSScriptRoot
try{
 dotnet build Fixture/Fixture.csproj -p:NuGetAudit=false --verbosity quiet
 if($LASTEXITCODE){throw 'No compilo el proveedor simulado de gastos'}
 & ./Crear-Base.ps1
 Push-Location Fuentes
 try{& $dcc -Q '-E..\Build' '-N..\Build' ('-U.;..\..\Integracion-IDESI-PointSaleSoft\TestSupport;'+(Join-Path $repoRoot 'PuntoVenta/Fuentes')+';C:\Program Files (x86)\Borland\Delphi7\Lib') QANormal.dpr *> ../Build/compile.log;if($LASTEXITCODE){throw 'No compilo prueba de gastos'}}finally{Pop-Location}
 & ./Build/QANormal.exe (Get-Content Build/base.txt -Raw) (Join-Path $PSScriptRoot 'Fixture/bin/Debug/net10.0/Fixture.exe') *> Build/test.log
 $result=$LASTEXITCODE;Get-Content Build/test.log -Tail 5;if($result){throw 'Fallo regresion de gastos'}
}finally{Pop-Location}
