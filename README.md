# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1709)
  and `GROOT_IMAGE_STORE` (e.g  C:\ProgramData\groot)

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
                                         "C:\\ProgramData\\groot\\layers\\97216d1485ff5ff22223d192e109f27f6a572ed402c0101ac3dcda1c34005fbc",
                                         "C:\\ProgramData\\groot\\layers\\3f8d9bd20a719788f2a3ee007c163883dd9c28969a37157e6da176b91b7da9d0",
                                         "C:\\ProgramData\\groot\\layers\\82980a11ad9c46a7aea94b908596426f9f3a3fb56f6465f896611cc935ce3a4e",
                                         "C:\\ProgramData\\groot\\layers\\dbf3857e2afcbed7ac564190315f4788c0022268eabe43b5fe26a40b4e68cbd1",
                                         "C:\\ProgramData\\groot\\layers\\dfea4115e86fcd6074e9d385e9a87ad293fa5dec8be71869078fdd472999b611",
                                         "C:\\ProgramData\\groot\\layers\\c669ae1d992216a504303b3b7f369f95fa9f4f5603e43eefa63f6a831a095514",
                                         "C:\\ProgramData\\groot\\layers\\657b76954077f3af55ef57f21b25129f173e1e2d884906ff37556349e16b8fd7",
                                         "C:\\ProgramData\\groot\\layers\\5e5703d59b639088a93e4b7eb54b67e613d588bc7d4e3a6078e697f90959eea8",
                                         "C:\\ProgramData\\groot\\layers\\8a28725eefa3e0cca2505d516cf762ea2496452c12033503c42eb2743c79c44d",
                                         "C:\\ProgramData\\groot\\layers\\3dea474a8f409c4b335cd8b25296c72a3b158a1d70499b70fb57db67c39461c2",
                                         "C:\\ProgramData\\groot\\layers\\9c14dee2e911ade8094502386c9d5dfbdfa5eab18b99fcf0a59d0defe14bfa42",
                                         "C:\\ProgramData\\groot\\layers\\8fb5d1a9f91f06faae3766dcac10e820d6fcf3f8b5793efb5f5636219c543bc4",
                                         "C:\\ProgramData\\groot\\layers\\e298e2cdd214afbec639d00fd9929797b4aab0a02cf1b5be27442d8fa70b56d7",
                                         "C:\\ProgramData\\groot\\layers\\4bfe49d7bc33014df317149be23a71dfe176f2ddd6a78977068a37973dde89d8"
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
 

