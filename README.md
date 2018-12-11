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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b2da6658066b75262a9f53628cd866569795aaa2337d4f160c5cd3d0f15cf136",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c055c02b9838507d3522702b5c0381b7f1353aee82c8b26a94ebfaf163af009f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4548a025e14df9ca8e730c867c361aa68af23b201aa9325c6166ab47bc836cdd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7f832c0aa755551a8f09b953988e5f47fb07da4cf0695c015a934a7deb8d4519",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5a2b80c9ed2bbb331f83b586655187b5c6d4b0bd27da3911bbd93581626f2ced",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a27239e17430246e2a1f86682b40783d60322e1036c223f153642e26b2c34890",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e8c09356bdce5b1bf95ea0f961d844887beeebc73b043367728355d12079ef72",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\863d9d060e68f9b1437770934c60f414c628f250d08884f30818866d4ca30243",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\04431b3261e60c5ad413e364e37b9f26fbdc604b771344506a82e4176230cd0e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f46b0c46f4857a916ce944c9c870d9043f267ec78e79f04e44fd99acecc43a1e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ddda0cc30428f46621a1eed0041b43389e424ce8a686c12a77123f80cb378012",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7f38c3ca7d3d021e22af1b63e9c95b8ea1db61fe114ff52bed3accb133eccff0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fc1aa5d0d387198ad885129ba95d43cc87fbbbfd4972d957fdd0a514351a3041",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fcd6d0905ffe9c7d74aea89ef7482e7efcb2b179d3bbea8dc3b17cce644f68e3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\66cafc86555bec439a7d3d11e5edb27cca28f8a2debfb31f3223fc401cf45136",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\85a4a5ddb1b2b83d0c3bb19a8868d0f48d1d989cc53e072173aae1ec54202dfb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0feb5918e8bd7ac607d8b5178fc088907a52bdcc71ef3541d5d3c63838dbf1ef",
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
 

