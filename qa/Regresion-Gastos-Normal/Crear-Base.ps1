$ErrorActionPreference='Stop'
Add-Type -Path $env:PSS_FIREBIRD_PROVIDER
$taskDfm=Get-Content -Raw $env:PSS_TEST_DFM
$taskBuilder=New-Object FirebirdSql.Data.FirebirdClient.FbConnectionStringBuilder
$taskBuilder.DataSource='localhost'
$taskDbPath=[string](Join-Path $PSScriptRoot ('Build\normal-'+[guid]::NewGuid().ToString('N')+'.fdb'))
$taskBuilder.Database=$taskDbPath
$taskBuilder.UserID=[regex]::Match($taskDfm,"user_name=([^']*)'").Groups[1].Value
$taskBuilder.Password=[regex]::Match($taskDfm,"password=([^']*)'").Groups[1].Value
$taskBuilder.Dialect=1;$taskBuilder.Pooling=$false
[FirebirdSql.Data.FirebirdClient.FbConnection]::CreateDatabase($taskBuilder.ConnectionString)
$taskConnection=New-Object FirebirdSql.Data.FirebirdClient.FbConnection($taskBuilder.ConnectionString)
$taskConnection.Open();$taskTx=$taskConnection.BeginTransaction();$taskCmd=$taskConnection.CreateCommand();$taskCmd.Transaction=$taskTx
try{
 $taskSql=Get-Content -Raw (Join-Path $PSScriptRoot 'Esquema.sql')
 $taskSql+="`n"+(Get-Content -Raw (Join-Path $PSScriptRoot '..\TestSupport\ECF-GASTO-ENVIO-FB25.sql'))
 $taskSql+='CREATE GENERATOR GEN_ECF_GASTO_ENVIO_ID;'
 $taskParts=@($taskSql -split ';' | Where-Object {$_.Trim()} | ForEach-Object {$_.Trim()})
 foreach($taskStage in @('tablas','indices','datos')){
  foreach($taskPart in $taskParts){
   $taskRun=($taskStage -eq 'tablas' -and $taskPart -match '^CREATE (TABLE|GENERATOR)') -or ($taskStage -eq 'indices' -and $taskPart -match '^CREATE INDEX') -or ($taskStage -eq 'datos' -and $taskPart -match '^INSERT')
   if($taskRun){$taskCmd.CommandText=$taskPart;[void]$taskCmd.ExecuteNonQuery()}
  }
  $taskTx.Commit()
  if($taskStage -ne 'datos'){$taskTx=$taskConnection.BeginTransaction();$taskCmd.Transaction=$taskTx}
 }
 [IO.File]::WriteAllText((Join-Path $PSScriptRoot 'Build\base.txt'),$taskBuilder.Database)
 Write-Output 'BASE_SINTETICA=CREADA; BASE_COMERCIAL=SIN_CAMBIOS'
}finally{$taskCmd.Dispose();$taskConnection.Dispose();$taskBuilder.Password='';$taskDfm=$null}
