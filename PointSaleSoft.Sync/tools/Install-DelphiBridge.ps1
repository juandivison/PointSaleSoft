param([switch]$PlanOnly,[string]$SourceDirectory='C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes')
$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncManifest=Get-Content (Join-Path $syncRoot 'delphi/manifest.json') -Raw|ConvertFrom-Json
$syncAllowed=[IO.Path]::GetFullPath($SourceDirectory)
foreach($syncItem in $syncManifest){
 $syncName=Split-Path $syncItem.source -Leaf
 if($syncName -notin @('UInventarioProd.pas','UPuenteCatalogoConfig.pas')){throw 'Unidad Delphi no autorizada.'}
 $syncItem.source=Join-Path $syncRoot ('delphi/'+$syncName)
 $syncItem.target=Join-Path $syncAllowed $syncName
}
foreach($syncItem in $syncManifest){
 if((Split-Path ([IO.Path]::GetFullPath($syncItem.target))) -ne $syncAllowed){throw 'Destino fuera de las fuentes autorizadas.'}
 if((Get-FileHash -LiteralPath $syncItem.source -Algorithm SHA256).Hash.ToLowerInvariant() -ne $syncItem.after){throw 'Candidato alterado; revisar diff.'}
 if(Test-Path -LiteralPath $syncItem.target){
  $syncHash=(Get-FileHash -LiteralPath $syncItem.target -Algorithm SHA256).Hash.ToLowerInvariant()
  if($syncHash -eq $syncItem.after){continue}
  if($syncItem.before -ne $syncHash){throw 'Fuente cambio en Delphi; no se sobrescribe. Preparar candidato nuevamente.'}
 }elseif($null -ne $syncItem.before){throw 'Fuente original no encontrada.'}
}
if($PlanOnly){'DELPHI_INSTALL_PLAN=VERIFIED; FILES=2; DEFAULT=DIRECTO';return}
$syncBackup=Join-Path $syncRoot ('artifacts/delphi-install-'+(Get-Date -Format 'yyyyMMdd-HHmmssfff'))
[void][IO.Directory]::CreateDirectory($syncBackup)
$syncChanged=@()
try{
 foreach($syncItem in $syncManifest){
  if((Test-Path -LiteralPath $syncItem.target) -and (Get-FileHash -LiteralPath $syncItem.target).Hash.ToLowerInvariant() -eq $syncItem.after){continue}
  $syncExisted=Test-Path -LiteralPath $syncItem.target
  if($syncExisted){Copy-Item -LiteralPath $syncItem.target -Destination (Join-Path $syncBackup (Split-Path $syncItem.target -Leaf))}
  $syncChanged+=@{target=$syncItem.target;existed=$syncExisted}
  Copy-Item -LiteralPath $syncItem.source -Destination $syncItem.target
  if((Get-FileHash -LiteralPath $syncItem.target).Hash.ToLowerInvariant() -ne $syncItem.after){throw 'Copia Delphi no coincide.'}
 }
 $syncChanged|ConvertTo-Json|Set-Content (Join-Path $syncBackup 'installed.json')
 'DELPHI_BRIDGE_INSTALLED; DEFAULT=DIRECTO; ERP_COMPILE=USER'
}catch{
 foreach($syncItem in $syncChanged){
  if($syncItem.existed){Copy-Item -LiteralPath (Join-Path $syncBackup (Split-Path $syncItem.target -Leaf)) -Destination $syncItem.target}
  elseif(Test-Path -LiteralPath $syncItem.target){Remove-Item -LiteralPath $syncItem.target}
 }
 throw
}
