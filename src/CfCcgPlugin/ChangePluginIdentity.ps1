$newComPackageName = "CfCcgPlugin"

$comAdmin = New-Object -comobject COMAdmin.COMAdminCatalog
$apps = $comAdmin.GetCollection("Applications")
$apps.Populate();

$appExistCheckApp = $apps | Where-Object {$_.Name -eq $newComPackageName}
$appExistCheckApp.Value("Identity") = "NT AUTHORITY\LocalService"  # NT AUTHORITY\NetworkService
$apps.SaveChanges()