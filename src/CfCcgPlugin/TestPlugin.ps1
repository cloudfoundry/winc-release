$ErrorActionPreference = "Stop";

function releaseCOMObject {
	Write-Output "Disposing of CfCcgCredProvider COM object"
	$plugin.Dispose()
}

trap {
	releaseCOMObject
	$host.SetShouldExit(1)
}

$domain=""
$username=""
$password=""

Write-Output "Instantiating CfCcgCredProvider"
$plugin = New-Object -ComObject CfCcgCredProvider
Write-Output "Success!"

$pluginInput = "contoso.com:bgates:linuxrules"
Write-Output "Invoking GetPasswordCredentials on CfCcgCredProvider with input '$pluginInput'"
$plugin.GetPasswordCredentials($pluginInput, [ref] $domain, [ref] $username, [ref] $password)
Write-Output "Success!"

Write-Output "Results - domain: $domain, username: $username, password: $password"

releaseCOMObject
Exit 0
