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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\475a0e9365458b21a786a453950b3354a2b4d09b9c6791b4f5e879201bc1c8ab",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ff595148b98b2b247a1327f8f64b9e4ffdf23039a27b49abc75333c052f844bc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\df583ca96a581cf214829295ac017e086a41f37e7eaf6862333f6aa981e0ee96",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c2568598f58276f07126fbc6062662cba48dff56da28fb421572df9434580069",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dc6e77692b4dca6837bb288c09cd4db0f42bd56816c05d0bba6c92aaceba3f5f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b9d7272ae45eacf72e651a7bc54b96c8b7884d4a7aa52f0a2a94ec26da4a77f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b2917fc474a91c1bcc744991d3992b066df9cf4066a6218c48c4148d775d24ff",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\aa1d0610526c931c08a2857bcf60a1fd41c1f0fc053272eb8f66d0006d9c9d49",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\22fdc05fa9698c61ff2ad29ba66de4987fa096e5d28e845684efc8a55581dfde",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7c6138b87d9b2616470d6939ae1b8a8fd06e7b719c78a62a97f760070da69769",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9b8921f3f8f8d19817be615b355d681732343a325e24a92c4ff25f57d08f20d4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\44fa785d0a6f58c80e6131a3a523b16d3ef6c970c36066b8ba891d415bd83903",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\38b8a3dbd696cc1e5b73828a531e421fa2c8998d5d75444c56a933180934188f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4abd02c634b95b5b552886c0d27ea8ca7ffb01a85b1caf359722952a252f99d4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\07a6f44af4ad818d6dd08a03a42d05fe21c67cf738b20821f40fb9d036eccce9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0100f78b063b7ccb2eda25c0bc4e799720c650996a7c507ebb17c8ba0d2fb2d5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\95947a4bd1ff9843135a2e6ff3d4dbbcc4d73e21093733c35432cb98e0d65423",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3dcbff7de719072d64d09838138130fdea92590ba1b1ac6494f533c77765820c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b67f2f963e3eb1df80e1388f77b54f9e417790e53bd4265b939b58cae4ef80cb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6b3a178373166b76b568881f4dfa5d8cd94cc3daeeb4e6ae59d2dec88b346433",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9e56aa03eb5fb309df560e545de6e0c7a033d1e0b9305cae8c2b904093e3fe21",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f4fac7a3b9e77d354d2e3804affa92cc4992137adb8635b7625ca48cdb75edbb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cc0a9decb68826d4f83bba5e399138fe5784e5a8ee5acfc16e46899370cc8ef8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\712b8f0e58197643256d45ce38726baf06569474612c55e457ff86c61036d344",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d8298ebd332351a77332900be8b537fa550da8bb87b2dc619354d50b0179d44e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b50f40e774bdf6bcc4bd2bc3f913b2cbdf5bdb1c082d898779554de90700b74e",
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
 

