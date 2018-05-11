# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:latest)
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
                                         "C:\\ProgramData\\groot\\layers\\0219f956420a542bc3b08908de4c1822c0569f5266fc1502dcf7f834f14382a5",
                                         "C:\\ProgramData\\groot\\layers\\5e48a2de54d0467d9f03ba74ce7aafafd5547beae585f7f986dcc58af29cbf0b",
                                         "C:\\ProgramData\\groot\\layers\\82878998154ffc7ae24d4085f328adfe6bc447eb9cb565b26879b26f197b35be",
                                         "C:\\ProgramData\\groot\\layers\\f439f028b9da48287f7e5036adb4ff3b03f0801150ab8597d84da7ed467d31f8",
                                         "C:\\ProgramData\\groot\\layers\\906054cefe8a81223e94bfa22d76dfc4840e1f5e43436eb829284750b80e2fcc",
                                         "C:\\ProgramData\\groot\\layers\\3af237bd47aaa392fc65f24f97f088b87adf54e7c04b8914e32036e5f8605884",
                                         "C:\\ProgramData\\groot\\layers\\390fd7ec1223d01785e7b4f4592169eb9cf87f242ff35a8764ef5f8f40887f1e",
                                         "C:\\ProgramData\\groot\\layers\\2483714b5f7817acc9bbdbaa7d891a405fcd7e0a5eac47df49c62911dd1f2981",
                                         "C:\\ProgramData\\groot\\layers\\3649822a66ba11db86e82bced4a9da4fdee3410caa16ef37fa3edc2b3c6ba845",
                                         "C:\\ProgramData\\groot\\layers\\777ec552609b56bfaf7979c159072ba6badabddcd52ca51db378df22aec6693b",
                                         "C:\\ProgramData\\groot\\layers\\c20b1e8346cfb9e2a2c706f0cf5b1004fdf73ca528d4e1aebceb8568150b5ba0",
                                         "C:\\ProgramData\\groot\\layers\\14e74373d74303d7fb5f2471b4fad02f396bfbfaa76082dce6fd2c9c1b8c80aa",
                                         "C:\\ProgramData\\groot\\layers\\1b0e9ed736d1bc55927184ff85b353a56294cc1d4d72dd8c4a425196d8849c58",
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
 

