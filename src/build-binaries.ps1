$ErrorActionPreference = 'Stop'
trap { $host.SetShouldExit(1) }

go version

Write-Host "Build winc"

Push-Location src/code.cloudfoundry.org/winc
   go build -o "$env:GOBIN\winc.exe" ./cmd/winc
   if (!(Get-Command "winc.exe" -ErrorAction SilentlyContinue)) {
      Write-Host "Unable to build winc.exe"
      Exit 1
   }
Pop-Location

Write-Host "Build groot"

Push-Location src/code.cloudfoundry.org/groot-windows
   go build -o "$env:GOBIN\groot.exe" .
   if (!(Get-Command "groot.exe" -ErrorAction SilentlyContinue)) {
      Write-Host "Unable to build groot.exe"
      Exit 1
   }
Pop-Location

Write-Host "Build quota.dll"

$grootParent = Split-Path (Get-Command groot.exe).Path
$quotaDllPath = Join-Path "$grootParent" "quota.dll"
if (!(Get-Command "gcc.exe" -ErrorAction SilentlyContinue)) {
   Write-Host "Unable to find gcc.exe"
   Exit 1
}
gcc.exe -c "$PSScriptRoot\code.cloudfoundry.org\groot-windows\volume\quota\quota.c" -o quota.o
if ($LastExitCode -ne 0) {
      exit $LastExitCode
}
gcc.exe -shared -o "$quotaDllPath" quota.o -lole32 -loleaut32
if ($LastExitCode -ne 0) {
      exit $LastExitCode
}
if (!(Test-Path $quotaDllPath)) {
   Write-Host "Unable to find quota.dll in the same directory as groot.exe"
   Exit 1
}

# TODO: renable building winc-network
# Write-Host "Build winc-network"

# Push-Location src/code.cloudfoundry.org/winc
#   go build -o "$env:GOBIN\winc-network.exe" ./cmd/winc-network
#   if (!(Get-Command "winc-network.exe" -ErrorAction SilentlyContinue)) {
#      Write-Host "Unable to build winc-network.exe"
#      Exit 1
#   }
# Pop-Location

Write-Host "Build nstar"

Push-Location src/nstar
  go build -o "$env:GOBIN\nstar.exe" .
  if (!(Get-Command "nstar.exe" -ErrorAction SilentlyContinue)) {
     Write-Host "Unable to build nstar.exe"
     Exit 1
  }
Pop-Location
