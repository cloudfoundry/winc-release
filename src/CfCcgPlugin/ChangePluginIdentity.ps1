$newComPackageName = "CfCcgPlugin"

$comAdmin = New-Object -comobject COMAdmin.COMAdminCatalog
$apps = $comAdmin.GetCollection("Applications")
$apps.Populate()

$appExistCheckApp = $apps | Where-Object {$_.Name -eq $newComPackageName}
$appExistCheckApp.Value("Identity") = "NT AUTHORITY\LocalService"
$appExistCheckApp.Value("ApplicationAccessChecksEnabled") = $true
$apps.SaveChanges()

$roles = $apps.GetCollection("Roles", $appExistCheckApp.Key)
$roles.Populate()

$systemRole = $roles | Where-Object {$_.Name -eq "SYSTEM"}
if ($systemRole) {
    $users = $roles.GetCollection("UsersInRole", $systemRole.Key)
    $users.Populate()
    
    $newUser = $users.Add()
    $newUser.Value("User") = "NT AUTHORITY\SYSTEM"
    $users.SaveChanges()

    $serviceUser = $users.Add()
    $serviceUser.Value("User") = "NT AUTHORITY\SERVICE"
    $users.SaveChanges()
}
