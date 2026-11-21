$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncOut=Join-Path $syncRoot 'artifacts/delphi-check'
[void][IO.Directory]::CreateDirectory($syncOut)
$syncCompiler='C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe'
Push-Location (Join-Path $syncRoot 'tests')
try{
 & $syncCompiler ('-E'+$syncOut) ('-N'+$syncOut) ('-U'+(Join-Path $syncRoot 'delphi')+';C:\Program Files (x86)\Borland\Delphi7\Lib') PuenteConfigTests.dpr *> (Join-Path $syncOut 'compile.log')
 if($LASTEXITCODE){throw 'Fallo compilacion prueba unitaria Delphi; ver compile.log.'}
 $syncQa=Get-Content (Join-Path $syncRoot 'artifacts/qa.json') -Raw|ConvertFrom-Json
 foreach($p in @($syncQa.principal,$syncQa.sucursal)){
  if(-not [IO.Path]::GetFullPath($p).StartsWith((Join-Path $syncRoot 'artifacts')+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Solo bases QA.'}
 }
 $syncDfm=Get-Content 'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm' -Raw
 $syncOld=@{};foreach($n in @('ISC_USER','ISC_PASSWORD','PSSYNC_TEST_MAIN','PSSYNC_TEST_BRANCH')){$syncOld[$n]=[Environment]::GetEnvironmentVariable($n,'Process')}
 try{
  $env:ISC_USER=[regex]::Match($syncDfm,"user_name=([^']*)'").Groups[1].Value
  $env:ISC_PASSWORD=[regex]::Match($syncDfm,"password=([^']*)'").Groups[1].Value
  $env:PSSYNC_TEST_MAIN=$syncQa.principal;$env:PSSYNC_TEST_BRANCH=$syncQa.sucursal
  & (Join-Path $syncOut 'PuenteConfigTests.exe') *> (Join-Path $syncOut 'test.log')
  if($LASTEXITCODE){throw 'Fallo prueba selector Delphi; ver test.log.'}
  Get-Content (Join-Path $syncOut 'test.log')
 }finally{foreach($n in $syncOld.Keys){[Environment]::SetEnvironmentVariable($n,$syncOld[$n],'Process')};$syncDfm=$null}
}finally{Pop-Location}
