param([Parameter(Mandatory=$true)][string]$Database,[string]$Output='')
$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
Add-Type -Path (Join-Path $syncRoot '..\Portal-Administracion\paquete\api-runtime\FirebirdSql.Data.FirebirdClient.dll')
$syncDfm=Get-Content 'C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm' -Raw
$syncB=New-Object FirebirdSql.Data.FirebirdClient.FbConnectionStringBuilder
$syncB.DataSource='localhost';$syncB.Database=$Database;$syncB.Dialect=1;$syncB.Charset='ISO8859_1';$syncB.Pooling=$false
$syncB.UserID=[regex]::Match($syncDfm,"user_name=([^']*)'").Groups[1].Value
$syncB.Password=[regex]::Match($syncDfm,"password=([^']*)'").Groups[1].Value
$syncC=New-Object FirebirdSql.Data.FirebirdClient.FbConnection($syncB.ConnectionString)
function ReadRows([string]$Sql){
 $syncQ.CommandText=$Sql;$syncR=$syncQ.ExecuteReader();$syncRows=@()
 try{while($syncR.Read()){$syncRow=[ordered]@{};for($i=0;$i -lt $syncR.FieldCount;$i++){$syncRow[$syncR.GetName($i)]=if($syncR.IsDBNull($i)){$null}else{$syncR.GetValue($i)}};$syncRows+=,[pscustomobject]$syncRow}}finally{$syncR.Close()}
 return $syncRows
}
try{
 $syncC.Open();$syncOptions=New-Object FirebirdSql.Data.FirebirdClient.FbTransactionOptions
 $syncOptions.TransactionBehavior=[FirebirdSql.Data.FirebirdClient.FbTransactionBehavior]::Read -bor [FirebirdSql.Data.FirebirdClient.FbTransactionBehavior]::Concurrency
 $syncT=$syncC.BeginTransaction($syncOptions);$syncQ=$syncC.CreateCommand();$syncQ.Transaction=$syncT
 $syncNames=@('TIPO_INVENTARIO','INVENTARIO_CATEGORIA','INVENTARIO_SUBCATEGORIA','UNIDADES','MONEDA','MONEDA_DET','TASA_ITBIS','TASA_ITBIS_LOOKUP','INVENTARIO_PRODUCTO','PRECIO_UNIDADSURTIDORA','PRECIO_INVENTARIO','CLASIF_PRECIO')
 $syncTables=@()
 foreach($syncName in $syncNames){
  $syncFields=@(ReadRows "SELECT TRIM(RF.RDB`$FIELD_NAME) AS NAME,F.RDB`$FIELD_TYPE AS FTYPE,F.RDB`$FIELD_SUB_TYPE AS SUBTYPE,F.RDB`$FIELD_SCALE AS SCALE,F.RDB`$FIELD_LENGTH AS BYTES,RF.RDB`$NULL_FLAG AS REQUIRED FROM RDB`$RELATION_FIELDS RF JOIN RDB`$FIELDS F ON F.RDB`$FIELD_NAME=RF.RDB`$FIELD_SOURCE WHERE RF.RDB`$RELATION_NAME='$syncName' AND F.RDB`$COMPUTED_BLR IS NULL ORDER BY RF.RDB`$FIELD_POSITION")
  if(-not $syncFields.Count){continue}
  $syncPk=@(ReadRows "SELECT TRIM(S.RDB`$FIELD_NAME) AS NAME FROM RDB`$RELATION_CONSTRAINTS C JOIN RDB`$INDEX_SEGMENTS S ON S.RDB`$INDEX_NAME=C.RDB`$INDEX_NAME WHERE C.RDB`$RELATION_NAME='$syncName' AND C.RDB`$CONSTRAINT_TYPE='PRIMARY KEY' ORDER BY S.RDB`$FIELD_POSITION")
  $syncCount=@(ReadRows "SELECT COUNT(*) AS N FROM $syncName")[0].N
  $syncTriggers=@(ReadRows "SELECT TRIM(RDB`$TRIGGER_NAME) AS NAME,RDB`$TRIGGER_TYPE AS TYPE,RDB`$TRIGGER_INACTIVE AS INACTIVE,RDB`$TRIGGER_SOURCE AS SOURCE FROM RDB`$TRIGGERS WHERE RDB`$RELATION_NAME='$syncName' AND COALESCE(RDB`$SYSTEM_FLAG,0)=0")
  $syncTables+=,[ordered]@{name=$syncName;rows=$syncCount;key=@($syncPk|ForEach-Object{$_.NAME});fields=$syncFields;triggers=$syncTriggers}
 }
 $syncProc=@(ReadRows "SELECT RDB`$PROCEDURE_SOURCE AS SOURCE FROM RDB`$PROCEDURES WHERE RDB`$PROCEDURE_NAME='PROC_GETUNIDADES'")
 $syncResult=[ordered]@{database=$Database;readOnly=$true;tables=$syncTables;unitProcedure=$syncProc}
 if($Output){$syncResult|ConvertTo-Json -Depth 12|Set-Content -LiteralPath $Output}
 $syncTables|ForEach-Object{[pscustomobject]@{table=$_.name;rows=$_.rows;key=($_.key -join ',');fields=$_.fields.Count}}|ConvertTo-Json -Compress
 $syncT.Rollback()
}finally{if($syncQ){$syncQ.Dispose()};$syncC.Dispose();$syncB.Password='';$syncDfm=$null}
