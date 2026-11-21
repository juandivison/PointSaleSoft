param([Parameter(Mandatory)][string]$SnapshotDirectory,[Parameter(Mandatory)][string]$OutputDirectory,
 [Parameter(Mandatory)][Security.SecureString]$SourceConnection,[Parameter(Mandatory)][Security.SecureString]$BranchConnection,
 [string]$RelayUrl='http://127.0.0.1:5195/',[string]$Branch='0002')
$ErrorActionPreference='Stop'
$syncUri=[Uri]$RelayUrl
if($syncUri.Scheme -ne 'https' -and -not ($syncUri.Scheme -eq 'http' -and $syncUri.IsLoopback)){throw 'Se requiere HTTPS o loopback.'}
$syncManifest=Get-Content (Join-Path $SnapshotDirectory 'manifest.json') -Raw|ConvertFrom-Json
$syncOutput=[IO.Path]::GetFullPath($OutputDirectory)
if(Test-Path -LiteralPath $syncOutput){throw 'Use directorio de provision nuevo.'}
[void][IO.Directory]::CreateDirectory($syncOutput)
$syncPrivate=Join-Path $syncOutput 'private';[void][IO.Directory]::CreateDirectory($syncPrivate)
$syncAcl=Get-Acl $syncPrivate;$syncAcl.SetAccessRuleProtection($true,$false)
$syncAcl.AddAccessRule([Security.AccessControl.FileSystemAccessRule]::new([Security.Principal.WindowsIdentity]::GetCurrent().User,'FullControl','ContainerInherit,ObjectInherit','None','Allow'))
$syncAcl.AddAccessRule([Security.AccessControl.FileSystemAccessRule]::new([Security.Principal.SecurityIdentifier]::new('S-1-5-18'),'FullControl','ContainerInherit,ObjectInherit','None','Allow'))
Set-Acl $syncPrivate $syncAcl
function Get-SyncHash([string]$value){
 $sha=[Security.Cryptography.SHA256]::Create()
 try{return ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($value)))).Replace('-','').ToLowerInvariant()}finally{$sha.Dispose()}
}
$syncSourceToken=[guid]::NewGuid().ToString('N')+[guid]::NewGuid().ToString('N')
$syncBranchToken=[guid]::NewGuid().ToString('N')+[guid]::NewGuid().ToString('N')
try{
 $syncPolicies=@{};$syncPolicies[$syncManifest.Tenant]=$syncManifest.Policy
 $syncRelay=@{Url='http://127.0.0.1:5195';Tenants=@(@{Id=$syncManifest.Tenant;Epoch=$syncManifest.Epoch;PolicyHash=$syncManifest.Policy.Hash;Branches=@($Branch)});Identities=@(
  @{Tenant=$syncManifest.Tenant;Node='principal';Role='source';TokenHash=(Get-SyncHash $syncSourceToken)},
  @{Tenant=$syncManifest.Tenant;Node=$Branch;Role='branch';TokenHash=(Get-SyncHash $syncBranchToken)});Policies=$syncPolicies}
 $syncRelay|ConvertTo-Json -Depth 35|Set-Content (Join-Path $syncOutput 'relay.json')
 foreach($syncRole in @('source','branch')){
  @{Role=$syncRole;Tenant=$syncManifest.Tenant;Epoch=$syncManifest.Epoch;RelayUrl=$RelayUrl;Token='';FirebirdConnectionString='';Policy=$syncManifest.Policy;PollMilliseconds=1000}|ConvertTo-Json -Depth 35|Set-Content (Join-Path $syncOutput ($syncRole+'.json'))
  $syncToken=if($syncRole -eq 'source'){$syncSourceToken}else{$syncBranchToken}
  $syncConnection=if($syncRole -eq 'source'){$SourceConnection}else{$BranchConnection}
  @{PSSYNC_TOKEN=(ConvertTo-SecureString $syncToken -AsPlainText -Force);PSSYNC_FIREBIRD=$syncConnection}|Export-Clixml (Join-Path $syncPrivate ($syncRole+'.xml'))
 }
 @{ready=$true;boundToCurrentWindowsUser=$true;portableSecrets=$false}|ConvertTo-Json|Set-Content (Join-Path $syncOutput 'provisioning-complete.json')
 'SYNC_LOCAL_PILOT_CONFIGURED; TASKS_INSTALLED=0; PRIVATE_SCOPE=CURRENT_WINDOWS_USER'
}finally{$syncSourceToken=$null;$syncBranchToken=$null;$syncToken=$null}
