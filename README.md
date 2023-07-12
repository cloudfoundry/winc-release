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
    "ociVersion":  "1.1.0-rc.3",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e366fb97ab008a3d6d036cb920b3de914509a1f0963b3947fc7e09b16247cdcf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\40d67427d17ddccd17e5626e265e3d5db1122ca1dc165e0ae474103f0c3c5806",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0d6b22e88185a8dfd5c05da93a30203b1800c6ce44561f2af0d4dca7071cb666",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\319c3f5cad760a0ae36a9145afa2c347688833526f664cd221beef360d3792dd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8b9b192c76f7c065f3135d5afca9a862e8e7d7c3e95fd543865e39e7fac428e0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1708ccae38abfeca974e118f2e1852e99a7dc953d8f804929e137333ec965a23",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\87a384f337775ad159062a82943da01eae5d867d109d4432af7f7166632d76dc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\58cabcc057e66c849856821e3efaddcff1930de40c9b1eff4554b7de5708722f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0059f96decd8fe87cdd92abd0e21c1a0242160dc219e460b203a9fa24d530296",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\738cce2e8133c5e007f59cb348fce8052a00cf5cea23cd3bf29b291442157475",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0722a5b65169b9c37ae3c176fb0b2e1335dfe73f0e5c3da5a0480d934ebfec6a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fd37f1e1f5c09c41c45841435633b34b35e42defaeb0eba5073853eda281ebb5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6e8da779cc5ed3f7b4f4febf9c1e5c6e8bdd6996dcdd8fcd000b94f8ebd5f9a0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bf8ffc30155134748bdc1f9243d138476beab41a797fa6e187ba81a88e67de87",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\484c1d79b73920ee3d7ff22faeb3cc785a96ab27c89924af14c950faa7fcf3b2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\60320837f492a83d7e8319f6732227b1765acb7b6dd6f0f9be3d2fef4d87a19c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c8fbcb18dee21b6eb5ee3c53ffe327c574fab1b782b07a2cadb65e55b600fa0b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f0d2435c6ce4cf06f28f6ecd177be568732c439815f072490fe4d1504f522462",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6c9343e7e7ec072506f8781b0c8708f9504733f6f41cbafdd44665a7c081a814",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\594678e64a75938d09ae86a333686b1b14cff35ca3c36ef38c29a65ff25c69c1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\baba7904baa72b0925e81b8a386950f441ce541d37bd48adc08baac0660ffb5e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\645805deb8266bd9604d9491b4ea9e90f0429391a0695da4bd0b1f54d17def71",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f9f944c60769686d3a0f02edbe3be61b75c58a6ddbecae0e0d8ef3b579e2c462",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dcae8362fffbfed08be72bf4f6887542dfbefb843f062cb3bef55391c1288686",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c8e1261204dd4612db82cd5fc9ea7e90c7a45726688463589fe7c3348c265aa1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6d2560422ee65f90c0b06e34b6b69785345e65e6a87e3a31589ac60d5dc27d13",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5ae7857132712e23e2d16542ef64570f0e6da3b5baee78a57a9b13e0ec47a833",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b1cec1a8871e44629d22d89a743fdc89071070833d6e5ab98b56435fcaa482bf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6d1280720e3105f1ab8dab2a9d8238737f01e1c10212399d9b52215e050e63d1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8d7870504a973d82a06f9d541490ea7327b0ce9e8aa0fc36deca78facb5d5437",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5a383ba3df9d6f9a9412aae0993a0be1faf7b18a64332c30c8b0259bb6760012",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bf00aa7b5e3ace00aa295d8ef24fb0a9efc3d20eaf3dab439b8d23dd539011bb"
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
 

