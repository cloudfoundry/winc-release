# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1709)
  and `GROOT_IMAGE_STORE` (e.g  C:\var\vcap\data\tmp\groot)

```
Start-Process -FilePath "powershell.exe" 
    -ArgumentList "-ExecutionPolicy ByPass -File .\src\create-container.ps1 <CONTAINER_ID>" 
    -Wait -PassThru -NoNewWindow
```
 
  

- Get Container state

```
winc state <CONTAINER_ID>
```
 
  

- Delete Container

```
Start-Process -FilePath "powershell.exe" 
    -ArgumentList "-ExecutionPolicy ByPass -File .\src\delete-container.ps1 <CONTAINER_ID>" 
    -Wait -PassThru -NoNewWindow
```
 
  

### Example of a valid bundle config.json

```json
{
    "ociVersion":  "1.0.1",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0e2999d3ece744b5e224bcb6f232c4108972527614da64921f27b00752a9e71b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4dedd10702cde318c09399085dd6b51d08415f27933754cd77b6a398679b0333",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6f164eb442c328e6d27ae3549a1c9fa7bee847f035fe686a2db8eddd862a0baa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9f200577c39c91baece243dd8a910f13e24212985e5a0261a8ebe44bf6da1b5f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1b722ce92cbc52f96c7c517688c44ab4a5fee7d6b05efc8d2cd61787ed0f73c2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a253feb98ca57275fac7659ba8f542373c085fecadae80dc6b09bfdaa5429838",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ac5fe044c080730fc642c02a9b3b9683372cf36aa515a738854ab191eca7f14",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fec2f7ea42feb74651d610a0567ebb076370f344f70d6ffec3a4e193b429b856",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f90e37515037ce26cbf963272035440a863befc33ea136f82b559a4acd92c4d9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\75d0636261963a492279ae76b6394e2312acefabeb6e26235c38c466f440f720",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f1a1835856e96f42025892932d7850be443ef8385ffb2ce07baaf184bfa70949",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4f9bd84516292624a125086a1f619e928f9c8607abe1996c851b890129eab45f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\116232251d696df7eb215de16cfb7d4fb25cf22e3f6a5191b0b62f6f428da8e5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dbfe85afc8920bd89c41b2fdc74d17e45438ab0f3138dd76e5e98db22694fd38",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\472f602a7595b1fe9e50959bf402bd4837c161f99e6077c9c588f7f8f95dcba0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d055585748cd6dad7bec3250f865f49cd7db185e880aa85cb14f077ace38f09c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f9cf9c9bf1ff15af8811bac132f7b562088f12aba0969146fcf2758af9e8260f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4bfe49d7bc33014df317149be23a71dfe176f2ddd6a78977068a37973dde89d8"
                                     ]
                },
    "process":  {
                    "args":  [
                                 "cmd.exe"
                             ],
                    "cwd":  "C:\\"
                }
}
```
 

