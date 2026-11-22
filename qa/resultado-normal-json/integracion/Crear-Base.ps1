$ErrorActionPreference='Stop'
Add-Type -Path 'C:/Users/nosiv/Documents/ChatGPT/Facturacion Electronica RD/Portal-Administracion/paquete/api-runtime/FirebirdSql.Data.FirebirdClient.dll'
$taskDfm=Get-Content 'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm' -Raw
$b=New-Object FirebirdSql.Data.FirebirdClient.FbConnectionStringBuilder
$b.DataSource='localhost';$b.Database=[string](Join-Path $PSScriptRoot ('Build/ventas-'+[guid]::NewGuid().ToString('N')+'.fdb'))
$b.UserID=[regex]::Match($taskDfm,"user_name=([^']*)'").Groups[1].Value;$b.Password=[regex]::Match($taskDfm,"password=([^']*)'").Groups[1].Value
$b.Dialect=1;$b.Pooling=$false
[FirebirdSql.Data.FirebirdClient.FbConnection]::CreateDatabase($b.ConnectionString)
$c=New-Object FirebirdSql.Data.FirebirdClient.FbConnection($b.ConnectionString);$c.Open()
function Run-Sql([string[]]$sql){$tx=$c.BeginTransaction();try{foreach($s in $sql){$q=$c.CreateCommand();$q.Transaction=$tx;$q.CommandText=$s;try{[void]$q.ExecuteNonQuery()}finally{$q.Dispose()}};$tx.Commit()}finally{$tx.Dispose()}}
try{
 Run-Sql @('CREATE TABLE COMPANIA(CODIGO INTEGER PRIMARY KEY,RNC_NUMERO VARCHAR(11))','CREATE TABLE NCF_ASIGNADOS(SERIE INTEGER PRIMARY KEY,NUMERO_NCF VARCHAR(13),FECHA TIMESTAMP,DGII_STATUS VARCHAR(20),TRACK_ID VARCHAR(80),DGII_MENSAJE VARCHAR(1024),ULTIMO_INTENTO TIMESTAMP)','CREATE TABLE VENTAS_MAST(NUMERO INTEGER PRIMARY KEY,CIA_KEY INTEGER,SERIE_NCF_ASIGNADO INTEGER)','CREATE GENERATOR GEN_ECF_TIMBRE_LOG','CREATE TABLE ECF_TIMBRE_LOG(ID INTEGER PRIMARY KEY,TRN INTEGER,ENCF VARCHAR(13),CODIGO_SEGURIDAD VARCHAR(6),FECHA_EMISION TIMESTAMP,MONTO_TOTAL NUMERIC(18,2),URL_IMAGE VARCHAR(2048),RAW_RETURN BLOB SUB_TYPE TEXT,FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP)')
 Run-Sql @('CREATE TRIGGER BI_TIMBRE FOR ECF_TIMBRE_LOG ACTIVE BEFORE INSERT POSITION 0 AS BEGIN IF(NEW.ID IS NULL) THEN NEW.ID=GEN_ID(GEN_ECF_TIMBRE_LOG,1); END')
 Run-Sql @('CREATE PROCEDURE SP_ECF_UPDATE_ESTADO(P_SERIE INTEGER,P_ESTADO VARCHAR(20),P_TRACK VARCHAR(80),P_MSG VARCHAR(1024)) AS BEGIN IF(P_MSG=''QA_FAIL'') THEN EXIT; UPDATE NCF_ASIGNADOS SET DGII_STATUS=:P_ESTADO,TRACK_ID=:P_TRACK,DGII_MENSAJE=:P_MSG,ULTIMO_INTENTO=CURRENT_TIMESTAMP WHERE SERIE=:P_SERIE; END')
 Run-Sql @("INSERT INTO COMPANIA VALUES(1,'999999999')","INSERT INTO NCF_ASIGNADOS(SERIE,NUMERO_NCF,FECHA,DGII_STATUS) VALUES(1,'E310000000803','2026-11-21','ACEPTADO')","INSERT INTO NCF_ASIGNADOS(SERIE,NUMERO_NCF,FECHA,DGII_STATUS) VALUES(2,'E320000000001','2026-11-21','ACEPTADO')",'INSERT INTO VENTAS_MAST VALUES(2,1,1)','INSERT INTO VENTAS_MAST VALUES(3,1,2)',"INSERT INTO ECF_TIMBRE_LOG(TRN,ENCF) VALUES(2,'E310000000803')")
 [IO.File]::WriteAllText((Join-Path $PSScriptRoot 'Build/base.txt'),$b.Database)
 'BASE_SINTETICA=CREADA; BASE_COMERCIAL=0'
}finally{$c.Dispose();$b.Password='';$taskDfm=$null}
