param([Parameter(Mandatory)][ValidatePattern('^[A-Za-z0-9_-]{1,40}$')][string]$Node,
 [Parameter(Mandatory)][string]$Config,[Parameter(Mandatory)][string]$Secrets)
$ErrorActionPreference='Stop'
$syncLauncher=Join-Path $PSScriptRoot 'Start-Sync.ps1'
foreach($syncPath in @($Config,$Secrets,$syncLauncher)){if(-not (Test-Path -LiteralPath $syncPath)){throw 'Falta archivo requerido.'}}
$syncName='PointSaleSoft.Sync-'+$Node
if(Get-ScheduledTask -TaskName $syncName -ErrorAction SilentlyContinue){throw 'La tarea ya existe; revise la instalacion anterior.'}
$syncUser=[Security.Principal.WindowsIdentity]::GetCurrent().Name
$syncArgs='-NoProfile -NonInteractive -File "'+$syncLauncher+'" -Role agent -Config "'+[IO.Path]::GetFullPath($Config)+'" -Secrets "'+[IO.Path]::GetFullPath($Secrets)+'"'
$syncAction=New-ScheduledTaskAction -Execute 'powershell.exe' -Argument $syncArgs -WorkingDirectory (Split-Path $PSScriptRoot)
$syncTrigger=New-ScheduledTaskTrigger -AtLogOn -User $syncUser
$syncPrincipal=New-ScheduledTaskPrincipal -UserId $syncUser -LogonType Interactive -RunLevel Limited
$syncSettings=New-ScheduledTaskSettingsSet -MultipleInstances IgnoreNew -RestartCount 10 -RestartInterval (New-TimeSpan -Minutes 1) -ExecutionTimeLimit ([TimeSpan]::Zero) -StartWhenAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -TaskName $syncName -Action $syncAction -Trigger $syncTrigger -Principal $syncPrincipal -Settings $syncSettings | Select-Object TaskName,State
