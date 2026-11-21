param([Parameter(Mandatory)][string]$PilotDirectory)
$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncPilot=[IO.Path]::GetFullPath($PilotDirectory)
if(-not $syncPilot.StartsWith((Join-Path $syncRoot 'artifacts')+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Solo par piloto dentro de artifacts.'}
$syncDfm=Get-Content 'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm' -Raw
$syncPrevious=$env:PSSYNC_FIREBIRD
Push-Location $syncRoot
try{
 $syncConnections=@{}
 foreach($syncNode in @('source','branch')){
  $syncFile=if($syncNode -eq 'source'){'principal.fdb'}else{'sucursal2.fdb'}
  $syncBuilder=New-Object System.Data.Common.DbConnectionStringBuilder
  $syncBuilder['Database']=[string](Join-Path $syncPilot $syncFile);$syncBuilder['DataSource']='localhost';$syncBuilder['Dialect']=1;$syncBuilder['Charset']='ISO8859_1';$syncBuilder['Pooling']=$false
  $syncBuilder['User ID']=[regex]::Match($syncDfm,"user_name=([^']*)'").Groups[1].Value
  $syncBuilder['Password']=[regex]::Match($syncDfm,"password=([^']*)'").Groups[1].Value
  $syncConnections[$syncNode]=ConvertTo-SecureString $syncBuilder.ConnectionString -AsPlainText -Force
  $env:PSSYNC_FIREBIRD=$syncBuilder.ConnectionString
  dotnet run --project src/PointSaleSoft.Sync.csproj -c Release --no-build -- status (Join-Path $syncPilot ($syncNode+'.json')) > (Join-Path $syncPilot ($syncNode+'-status.json'))
  if($LASTEXITCODE){throw 'Fallo estado piloto.'}
 }
 dotnet run --project src/PointSaleSoft.Sync.csproj -c Release --no-build -- verify-clean (Join-Path $syncPilot 'branch.json') > (Join-Path $syncPilot 'clean-verification.json')
 if($LASTEXITCODE){throw 'Sucursal piloto no esta limpia.'}
 $syncSource=Get-Content (Join-Path $syncPilot 'source-status.json') -Raw|ConvertFrom-Json
 $syncBranch=Get-Content (Join-Path $syncPilot 'branch-status.json') -Raw|ConvertFrom-Json
 foreach($p in $syncSource.counts.PSObject.Properties){if($syncBranch.counts.($p.Name) -ne $p.Value){throw 'Conteos piloto diferentes.'}}
 if($syncSource.counts.INVENTARIO_PRODUCTO -ne 18398 -or $syncSource.counts.PRECIO_UNIDADSURTIDORA -ne 16946){throw 'Conteos distintos del respaldo autorizado.'}
 $syncProvision=Join-Path $syncPilot 'local-provision'
 if((Test-Path -LiteralPath $syncProvision) -and -not (Test-Path (Join-Path $syncProvision 'provisioning-complete.json'))){$syncProvision=Join-Path $syncPilot ('local-provision-'+[guid]::NewGuid().ToString('N'))}
 if(-not (Test-Path -LiteralPath $syncProvision)){
  & (Join-Path $PSScriptRoot 'New-LocalPilotConfiguration.ps1') -SnapshotDirectory (Join-Path $syncPilot 'snapshot') -OutputDirectory $syncProvision -SourceConnection $syncConnections.source -BranchConnection $syncConnections.branch
 }
 [ordered]@{directory=$syncPilot;provision=$syncProvision;principal=(Join-Path $syncPilot 'principal.fdb');sucursal=(Join-Path $syncPilot 'sucursal2.fdb');clean=$true;companyUsersConfigured=$false;originalModified=$false;epoch=$syncSource.epoch}|ConvertTo-Json|Set-Content (Join-Path $syncRoot 'artifacts/clean-pilot.json')
 Get-Content (Join-Path $syncPilot 'clean-verification.json')
 'CLEAN_PILOT_VERIFIED; CONFIGURATION=DELPHI_USER; FIXTURES=0'
}finally{$env:PSSYNC_FIREBIRD=$syncPrevious;$syncDfm=$null;$syncConnections=$null;Pop-Location}
