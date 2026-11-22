$ErrorActionPreference='Stop'
$repo=Split-Path (Split-Path $PSScriptRoot)
$env:PSS_TEST_DFM=Join-Path $repo 'PuntoVenta/Fuentes/UDatModConectar.dfm'
$dcc=if($env:PSS_DCC32){$env:PSS_DCC32}else{'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe'}
Push-Location $PSScriptRoot
try{
 [void][IO.Directory]::CreateDirectory((Join-Path $PSScriptRoot 'Build'))
 & ./Crear-Base.ps1
 & $dcc -Q '-EBuild' '-NBuild' ('-U'+(Join-Path $repo 'PuntoVenta/Fuentes')) Pruebas.dpr *> Build/compile.log
 if($LASTEXITCODE){Get-Content Build/compile.log -Tail 12;throw 'Fallo compilacion prueba de presentacion'}
 & ./Build/Pruebas.exe (Get-Content Build/base.txt -Raw) *> Build/test.log
 $code=$LASTEXITCODE;Get-Content Build/test.log -Tail 12;if($code){throw 'Fallo pruebas de presentacion'}
}finally{Pop-Location}
