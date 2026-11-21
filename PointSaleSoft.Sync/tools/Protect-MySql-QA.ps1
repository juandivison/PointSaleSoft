param([string]$Usuario='CP4_API_QA')
$ErrorActionPreference='Stop'
$syncRoot=Split-Path $PSScriptRoot
$syncPassword=Read-Host ('Contrasena MySQL local de '+$Usuario+' (no se muestra)') -AsSecureString
$syncCredential=New-Object System.Management.Automation.PSCredential($Usuario,$syncPassword)
$syncCredential|Export-Clixml -LiteralPath (Join-Path $syncRoot 'artifacts\mysql-qa.credential.xml')
'CREDENCIAL_QA_CIFRADA=GUARDADA; SERVIDOR=127.0.0.1; NO_ENVIE_LA_CONTRASENA_POR_CHAT'
