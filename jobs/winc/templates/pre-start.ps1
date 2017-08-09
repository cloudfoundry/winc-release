$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

Write-Host "Starting pre-start"

Get-ContainerNetwork | Remove-ContainerNetwork -Force

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

# Check firewall rules
function get-firewall {
	param([string] $profile)
	$firewall = (Get-NetFirewallProfile -Name $profile)
	$result = "{0},{1},{2}" -f $profile,$firewall.DefaultInboundAction,$firewall.DefaultOutboundAction
	return $result
}

function check-firewall {
	param([string] $profile)
	$firewall = (get-firewall $profile)
	Write-Host $firewall
	if ($firewall -ne "$profile,Block,Block") {
		Write-Host $firewall
		Write-Error "Unable to set $profile Profile"
	}
}

$anyFirewallsDisabled = !!(Get-NetFirewallProfile -All | Where-Object { $_.Enabled -eq "False" })
$adminRuleMissing = !(Get-NetFirewallRule -Name CFAllowAdmins -ErrorAction Ignore)
if ($anyFirewallsDisabled -or $adminRuleMissing) {
  $admins = New-Object System.Security.Principal.NTAccount("Administrators")
  $adminsSid = $admins.Translate([System.Security.Principal.SecurityIdentifier])

  $LocalUser = "D:(A;;CC;;;$adminsSid)"
  $otherAdmins = Get-WmiObject win32_groupuser |
  Where-Object { $_.GroupComponent -match 'administrators' } |
  ForEach-Object { [wmi]$_.PartComponent }

  foreach($admin in $otherAdmins)
  {
    $ntAccount = New-Object System.Security.Principal.NTAccount($admin.Name)
    $sid = $ntAccount.Translate([System.Security.Principal.SecurityIdentifier]).Value
    $LocalUser = $LocalUser + "(A;;CC;;;$sid)"
  }
  New-NetFirewallRule -Name CFAllowAdmins -DisplayName "Allow admins" `
    -Description "Allow admin users" -RemotePort Any `
    -LocalPort Any -LocalAddress Any -RemoteAddress Any `
    -Enabled True -Profile Any -Action Allow -Direction Outbound `
    -LocalUser $LocalUser

  Set-NetFirewallProfile -All -DefaultInboundAction Block -DefaultOutboundAction Block -Enabled True
  check-firewall "public"
  check-firewall "private"
  check-firewall "domain"
  $anyFirewallsDisabled = !!(Get-NetFirewallProfile -All | Where-Object { $_.Enabled -eq "False" })
  $adminRuleMissing = !(Get-NetFirewallRule -Name CFAllowAdmins -ErrorAction Ignore)
  if ($anyFirewallsDisabled -or $adminRuleMissing) {
    Write-Host "anyFirewallsDisabled: $anyFirewallsDisabled"
    Write-Host "adminRuleMissing: $adminRuleMissing"
    Write-Error "Failed to Set Firewall rule"
  }
}
Write-Host "Finished pre-start"
Exit 0
