$newComPackageName = "CfCcgPlugin"

$comAdmin = New-Object -comobject COMAdmin.COMAdminCatalog
$apps = $comAdmin.GetCollection("Applications")
$apps.Populate()

$appExistCheckApp = $apps | Where-Object {$_.Name -eq $newComPackageName}
$appExistCheckApp.Value("Identity") = "NT AUTHORITY\LocalService"
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
}

$ccgRole = $roles | Where-Object {$_.Name -eq "CCG"}
if ($ccgRole) {
    $users = $roles.GetCollection("UsersInRole", $ccgRole.Key)
    $users.Populate()
    try {
        $newUser = $users.Add()
        $newUser.Value("User") = "NT SERVICE\ccg"
        $users.SaveChanges()
    } catch {
        Write-Warning "Failed to add NT SERVICE\ccg to CCG role: $_"
    }
}
