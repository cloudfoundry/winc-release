$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

mkdir -f "C:\var\vcap\store\winc"

$rootfsPath = (docker inspect microsoft/windowsservercore | ConvertFrom-Json).GraphDriver.Data.Dir

Set-Content "C:\var\vcap\store\winc\default_rootfs_path" $rootfsPath
