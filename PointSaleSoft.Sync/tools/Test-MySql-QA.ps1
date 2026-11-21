$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncCredential=Import-Clixml -LiteralPath (Join-Path $syncRoot 'artifacts\mysql-qa.credential.xml')
$syncPassword=$syncCredential.GetNetworkCredential().Password
$syncDatabase='pointsale_sync_qa_'+(Get-Date -Format 'yyyyMMddHHmmssfff')
# Quote with the .NET connection-string builder, never shell interpolation.
$syncBuilder=New-Object System.Data.Common.DbConnectionStringBuilder
$syncBuilder['Server']='127.0.0.1';$syncBuilder['Port']=3306;$syncBuilder['User ID']=$syncCredential.UserName
$syncBuilder['Password']=$syncPassword;$syncBuilder['Database']=$syncDatabase;$syncBuilder['Pooling']=$false
$syncOld=$env:PSSYNC_MYSQL_QA
try{
 $env:PSSYNC_MYSQL_QA=$syncBuilder.ConnectionString
 Push-Location $syncRoot
 try{
  dotnet run --project tests\PointSaleSoft.Sync.Tests.csproj --no-build -- --mysql *> artifacts\mysql-integration.log
  $syncExit=$LASTEXITCODE
  Get-Content artifacts\mysql-integration.log -Tail 15
  if($syncExit -ne 0){throw 'Prueba MySQL no completada. Ver artifacts/mysql-integration.log; no se modificaron bases de negocio.'}
 }finally{Pop-Location}
}finally{$env:PSSYNC_MYSQL_QA=$syncOld;$syncPassword=$null;$syncCredential=$null;$syncBuilder.Clear()}
