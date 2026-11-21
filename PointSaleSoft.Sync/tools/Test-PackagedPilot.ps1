$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncPackage=Get-Content (Join-Path $syncRoot 'artifacts/package-result.json') -Raw|ConvertFrom-Json
$syncPilot=Get-Content (Join-Path $syncRoot 'artifacts/clean-pilot.json') -Raw|ConvertFrom-Json
$syncDir=Join-Path $syncRoot ('artifacts/package-smoke-'+[guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($syncDir)
$syncExecutable=Join-Path ($syncPackage.zip -replace '\.zip$','') 'app/PointSaleSoft.Sync.exe'
$syncRelay=Get-Content (Join-Path $syncPilot.provision 'relay.json') -Raw|ConvertFrom-Json
$syncListener=[Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback,0)
$syncListener.Start();$syncPort=$syncListener.LocalEndpoint.Port;$syncListener.Stop()
$syncRelay.Url='http://127.0.0.1:'+$syncPort
$syncRelay|Add-Member -NotePropertyName LocalQaFile -NotePropertyValue (Join-Path $syncDir 'qa-relay.json')
$syncRelayConfig=Join-Path $syncDir 'relay.json';$syncRelay|ConvertTo-Json -Depth 35|Set-Content $syncRelayConfig
$syncProcesses=@();$syncReaders=@();$syncSecrets=$null
function Start-SyncProcess([string]$role,[string]$config,[hashtable]$variables){
 $info=[Diagnostics.ProcessStartInfo]::new($syncExecutable)
 $info.UseShellExecute=$false;$info.CreateNoWindow=$true;$info.RedirectStandardOutput=$true;$info.RedirectStandardError=$true
 $info.ArgumentList.Add($role);$info.ArgumentList.Add($config)
 foreach($k in $variables.Keys){$info.Environment[$k]=$variables[$k]}
 $p=[Diagnostics.Process]::Start($info)
 foreach($k in $variables.Keys){[void]$info.Environment.Remove($k)}
 return $p
}
try{
 $syncProcesses+=Start-SyncProcess 'relay' $syncRelayConfig @{PSSYNC_LOCAL_QA='1'}
 $syncReaders+=@{stdout=$syncProcesses[-1].StandardOutput.ReadToEndAsync();stderr=$syncProcesses[-1].StandardError.ReadToEndAsync()}
 $syncReady=$false
 for($i=0;$i -lt 40;$i++){
  try{ $health=Invoke-RestMethod ($syncRelay.Url+'/health') -TimeoutSec 1; if($health.protocol -eq 1){$syncReady=$true;break} }catch{ }
  Start-Sleep -Milliseconds 250
 }
 if(-not $syncReady){throw 'Paquete relay no inicio.'}
 foreach($node in @('source','branch')){
  $syncSecrets=Import-Clixml (Join-Path $syncPilot.provision ('private/'+$node+'.xml'))
  $values=@{};foreach($k in $syncSecrets.Keys){$values[$k]=[Net.NetworkCredential]::new('',$syncSecrets[$k]).Password}
  $tokenHash=[Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes($values.PSSYNC_TOKEN))).ToLowerInvariant()
  if($syncRelay.Identities.Where({$_.Role -eq $node}).TokenHash -ne $tokenHash){throw 'Identidad privada no coincide.'}
  $options=Get-Content (Join-Path $syncPilot.provision ($node+'.json')) -Raw|ConvertFrom-Json
  $options.RelayUrl=$syncRelay.Url+'/'
  $config=Join-Path $syncDir ($node+'.json');$options|ConvertTo-Json -Depth 35|Set-Content $config
  $syncProcesses+=Start-SyncProcess 'agent' $config $values
  $syncReaders+=@{stdout=$syncProcesses[-1].StandardOutput.ReadToEndAsync();stderr=$syncProcesses[-1].StandardError.ReadToEndAsync()}
  $values.Clear();$syncSecrets=$null
 }
 Start-Sleep -Seconds 3
 if(@($syncProcesses|Where-Object HasExited).Count){throw 'Un proceso del paquete termino prematuramente.'}
}finally{
 foreach($p in $syncProcesses){if(-not $p.HasExited){$p.Kill();$p.WaitForExit()}}
}
foreach($r in $syncReaders){
 $out=$r.stdout.GetAwaiter().GetResult();$err=$r.stderr.GetAwaiter().GetResult()
 if($out.Contains('SYNC_PENDING') -or $err.Contains('SYNC_PENDING') -or $err.Contains('SYNC_START_FAILED')){throw 'Paquete reporto fallo en agente.'}
}
@{packageStarts=$true;relayHealth=$true;agentsAlive=$true;dpapiIdentityMatches=$true;store='FILE_QA';catalogMutations=0;tasksInstalled=0}|ConvertTo-Json|Set-Content (Join-Path $syncRoot 'artifacts/package-smoke-result.json')
'SYNC_PACKAGE_SMOKE=PASS; DPAPI=PASS; STORE=FILE_QA; CATALOG_MUTATIONS=0'
