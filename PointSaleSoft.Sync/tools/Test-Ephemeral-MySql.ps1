param([string]$ReuseInitialized)
$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncArtifacts=[IO.Path]::GetFullPath((Join-Path $syncRoot 'artifacts'))
$syncData=if($ReuseInitialized){[IO.Path]::GetFullPath((Join-Path $syncRoot $ReuseInitialized))}else{Join-Path $syncArtifacts ('mysql-ephemeral-'+[guid]::NewGuid().ToString('N'))}
if(-not [IO.Path]::GetFullPath($syncData).StartsWith($syncArtifacts+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Ruta MySQL fuera de QA.'}
if(-not $ReuseInitialized){[void](New-Item -ItemType Directory -Path $syncData)}
$syncAcl=Get-Acl -LiteralPath $syncData
$syncAcl.SetAccessRuleProtection($true,$false)
$syncAcl.AddAccessRule([Security.AccessControl.FileSystemAccessRule]::new([Security.Principal.WindowsIdentity]::GetCurrent().User,'FullControl','ContainerInherit,ObjectInherit','None','Allow'))
$syncAcl.AddAccessRule([Security.AccessControl.FileSystemAccessRule]::new([Security.Principal.SecurityIdentifier]::new('S-1-5-18'),'FullControl','ContainerInherit,ObjectInherit','None','Allow'))
Set-Acl -LiteralPath $syncData -AclObject $syncAcl
$syncImage=(Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Services\MySQL80' -Name ImagePath).ImagePath
$syncMatch=[regex]::Match($syncImage,'(?i)(?:"([^"\r\n]+mysqld\.exe)"|([^\r\n]+?mysqld\.exe))')
$syncExe=if($syncMatch.Groups[1].Success){$syncMatch.Groups[1].Value}else{$syncMatch.Groups[2].Value.Trim()}
if(-not (Test-Path -LiteralPath $syncExe)){throw 'No se encontro mysqld instalado.'}
$syncDatadir=Join-Path $syncData 'data'
if($ReuseInitialized){
 if(-not (Test-Path -LiteralPath (Join-Path $syncDatadir 'mysql')) -or -not (Select-String -LiteralPath (Join-Path $syncData 'initialize.err') -SimpleMatch 'initializing of server has completed' -Quiet)){throw 'Directorio no confirma inicializacion completa.'}
}else{
[void](New-Item -ItemType Directory -Path $syncDatadir)
$syncInitialize=Start-Process -FilePath $syncExe -ArgumentList @('--no-defaults','--initialize-insecure',('--datadir="'+$syncDatadir+'"'),'--console') -WindowStyle Hidden -PassThru -RedirectStandardOutput (Join-Path $syncData 'initialize.out') -RedirectStandardError (Join-Path $syncData 'initialize.err')
$syncDeadline=[DateTime]::UtcNow.AddSeconds(180)
while(-not $syncInitialize.WaitForExit(1000)){
 if([DateTime]::UtcNow -gt $syncDeadline){$syncInitialize.Kill();throw 'Inicializacion MySQL excedio 180 segundos; proceso QA detenido.'}
}
if($syncInitialize.ExitCode -ne 0){throw 'Fallo inicializacion MySQL aislada; ver initialize.err.'}
}
$syncListener=New-Object Net.Sockets.TcpListener([Net.IPAddress]::Loopback,0)
$syncListener.Start();$syncPort=$syncListener.LocalEndpoint.Port;$syncListener.Stop()
$syncPassword=[guid]::NewGuid().ToString('N')+[guid]::NewGuid().ToString('N')
$syncInit=Join-Path $syncData 'init-private.sql'
[IO.File]::WriteAllText($syncInit,"ALTER USER 'root'@'localhost' IDENTIFIED BY '$syncPassword';`nCREATE USER IF NOT EXISTS 'root'@'127.0.0.1' IDENTIFIED BY '$syncPassword';`nALTER USER 'root'@'127.0.0.1' IDENTIFIED BY '$syncPassword';`nGRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1' WITH GRANT OPTION;",[Text.Encoding]::ASCII)
$syncProcess=$null;$syncOld=$env:PSSYNC_MYSQL_QA
try{
 $syncProcess=Start-Process -FilePath $syncExe -ArgumentList @('--no-defaults','--no-monitor','--skip-name-resolve',('--datadir="'+$syncDatadir+'"'),'--bind-address=127.0.0.1',('--port='+$syncPort),'--mysqlx=OFF','--innodb-buffer-pool-size=64M',('--init-file="'+$syncInit+'"'),'--console') -WindowStyle Hidden -PassThru -RedirectStandardOutput (Join-Path $syncData 'server.out') -RedirectStandardError (Join-Path $syncData 'server.err')
 [pscustomobject]@{pid=$syncProcess.Id;port=$syncPort;data=$syncDatadir}|ConvertTo-Json|Set-Content (Join-Path $syncArtifacts 'mysql-ephemeral-instance.json')
 $syncReady=$false
 for($i=0;$i -lt 100;$i++){
  if($syncProcess.HasExited){throw 'La instancia MySQL QA no pudo arrancar; ver server.err.'}
  if((Test-Path (Join-Path $syncData 'server.err')) -and (Select-String -LiteralPath (Join-Path $syncData 'server.err') -SimpleMatch 'ready for connections' -Quiet)){$syncReady=$true;break}
  Start-Sleep -Milliseconds 300
 }
 if(-not $syncReady){throw 'MySQL QA no confirmo disponibilidad.'}
 Remove-Item -LiteralPath $syncInit
 $syncBuilder=New-Object System.Data.Common.DbConnectionStringBuilder
 $syncBuilder['Server']='127.0.0.1';$syncBuilder['Port']=$syncPort;$syncBuilder['User ID']='root';$syncBuilder['Password']=$syncPassword
 $syncBuilder['Database']='pointsale_sync_qa_'+(Get-Date -Format 'yyyyMMddHHmmssfff');$syncBuilder['Pooling']=$false
 $env:PSSYNC_MYSQL_QA=$syncBuilder.ConnectionString
 Push-Location $syncRoot
 try{
  dotnet run --project tests\PointSaleSoft.Sync.Tests.csproj --no-build -- --mysql *> artifacts\mysql-integration.log
  $syncExit=$LASTEXITCODE
  Get-Content artifacts\mysql-integration.log -Tail 22
  if($syncExit -ne 0){throw 'Prueba MySQL no completada; ver mysql-integration.log.'}
 }finally{Pop-Location}
}finally{
 if($syncProcess -and -not $syncProcess.HasExited){
  $syncPriorPwd=$env:MYSQL_PWD
  try{
   $env:MYSQL_PWD=$syncPassword
   $syncAdmin=Join-Path (Split-Path $syncExe) 'mysqladmin.exe'
   & $syncAdmin --no-defaults --host=127.0.0.1 ('--port='+$syncPort) --user=root --connect-timeout=3 shutdown 2>$null
   [void]$syncProcess.WaitForExit(10000)
  }catch{ }finally{$env:MYSQL_PWD=$syncPriorPwd}
 }
 $env:PSSYNC_MYSQL_QA=$syncOld;$syncPassword=$null
 if(Test-Path -LiteralPath $syncInit){Remove-Item -LiteralPath $syncInit}
 # Only the process created above is stopped. The registered MySQL80 service is untouched.
 if($syncProcess -and -not $syncProcess.HasExited){Stop-Process -Id $syncProcess.Id;[void]$syncProcess.WaitForExit(10000)}
}

