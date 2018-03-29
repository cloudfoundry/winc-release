$ErrorActionPreference = 'Stop'
trap { $host.SetShouldExit(1) }

go version

Write-Host "Build winc"

go build -o "$env:GOBIN\winc.exe" code.cloudfoundry.org/winc/cmd/winc
if (!(Get-Command "winc.exe" -ErrorAction SilentlyContinue)) {
   Write-Host "Unable to build winc.exe"
   Exit 1
}

Write-Host "Build groot"

go build -o "$env:GOBIN\groot.exe" code.cloudfoundry.org/groot-windows
if (!(Get-Command "groot.exe" -ErrorAction SilentlyContinue)) {
   Write-Host "Unable to build groot.exe"
   Exit 1
}

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

Write-Host "Build winc-network"

go build -o "$env:GOBIN\winc-network.exe" code.cloudfoundry.org/winc/cmd/winc-network
if (!(Get-Command "winc-network.exe" -ErrorAction SilentlyContinue)) {
   Write-Host "Unable to build winc-network.exe"
   Exit 1
}

Write-Host "Build firewall.dll"

$wincNetworkParent = Split-Path (Get-Command winc-network.exe).Path
$firewallDllPath = Join-Path "$wincNetworkParent" "firewall.dll"
if (!(Get-Command "gcc.exe" -ErrorAction SilentlyContinue)) {
   Write-Host "Unable to find gcc.exe"
   Exit 1
}
gcc.exe -c "$PSScriptRoot\code.cloudfoundry.org\winc\network\firewall\dll\firewall.c" -o firewall.o
if ($LastExitCode -ne 0) {
      exit $LastExitCode
}
gcc.exe -shared -o "$firewallDllPath" firewall.o -lole32 -loleaut32
if ($LastExitCode -ne 0) {
      exit $LastExitCode
}
if (!(Test-Path $firewallDllPath)) {
   Write-Host "Unable to find firewall.dll in the same directory as winc-network.exe"
   Exit 1
}

Write-Host "Build nstar"

go build -o "$env:GOBIN\nstar.exe" nstar
if (!(Get-Command "nstar.exe" -ErrorAction SilentlyContinue)) {
   Write-Host "Unable to build nstar.exe"
   Exit 1
}
