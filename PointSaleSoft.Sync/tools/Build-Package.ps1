$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncPackage=Join-Path $syncRoot ('artifacts/package-'+(Get-Date -Format 'yyyyMMdd-HHmmssfff'))
[void][IO.Directory]::CreateDirectory($syncPackage)
Push-Location $syncRoot
try{
 $syncMysql=Get-Content artifacts/mysql-qa-result.json -Raw|ConvertFrom-Json
 $syncClean=Get-Content artifacts/clean-pilot.json -Raw|ConvertFrom-Json
 if(-not $syncMysql.storePass -or -not $syncMysql.httpPass -or -not $syncClean.clean){throw 'Falta validacion MySQL/par limpio.'}
 dotnet publish src/PointSaleSoft.Sync.csproj -c Release --no-restore --self-contained false -o (Join-Path $syncPackage 'app') --verbosity quiet
 if($LASTEXITCODE){throw 'Fallo publicacion paquete.'}
 foreach($d in @('tools','delphi','evidence')){[void][IO.Directory]::CreateDirectory((Join-Path $syncPackage $d))}
 foreach($f in @('Start-Sync.ps1','Protect-SyncSecrets.ps1','Register-SyncTask.ps1','Install-DelphiBridge.ps1','New-LocalPilotConfiguration.ps1')){
  Copy-Item -LiteralPath (Join-Path $PSScriptRoot $f) -Destination (Join-Path $syncPackage 'tools')
 }
 foreach($f in @('UInventarioProd.pas','UPuenteCatalogoConfig.pas','manifest.json')){Copy-Item -LiteralPath (Join-Path $syncRoot ('delphi/'+$f)) -Destination (Join-Path $syncPackage 'delphi')}
 Copy-Item -LiteralPath (Join-Path $syncRoot 'OPERACION-PILOTO.md') -Destination $syncPackage
 foreach($f in @('mysql-qa-result.json','mysql-integration.log','mysql-ephemeral-cleanup.json','package-smoke-result.json','bundle.log','transport-bundle.log','installation.log','delphi-check/test.log')){
  Copy-Item -LiteralPath (Join-Path $syncRoot ('artifacts/'+$f)) -Destination (Join-Path $syncPackage ('evidence/'+(Split-Path $f -Leaf)))
 }
 foreach($f in @('clean-verification.json','source-status.json','branch-status.json')){Copy-Item -LiteralPath (Join-Path $syncClean.directory $f) -Destination (Join-Path $syncPackage 'evidence')}
 $syncHashes=@(Get-ChildItem -LiteralPath $syncPackage -File -Recurse|ForEach-Object {
  @{path=$_.FullName.Substring($syncPackage.Length+1).Replace('\','/');sha256=(Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToLowerInvariant()}
 })
 ConvertTo-Json -InputObject $syncHashes -Depth 4|Set-Content (Join-Path $syncPackage 'SHA256.json')
 $syncZip=$syncPackage+'.zip'
 Add-Type -AssemblyName System.IO.Compression.FileSystem
 [IO.Compression.ZipFile]::CreateFromDirectory($syncPackage,$syncZip)
 $syncArchive=[IO.Compression.ZipFile]::OpenRead($syncZip)
 try{
  foreach($e in $syncArchive.Entries){
   if($e.FullName -match '(?i)(private|\.fdb$|\.fbk$|\.xml$|credential|init-private|secret.*\.json$)'){throw 'Contenido privado no permitido en paquete.'}
  }
  foreach($h in $syncHashes){
   $e=$syncArchive.GetEntry($h.path)
   if(-not $e){throw 'Archivo ausente del ZIP.'}
   $s=$e.Open();$sha=[Security.Cryptography.SHA256]::Create()
   try{$hash=([BitConverter]::ToString($sha.ComputeHash($s))).Replace('-','').ToLowerInvariant()}finally{$s.Dispose();$sha.Dispose()}
   if($hash -ne $h.sha256){throw 'Hash de ZIP no coincide.'}
  }
 }finally{$syncArchive.Dispose()}
 @{zip=$syncZip;sha256=(Get-FileHash -LiteralPath $syncZip).Hash.ToLowerInvariant();files=$syncHashes.Count;hashesVerified=$true;includesDatabases=$false;includesSecrets=$false}|ConvertTo-Json|Set-Content (Join-Path $syncRoot 'artifacts/package-result.json')
 'SYNC_PACKAGE=VERIFIED; FILES='+$syncHashes.Count
}finally{Pop-Location}
