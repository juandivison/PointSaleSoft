$ErrorActionPreference='Stop'
$repo=Split-Path (Split-Path $PSScriptRoot)
if(-not(Test-Path (Join-Path $repo 'PuntoVenta/Fuentes'))){$repo='C:\Proyectos\PointSaleSoftResp'}
$env:PSS_TEST_DFM=Join-Path $repo 'PuntoVenta/Fuentes/UDatModConectar.dfm'
$dcc=if($env:PSS_DCC32){$env:PSS_DCC32}else{'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe'}
$python=if($env:PSS_PYTHON){$env:PSS_PYTHON}else{'python'}
Push-Location $PSScriptRoot
try{
 [void][IO.Directory]::CreateDirectory((Join-Path $PSScriptRoot 'Build'))
 & $python preparar_prueba.py
 if($LASTEXITCODE){throw 'No se pudo extraer la fuente de prueba'}
 & ./Crear-Base.ps1
 & $dcc -Q '-EBuild' '-NBuild' '-UBuild' Pruebas.dpr *> Build/compile.log
 if($LASTEXITCODE){Get-Content Build/compile.log -Tail 10;throw 'No compilo prueba de busqueda'}
 & ./Build/Pruebas.exe (Get-Content Build/base.txt -Raw) *> Build/test.log
 $code=$LASTEXITCODE;Get-Content Build/test.log -Tail 8;if($code){throw 'Fallo prueba de busqueda'}
}finally{Pop-Location}
