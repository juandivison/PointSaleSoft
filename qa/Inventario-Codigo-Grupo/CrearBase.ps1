$ErrorActionPreference='Stop'
$taskRoot=$PSScriptRoot
Add-Type -Path $env:PSS_FIREBIRD_PROVIDER
$taskDfm=Get-Content -Raw $env:PSS_TEST_DFM
$taskB=New-Object FirebirdSql.Data.FirebirdClient.FbConnectionStringBuilder
$taskB.DataSource='localhost';$taskB.Database=[string](Join-Path $taskRoot ('Build\qa-'+[guid]::NewGuid().ToString('N')+'.fdb'));$taskB.Dialect=1;$taskB.Pooling=$false
$taskB.UserID=[regex]::Match($taskDfm,"user_name=([^']*)'").Groups[1].Value
$taskB.Password=[regex]::Match($taskDfm,"password=([^']*)'").Groups[1].Value
[FirebirdSql.Data.FirebirdClient.FbConnection]::CreateDatabase($taskB.ConnectionString)
$taskC=New-Object FirebirdSql.Data.FirebirdClient.FbConnection($taskB.ConnectionString)
try {
 $taskC.Open();$taskT=$taskC.BeginTransaction();$taskQ=$taskC.CreateCommand();$taskQ.Transaction=$taskT
 foreach($taskSql in @('CREATE TABLE TIPO_INVENTARIO(CODIGO INTEGER PRIMARY KEY, DESCRIPCION VARCHAR(40))','CREATE TABLE INVENTARIO_PRODUCTO(CODIGO INTEGER PRIMARY KEY,CODIGO_TEXTO VARCHAR(40),CODIGO_BARRA VARCHAR(40),TIPO INTEGER,DESCRIPCION VARCHAR(100),CANTIDAD DOUBLE PRECISION,PRECIO DOUBLE PRECISION)','CREATE GENERATOR GEN_NUM_INV_PROD','SET GENERATOR GEN_NUM_INV_PROD TO 500')){$taskQ.CommandText=$taskSql;[void]$taskQ.ExecuteNonQuery()}
 $taskT.Commit();$taskT=$taskC.BeginTransaction();$taskQ.Transaction=$taskT
 foreach($taskSql in @("INSERT INTO TIPO_INVENTARIO VALUES(1,'Bienes')","INSERT INTO INVENTARIO_PRODUCTO(CODIGO,CODIGO_TEXTO,TIPO) VALUES(1,'P10001-9',1)","INSERT INTO INVENTARIO_PRODUCTO(CODIGO,CODIGO_TEXTO,TIPO) VALUES(2,'P10001-40',1)","INSERT INTO INVENTARIO_PRODUCTO(CODIGO,CODIGO_TEXTO,TIPO) VALUES(3,'P10061-3',1)")){$taskQ.CommandText=$taskSql;[void]$taskQ.ExecuteNonQuery()}
 $taskT.Commit();[IO.File]::WriteAllText((Join-Path $taskRoot 'Build\base.txt'),$taskB.Database)
 'BASE_QA_AISLADA=CREADA; COMERCIAL_SIN_CAMBIOS=1'
}finally{if($taskQ){$taskQ.Dispose()};$taskC.Dispose();$taskB.Password='';$taskDfm=$null}
