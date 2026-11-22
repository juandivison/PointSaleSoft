$ErrorActionPreference='Stop'
$repo=Split-Path (Split-Path $PSScriptRoot)
if(-not(Test-Path (Join-Path $repo 'PuntoVenta/Fuentes'))){$repo='C:\Proyectos\PointSaleSoftResp'}
if(-not $env:PSS_FIREBIRD_PROVIDER){$env:PSS_FIREBIRD_PROVIDER=Join-Path $repo 'PointSaleSoft.Sync/src/bin/Release/net10.0/FirebirdSql.Data.FirebirdClient.dll'}
Add-Type -Path $env:PSS_FIREBIRD_PROVIDER
$dfm=Get-Content (Join-Path $repo 'PuntoVenta/Fuentes/UDatModConectar.dfm') -Raw
$b=New-Object FirebirdSql.Data.FirebirdClient.FbConnectionStringBuilder
$b.DataSource='localhost';$b.Database=[string](Join-Path $PSScriptRoot ('Build/ui-'+[guid]::NewGuid().ToString('N')+'.fdb'))
$b.Dialect=1;$b.Pooling=$false;$b.UserID=[regex]::Match($dfm,"user_name=([^']*)'").Groups[1].Value;$b.Password=[regex]::Match($dfm,"password=([^']*)'").Groups[1].Value
[FirebirdSql.Data.FirebirdClient.FbConnection]::CreateDatabase($b.ConnectionString)
$c=New-Object FirebirdSql.Data.FirebirdClient.FbConnection($b.ConnectionString);$c.Open()
function Sql([string[]]$statements){$t=$c.BeginTransaction();try{foreach($s in $statements){$q=$c.CreateCommand();$q.Transaction=$t;$q.CommandText=$s;try{[void]$q.ExecuteNonQuery()}finally{$q.Dispose()}};$t.Commit()}finally{$t.Dispose()}}
try{
 [IO.File]::WriteAllText((Join-Path $PSScriptRoot 'Build/base.txt'),$b.Database)
 'BASE_QA_VACIA=CREADA; BASE_COMERCIAL=0'
}finally{$c.Dispose();$dfm=$null;$b.Password=''}