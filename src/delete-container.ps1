$ErrorActionPreference = 'Stop'
trap { $host.SetShouldExit(1) }

$containerId = $args[0]

Write-Host "winc delete"
winc.exe delete $containerId
if ($LASTEXITCODE -ne 0) {
  Write-Error "winc create failed"
}

Write-Host "groot delete"
groot.exe --driver-store $env:GROOT_IMAGE_STORE delete $containerId
if ($LASTEXITCODE -ne 0) {
  Write-Error "groot delete failed"


Write-Host "Deleted container $containerId"
