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
                                         "C:\\ProgramData\\groot\\layers\\71f3751c44b22567591fb2dcc1d73ad751630735b38c4c37d4aa86e39340b262",
                                         "C:\\ProgramData\\groot\\layers\\6bab95cc789255de61f10c736de6c169d349dd344de5d6b8f39744a1c0406247",
                                         "C:\\ProgramData\\groot\\layers\\2b2d66740f6a5fcce0ca03781c2080076b98d2d30c3f7cddefddfa9a710d4dfd",
                                         "C:\\ProgramData\\groot\\layers\\7e9113685e79c6a3289fe3e8a1c2dec60acd6b6c3dabdb4e22a4546647efda70",
                                         "C:\\ProgramData\\groot\\layers\\09a35e654f7f495838a299128448bb0a70e2671c015e7c200b95a435b01ab5b5",
                                         "C:\\ProgramData\\groot\\layers\\ce2f284ba27e5abaaa2402fa387426d67d8e475da8c843eeff3297f8c7094251",
                                         "C:\\ProgramData\\groot\\layers\\c4e77ef725c6c9bfec768a97ac4a5bedd1e81828c1c54a868c5317e3f3213401",
                                         "C:\\ProgramData\\groot\\layers\\4d3b25afc60b55510ef630f9ea8396801f3d4eb903f4b2b95cbb81691859ecc6",
                                         "C:\\ProgramData\\groot\\layers\\67b1fc7eb8e3cf8b3c42092728368d987a4e428f68628ec8c6a79cc3c073a4e0",
                                         "C:\\ProgramData\\groot\\layers\\08e24054d073e7ef9fcae89063209ad4a002d36664d48187f4a0b4e5310660a9",
                                         "C:\\ProgramData\\groot\\layers\\bfe79691b4af353b9348f617e6b9d5dc1eb4c84bbce464d1af16ba8760212f68",
                                         "C:\\ProgramData\\groot\\layers\\32aefba07a2dec7c54f3769d2af6d874663a50b8664c22ed55f38f74f0f0f32f",
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
 

