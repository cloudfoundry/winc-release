## Basic steps for plugin verification

Note - to verify the plugin you don't need to set up any Active Directory stuff - it simply takes an input of the format `domain:username:password` and returns the domain, username, and password in separate variables.

### Copy to c:\ on the windows_diego_cell:
- CfCcgPlugin.dll (build this on a windows machine, should be in `.\bin\Release\CfCcgPlugin.dll`)
- RegisterPluginWithCCG.ps1
- ChangePluginIdentity.ps1
- EventLog.reg
- TestPlugin.ps1

### On the windows diego cell:
- Add event source and log to registry so plugin can use it:
    ```powershell
    reg.exe import .\EventLog.reg
    ```
- Add the GUID of the plugin to the `HKLM:\SYSTEM\CurrentControlSet\Control\CCG\COMClasses\`:
    ```powershell
    .\RegisterPluginWithCCG.ps1
    ```
- Set broad permissions on the plugin dll
    ```powershell
    cmd.exe /C "icacls c:\\CfCcgPlugin.dll /grant Everyone:(F)
    ```
- Register the plugin as a com object with the .net framework

    ```powershell
    C:\Windows\Microsoft.NET\Framework64\v4.0.30319\RegAsm.exe /codebase /tlb c:\CfCcgPlugin.dll
    C:\Windows\Microsoft.NET\Framework64\v4.0.30319\regsvcs.exe /fc c:\CfCcgPlugin.dll
    ```
- Change the identity the plugin runs as to the local service account
    ```powershell
    .\ChangePluginIdentity.ps1
    ```
- Try to instantiate the plugin and invoke its method via powershell
    ```powershell
    .\TestPlugin.ps1
    ```
- Verify the logs work
    ```powershell
    Get-WinEvent -LogName Cloudfoundry-CCG-Plugin | format-list
    ```