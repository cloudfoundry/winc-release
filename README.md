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
    "ociVersion":  "1.0.2-dev",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1b3ca81d32a4f1f7682ee30e72cc104265de13f7a09fcda1cb3d23f56ab8ecb0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b0ee3b77f950c62e114600355a7bb27580e0b947a07049cee0d021f9fd7df97",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9bcf8651710734e6db584420f52e90394f5e1ac37c636d2242a3eea4367fe5ca",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7448fabba5d9d1aeffcc7683ef4218add80020b609a6ba2b479298bd28f8466b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f8df20ac6aafac25538671931ccc05a84542f5317fe6c285c716f7bd8a92fa5c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dc27cde9f18e7350d3913c167d94dad67b0e4878025a76c876aa5ce5e90bfcd1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0e4a7a87f34aabc6343b4cb15c1a9d9dadbee26b9c981f3d2a69e350089bcc15",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33483351c3f04d6829452e08c729a2f9e791129ff177b49a763a69b5e15ad3bf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\eb977451b6d7dec287a535784d0f9996b84e23e45d8d41f12072ea0f19c38036",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\222c22f3ca4b7d69a7f45215ff08b9016844212f26692010f430b0f98baa3403",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\92275bac9a494a40d422025e71a52a0abecedbb83f173b41028a251bfcfd4cf9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bc7cb26b9ad2bcdeb8fc79ee62840ff1b4606e35a703573cd7208a76eecd0335",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0160364b2f9758be6c67610897f26eb3fe5e1cf274801fa51cf3ce033d04ad3b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\15d378d9de14c762b86d57cfc3b1a7b3f96334de327c162d23612c794b2bc1d2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6be57d205fd6951d6d3323d118f0ee5d9746edc7f60dea4be8bca4b33c2a9254",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\567eb17f8644499da3a62569cd50318713e380ae3960c29e933d39caee211d44",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\404d89096ceb3186ca91ba4d4c6f596629167caad0009c309ed240dd95d94e14",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4198a6021addcdce1b8c09269a35972f601c16f39c0ef543d51e5d51789bfa9f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f6b95507cd74baa9ede26caef61b21212fbcd760151da98576800807f499a216",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ac57a9699c3d85b4d74366feca13779061fb2aefe88289b9e28f592b84d29d3e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3ed2015e772fb7721cc1a3037e9eb9015f8fdc4a6fa702764285eae1b93726d2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e6d9f477bbd021d4100ec11375876627dc694bf7a0a7e10c2dbc529064ca1c6b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\eaa1d8eedd91547be581848978291eaf71acee62bccf303797ef8a8e7a1fb68f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6119fdd411fa2f1018bd377e67048e3a7e5d66a166cbf117290b0a5f5cfd6777",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a017eb79691f042c5530f24b6f5a5b3418f130c9313b663263c47fa7a781bbb5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2f495d9630918f65d4d45bba598fe23bb30f44a465b7b320dbdeb3e8963f1728",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f8bc780e7822534cab1ecd26397ed8ab9987964c37647aa9bdeba342a58b6fd3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\00e9b645385732d806c4c12114543b3fba81cf24763120e2348622d3e7dee2d0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c500046010fb06ce714bf69e8a8e55638ebd4f30bc81b5838273d908313a9d47",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d56e0428b72adcab926e31fcbd99b2b0e091dfcea6b8dbe1271c9cbbc184ebee",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3c7b73e65560a5c5a918e91cf29183029fc62a563f2566923b4b342e8fefbc5f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e639f75d1d41cc329025ab5b6461d36d83f68e559c2b660988c22109725f8be1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d6fdd6832d95a5f537e0e7d87f2613ea9741ad9c20438b9d5a2697a883c4cd96"
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
 

