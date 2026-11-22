param(
 [string]$ProveedorFirebird='C:/Users/nosiv/Documents/ChatGPT/Facturacion Electronica RD/Portal-Administracion/paquete/api-runtime/FirebirdSql.Data.FirebirdClient.dll',
 [string]$ConexionDfm='C:/Proyectos/PointSaleSoftResp/PuntoVenta/Fuentes/UDatModConectar.dfm',
 [string]$BuildDir=(Join-Path (Split-Path $PSScriptRoot -Parent) 'Build')
)
$ErrorActionPreference='Stop'
Add-Type -Path $ProveedorFirebird
$taskDfm=Get-Content -LiteralPath $ConexionDfm -Raw
[void](New-Item -ItemType Directory -Path $BuildDir -Force)
$b=New-Object FirebirdSql.Data.FirebirdClient.FbConnectionStringBuilder
$b.DataSource='localhost';$b.Database=[string](Join-Path $BuildDir ('pedidos-qa-'+[guid]::NewGuid().ToString('N')+'.fdb'))
$b.UserID=[regex]::Match($taskDfm,"user_name=([^']*)'").Groups[1].Value;$b.Password=[regex]::Match($taskDfm,"password=([^']*)'").Groups[1].Value
$b.Dialect=1;$b.Pooling=$false
[FirebirdSql.Data.FirebirdClient.FbConnection]::CreateDatabase($b.ConnectionString)
$c=New-Object FirebirdSql.Data.FirebirdClient.FbConnection($b.ConnectionString)
try {
 $c.Open();$sql=Get-Content (Join-Path $PSScriptRoot 'fixture-schema.json') -Raw | ConvertFrom-Json
 foreach($s in $sql){$tx=$c.BeginTransaction();$q=$c.CreateCommand();$q.Transaction=$tx;$q.CommandText=$s
  try{[void]$q.ExecuteNonQuery();$tx.Commit()}catch{Write-Output ($s.Substring(0,[Math]::Min(140,$s.Length)));throw}finally{$q.Dispose();$tx.Dispose()}}
 [IO.File]::WriteAllText((Join-Path $BuildDir 'base.txt'),$b.Database)
 'BASE_QA_CREADA; ESCRITURAS_COMERCIALES=0'
}finally{$c.Dispose();$b.Password='';$taskDfm=$null}
