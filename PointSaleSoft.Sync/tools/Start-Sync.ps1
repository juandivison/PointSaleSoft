param([Parameter(Mandatory)][ValidateSet('agent','relay')][string]$Role,
 [Parameter(Mandatory)][string]$Config,[Parameter(Mandatory)][string]$Secrets,
 [string]$Executable=(Join-Path (Split-Path $PSScriptRoot) 'app/PointSaleSoft.Sync.exe'))
$ErrorActionPreference='Stop'
$syncPrivate=Import-Clixml -LiteralPath $Secrets
$syncPrior=@{}
try{
 foreach($syncName in $syncPrivate.Keys){
  if($syncName -notin @('PSSYNC_FIREBIRD','PSSYNC_TOKEN','PSSYNC_MYSQL')){throw 'Nombre de secreto no permitido.'}
  if($syncPrivate[$syncName] -isnot [Security.SecureString]){throw 'Se requiere secreto cifrado por Windows.'}
  $syncPrior[$syncName]=[Environment]::GetEnvironmentVariable($syncName,'Process')
  $syncPlain=[Net.NetworkCredential]::new('',$syncPrivate[$syncName]).Password
  [Environment]::SetEnvironmentVariable($syncName,$syncPlain,'Process');$syncPlain=$null
 }
 & $Executable $Role ([IO.Path]::GetFullPath($Config))
 if($LASTEXITCODE){throw 'El proceso de sincronizacion termino con error.'}
}finally{
 foreach($syncName in $syncPrior.Keys){[Environment]::SetEnvironmentVariable($syncName,$syncPrior[$syncName],'Process')}
 $syncPrivate=$null
}
