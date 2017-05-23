$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

C:\var\vcap\packages\winc\winc.exe help
exit $LASTEXITCODE
