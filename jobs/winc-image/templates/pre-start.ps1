$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

Write-Host "Begin winc-image pre-start"

$rootfs = (docker inspect cloudfoundry/windows2016fs | ConvertFrom-Json).GraphDriver.Data.Dir
$rootfsPackage="C:\var\vcap\packages\windows2016fs"
$rootfsSymlink="$rootfsPackage\rootfs"

New-Item -Type Directory -Force "$rootfsPackage"
if ((Test-Path $rootfsSymlink) -eq $true) {
  cmd.exe /c "rmdir $rootfsSymlink"
  if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to remove old symlink"
  }
}

cmd.exe /c "mklink /D $rootfsSymlink $rootfs"
if ($LASTEXITCODE -ne 0) {
  Write-Error "Failed to create mklink"
}

Write-Host "Finished winc-image pre-start"
Exit 0
