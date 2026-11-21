param([Parameter(Mandatory)][string]$Path,[ValidateSet('agent','relay')][string]$Role='agent')
$ErrorActionPreference='Stop'
$syncTarget=[IO.Path]::GetFullPath($Path)
if(Test-Path -LiteralPath $syncTarget){throw 'El archivo privado ya existe; utilice una ruta nueva.'}
$syncParent=Split-Path $syncTarget
if(Test-Path -LiteralPath $syncParent){throw 'Use un directorio privado nuevo y exclusivo para estos secretos.'}
[void][IO.Directory]::CreateDirectory($syncParent)
$syncAcl=Get-Acl -LiteralPath $syncParent
$syncAcl.SetAccessRuleProtection($true,$false)
$syncSid=[Security.Principal.WindowsIdentity]::GetCurrent().User
$syncAcl.AddAccessRule([Security.AccessControl.FileSystemAccessRule]::new($syncSid,'FullControl','ContainerInherit,ObjectInherit','None','Allow'))
$syncAcl.AddAccessRule([Security.AccessControl.FileSystemAccessRule]::new([Security.Principal.SecurityIdentifier]::new('S-1-5-18'),'FullControl','ContainerInherit,ObjectInherit','None','Allow'))
Set-Acl -LiteralPath $syncParent -AclObject $syncAcl
$syncSecrets=@{}
$syncNames=if($Role -eq 'agent'){@('PSSYNC_FIREBIRD','PSSYNC_TOKEN')}else{@('PSSYNC_MYSQL')}
foreach($syncName in $syncNames){$syncSecrets[$syncName]=Read-Host "Valor privado $syncName" -AsSecureString}
$syncSecrets|Export-Clixml -LiteralPath $syncTarget
'SYNC_SECRETS_PROTECTED_CURRENT_USER'
