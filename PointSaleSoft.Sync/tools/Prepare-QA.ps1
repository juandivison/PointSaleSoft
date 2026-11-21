$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncSource='C:\Proyectos\Datos\Repositorio\PuntoVenta\Prosesur\Prod\DBDATOSPROSESUR.FDB'
$syncDir=Join-Path $syncRoot ('artifacts\qa-'+(Get-Date -Format 'yyyyMMdd-HHmmssfff'))
[void](New-Item -ItemType Directory -Path $syncDir)
$syncDfm=Get-Content 'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm' -Raw
$syncOldUser=$env:ISC_USER;$syncOldPassword=$env:ISC_PASSWORD
$syncGbak='C:\Program Files (x86)\Firebird\Firebird_2_5\bin\gbak.exe'
try{
 $env:ISC_USER=[regex]::Match($syncDfm,"user_name=([^']*)'").Groups[1].Value
 $env:ISC_PASSWORD=[regex]::Match($syncDfm,"password=([^']*)'").Groups[1].Value
 $syncBackup=Join-Path $syncDir 'prosesur.fbk';$syncMeta=Join-Path $syncDir 'schema.fbk'
 & $syncGbak '-b' '-g' ('localhost:'+$syncSource) $syncBackup
 if($LASTEXITCODE){throw 'Fallo respaldo completo.'}
 & $syncGbak '-b' '-m' '-g' ('localhost:'+$syncSource) $syncMeta
 if($LASTEXITCODE){throw 'Fallo respaldo de esquema.'}
 $syncMain=Join-Path $syncDir 'principal.fdb';$syncBranch=Join-Path $syncDir 'sucursal2.fdb'
 & $syncGbak '-c' $syncBackup ('localhost:'+$syncMain)
 if($LASTEXITCODE){throw 'Fallo restauracion principal de ensayo.'}
 & $syncGbak '-c' $syncMeta ('localhost:'+$syncBranch)
 if($LASTEXITCODE){throw 'Fallo restauracion esquema sucursal.'}
 $syncConfig=[ordered]@{sourceOriginal=$syncSource;principal=$syncMain;sucursal=$syncBranch;backup=$syncBackup;schemaBackup=$syncMeta;originalModified=$false}
 $syncConfig|ConvertTo-Json|Set-Content (Join-Path $syncRoot 'artifacts\qa.json')
 'COPIAS_QA=PASS; ORIGINAL_MODIFICADA=0'
}finally{$env:ISC_USER=$syncOldUser;$env:ISC_PASSWORD=$syncOldPassword;$syncDfm=$null}
