$ErrorActionPreference = 'Stop'
trap { $host.SetShouldExit(1) }

$containerId = $args[0]
if (!$containerId) {
  $containerId = [guid]::NewGuid()
}

if ((Test-Path env:WINC_TEST_ROOTFS) -ne $true) {
  Write-Error "Please set WINC_TEST_ROOTFS environment variable"
}

if ((Test-Path env:GROOT_IMAGE_STORE) -ne $true) {
  Write-Error "Please set GROOT_IMAGE_STORE environment variable"
}

where.exe /Q winc
if ($LASTEXITCODE -ne 0) {
  Write-Error "winc.exe must be on the PATH"
}
where.exe /Q groot
if ($LASTEXITCODE -ne 0) {
  Write-Error "groot.exe must be on the PATH"
}

$rootfs = $env:WINC_TEST_ROOTFS

Write-Host "groot delete"
groot.exe --driver-store $env:GROOT_IMAGE_STORE delete $containerId
if ($LASTEXITCODE -ne 0) {
  Write-Error "groot delete failed"
}
Write-Host "groot create"
$stdOut = (groot.exe --driver-store $env:GROOT_IMAGE_STORE create $rootfs $containerId)
$config = $stdOut | ConvertFrom-Json

$processSpec=@"
{"args": ["cmd.exe"], "cwd": "C:\\" }
"@

$pObj = $processSpec | convertfrom-json
$config | Add-Member -Force -Name "process" -Value $pObj -MemberType NoteProperty

$sidecarId = $args[1]
if ($sidecarId) {
  $sidecar = @"
  {"networkSharedContainerName": "$sidecarId"}
"@

  $config.Windows | Add-Member -Name "network" -Value ($sidecar | ConvertFrom-Json) -MemberType NoteProperty
}

$bundleDir = Join-Path $env:TEMP $containerId
$configPath = Join-Path $bundleDir "config.json"
rm -Recurse -Force -ErrorAction SilentlyContinue $bundleDir
mkdir $bundleDir | Out-Null
$configJson = ($config | ConvertTo-Json)
Set-Content -Path $configPath -Value $configJson

Write-Host "winc config.json $configJson"

Write-Host "winc create"
winc.exe create -b $bundleDir $containerId
if ($LASTEXITCODE -ne 0) {
  Write-Error "winc create failed"
}


Write-Host "Created container $containerId"
