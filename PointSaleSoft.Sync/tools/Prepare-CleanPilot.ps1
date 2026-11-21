$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncQa=Get-Content (Join-Path $syncRoot 'artifacts/qa.json') -Raw|ConvertFrom-Json
$syncArtifacts=[IO.Path]::GetFullPath((Join-Path $syncRoot 'artifacts'))
$syncDir=Join-Path $syncArtifacts ('pilot-clean-'+(Get-Date -Format 'yyyyMMdd-HHmmssfff'))
foreach($syncBackup in @($syncQa.backup,$syncQa.schemaBackup)){
 if(-not [IO.Path]::GetFullPath($syncBackup).StartsWith($syncArtifacts+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Solo respaldos del ensayo autorizado.'}
 if(-not (Test-Path -LiteralPath $syncBackup)){throw 'Falta respaldo de ensayo.'}
}
[void](New-Item -ItemType Directory -Path $syncDir)
$syncDfm=Get-Content 'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm' -Raw
$syncOldUser=$env:ISC_USER;$syncOldPassword=$env:ISC_PASSWORD;$syncOldFb=$env:PSSYNC_FIREBIRD
$syncGbak='C:\Program Files (x86)\Firebird\Firebird_2_5\bin\gbak.exe'
Push-Location $syncRoot
try{
 $env:ISC_USER=[regex]::Match($syncDfm,"user_name=([^']*)'").Groups[1].Value
 $env:ISC_PASSWORD=[regex]::Match($syncDfm,"password=([^']*)'").Groups[1].Value
 $syncMain=Join-Path $syncDir 'principal.fdb';$syncBranch=Join-Path $syncDir 'sucursal2.fdb'
 & $syncGbak -c $syncQa.backup ('localhost:'+$syncMain)
 if($LASTEXITCODE){throw 'Fallo restauracion principal limpia.'}
 & $syncGbak -c $syncQa.schemaBackup ('localhost:'+$syncBranch)
 if($LASTEXITCODE){throw 'Fallo restauracion sucursal limpia.'}
 function Set-SyncConnection([string]$path){
  $b=New-Object System.Data.Common.DbConnectionStringBuilder
  $b['Database']=$path;$b['DataSource']='localhost';$b['Dialect']=1;$b['Charset']='ISO8859_1';$b['Pooling']=$false
  $b['User ID']=$env:ISC_USER;$b['Password']=$env:ISC_PASSWORD;$env:PSSYNC_FIREBIRD=$b.ConnectionString
 }
 function Invoke-Sync([string]$mode,[string]$config){
  dotnet run --project src/PointSaleSoft.Sync.csproj --no-build -- $mode $config
  if($LASTEXITCODE){throw "Fallo herramienta administrativa: $mode"}
 }
 Set-SyncConnection $syncMain
 $syncSourceConfig=Join-Path $syncDir 'init-source.json'
 @{Tenant='PROSESUR_PILOT';Role='source';Directory=(Join-Path $syncDir 'contract')}|ConvertTo-Json|Set-Content $syncSourceConfig
 Invoke-Sync 'init-source' $syncSourceConfig
 $syncContract=Get-Content (Join-Path $syncDir 'contract/source.json') -Raw|ConvertFrom-Json
 $syncContract.Directory=Join-Path $syncDir 'snapshot'
 $syncExportConfig=Join-Path $syncDir 'source.json'
 $syncContract|ConvertTo-Json -Depth 30|Set-Content $syncExportConfig
 Invoke-Sync 'export' $syncExportConfig
 Invoke-Sync 'status' $syncExportConfig | Set-Content (Join-Path $syncDir 'source-status.json')
 Set-SyncConnection $syncBranch
 $syncContract.Role='branch';$syncBranchConfig=Join-Path $syncDir 'branch.json'
 $syncContract|ConvertTo-Json -Depth 30|Set-Content $syncBranchConfig
 Invoke-Sync 'init-empty-branch' $syncBranchConfig
 Invoke-Sync 'bootstrap' $syncBranchConfig
 Invoke-Sync 'status' $syncBranchConfig | Set-Content (Join-Path $syncDir 'branch-status.json')
 @{principal=$syncMain;sucursal=$syncBranch;directory=$syncDir;fixtures=$false;erpConfigurationSeeded=$false;sourceOriginalModified=$false}|ConvertTo-Json|Set-Content (Join-Path $syncArtifacts 'pilot-clean.json')
 'CLEAN_PILOT_BOOTSTRAP=PASS; ERP_CONFIGURATION_PENDING=1'
}finally{
 Pop-Location
 $env:ISC_USER=$syncOldUser;$env:ISC_PASSWORD=$syncOldPassword;$env:PSSYNC_FIREBIRD=$syncOldFb;$syncDfm=$null
}
