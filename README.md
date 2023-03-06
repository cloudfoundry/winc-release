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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8b95115344764ba59ddabc55dac517ec52a9baa78903a1cab9de880edac657fc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c64bb606fd9e3bdfae4eb0e003300191caf35b88d76764ac89690ba8c6fae6d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8253faa8ffe74544ea6d0098b9a35453b1deecddf74391ea463203851d2a7cc7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\320b81c956dcfe68b9bd736a636218be1d447d200131b3c10fb4006322d8ab68",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c7866c9ecd3c4ba71b46dfe79aa16adf630ec8ccdbd9ebe2c6106574ac0defb4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1a22abb3ae6fe161b20530c3bc6870b44c87b570f0ed7a8079d1bcdeb8ea31eb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b9ceaf2d595aac581cfd2294d5832fb71c442cb0a89ad59b22d71e86ea320505",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f991e4e231b0fa4c7b18a2f2252bedebb9819222d324461e015027d08f66c992",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bd2458ae7934ca0f17b990671d63404c96bd9681aec8a7eee53ec43270494cee",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\909650c7fcefb8409b89d77034e0bfcd9b77709c292f5d0b350d3eb4cacdf66e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1ba6362fe9bddb502e87c0057364b3c3f97556ad4f0a2bb4a2985ad84691bcd8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\985a28e51041e368a8c660cf958a9250c83a8e7f0ef63bb908877803638b0175",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\947f0e1138b343c4c5b6830318c35cf5819f196c8ff96468d2f963ffe921d30c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1feb00f452985910683a99bded0267464064c7798096951e4e9a84598d6a7127",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\269d102dd3c17cca567c33f3d5095b42cfa26b6c23f188f409409e7ef7bbd583",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ebbd4def5c03d342e0370115477adc74478b0a9aaaa86d43f474a6ca6ae18e56",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8bcc3dd20cb27c3409bf7158eb18ecdf783a469a8923c30ed1e066eaa4baf94f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fc3de2eba2307cfc1513fdf063f8d8d9f07010e684e3589c25ef937050d8a072",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\47e9de0acdf06fffe2a52ef60f793f6c07e9e05dc84f1c3bf0cfa828ce5f72c9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\73a0bf8c5cec04c2718925dfd717e8229a66ce48ce1c5cfccf4ef6aa4f405e03",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a012069baa92554ebcb6368bfba89fa4f774ea7411687d2ce38bd443805355c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d6131cee1d8dc536006537371b9e97a5bee2b75e290a8cb869c8fe9f42604422",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b25be5888289005686bed0f722e6be2bad91ec0c355b536b3fc664968ca3d616",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ac7b16ceeda0141fe3076436ab3a2c18ddf1c7dde903837c5a8e9b955fde73a6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3cd3f6972f4f1c1c0d300990ee4fd1271dacb9c9b3dc81f95fc6e922c0409c66",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\709c507179d739be632299ab239401a25f883fb6d9a67e997538bb8a95467544",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0f807953fe1e7dc22e1e34fde6e5466b890daf8b0b06a848804ed261c87d4e7c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\30d90e750a246cd414ab46ba09baeb11e267327550f06202cbff5f1cf7f54f18",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a04a0be7cae90a2f9b3dd2a10f7758603d57582d46dcad144573ca427efb10a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dea91730d8d6844b7b4490de575dafc8f03af4afdfde3ebc49076224986aae29",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4874160cb579a38e9b26c9eb4c121778b4750390a4cdec3a0783c85db91edb62",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\990672bfd84e556bf80b0a91fae9000b5f3a6944ac04e1550f0cca378e41e47d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d37190a40e909425195ab8fcb1db81a2edb6000c4331e2c56afeccb5fb18a1c2"
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
 

