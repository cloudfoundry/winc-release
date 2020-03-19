# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:2019)
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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3b2dc0ac8b913b045b3b24e64e458ded463c55df9351c25a5078770a7640f0e5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\09f0790b42f1e30f7cab9f516d87b357cff3e708dcf50862991cd228e671f20c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5291977b9a0956300b6addcf09adc1b1bf2675aef8815f5f33d736d3133e1e1c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\95a919eaa9353d8aec22d35ee143baa1b82b76fbbb062616c3004bcb01302767",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9c3af3a931d52500cae78155dc6a3b0a2c36ab21a69bfb0be18a5ab8ca1501ef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\19ea46ce729457686dc1f5dd886a671f3ebe636b0302ec1d36d5fa727de3bafe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b1493934d0749995e8f0c1f23d51e6e8da15d9c5db5691bdd8581c0fdabb1333",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cfe3a6ecd3df7a4c3df4cc7e9d0e4b590b6c09d30cbd6906eb984566696d30f4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2aa31863d44438930b18c365d2e8d925d2d0b888fd31587e34b78a403b67b30d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b046983efca0fac5f635d47bb5b492cc856333c05ee99887a8dd798b141b449a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\673e81350cbba31deb772555e426e126993b1adb45fa4a12df79f440a0a0289f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ebb4c287a0208a3b3ee1766bc9c24fd757274a327632aaffea324b93ffd7f3c9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4859b2de5994c5859513e4e407acd1aabd95a06bfe1a59dfd5bb08a8e1b455cd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2adbf36896acf5867c65b5d9bbac9fd0bdde3093b56c21a570ba09ce6150e728",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d12d7e994fa45bb47e3d9897704358ac608dff9f21af7275885c384d1cf149bb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b400854bf2e874244ff0cc291774ad14a146cf91a3f33f45d165a710226fef36",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b16aca8017edf5521a526f69f51769821a9daa624d8ffa8402477de82b1353e2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a9d7e91232c841422dc2b25fece8e89b99ec25973e7a7bd6cd28c75499c6c58d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e0d10df1674fad91c153bfd5d5b59cc0d0d39740baafea30f44cff730fe98d83",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4b8000216cbcc3eae7e684bcfd879c50918771349a3e169bab4d10d560ae7f3c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\178ea31461864a8bd1d40b50a56e10319f7a8f03330f77d3a2a4a92e235bd3eb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f19b4d1638c6cc651777c9c574ba0d67655566529953837e9010e4bdf604667e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3ff926518ddb6b0452610731eb199196e042b518aefdb2703f3f275c4977c8f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5b36331a77c169d1df134afffd4e3a5381c1ee96fc7b58fca0b6f295f9d686de",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dd4abbd8ef1c43f81d3e4da481a17d5c4605ee40cabd15938920acc628c15918",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0c888d0d5bc08e79e89002f60f16ada9b85e65d0ac22ecc33374971a0404136a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c4d02418787d264406bed4956f2faccd58932e4466bbd693c1795e3a64d60e90"
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
 

