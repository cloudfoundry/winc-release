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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ce23acdc45d4e820339430a872da940ebfa53304ed9830490b4f894648acfda6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71d19274e16e15fe2bffbbd0dd832c36136c7b0fe2fd166d36f98c4fb7093a1a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\eb989fc82c393ddd72d7ca1b96b5e902e3e2f11d05066a38c8d38ca35a0bb2a6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\70e929c2f37d118f709e6f8804ef0fffd518c8482fc43e329fe660108cc2a941",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d8c0e760f38141e08b4ed5ec7b491aee10c317aa8627901d636c0cf4e6217e24",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6aede189f447056919db999a07e33bc94654e62e64e31da8025984a73a383850",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\20598da93bf229226fab71c6459b231d5ff5554120221864a984b5e02d29e237",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4fbbc48b6d9ddfa6db2cdab402fb8a2725d3c94cd82df8a25dc323586e4a6b28",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0247bb6ba5a51edf4cc7efcc85eee4976c749434123293c91bac415ebdb38868",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e5efa62cad771510b799269e7b67bb49ba40c3d0ca50a7e5dfd70789f9b58bb8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b4ca15ef1f52b8446a9897f1679c8a3b7b31fe7c8b719388473c04e2799fd47",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fef9656784806f3150f63c8282fa0bae9e9069cb644e9da05932115bba1cf850",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6571e73b61bb524885831ded5f8d2f793b04dec21614dc6cb0b350b28758a430",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\55f76ed1282788cf1fa9b507cb74714c7ddfbadf1f59801c2f232da5408a3816",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1f540926091fb45d25ba806bc3431d7c84f02b776e6a3063e43c3494dfddc2ce",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1e377e7a0652b7ae7824e3586c74152628926ad823a9985f1f1503dfb7bbe708",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c01b5fd590ecf1e77988b3ee7bd4c30a51bf2860d908e2414c8fd0a63ec1c733",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1719f0338af243fdb5a52d1ca3b94efb40caccd79a09a3cdbce6f00d320835b4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4d589da141c37d3a5dcebf0562231558f3fb7c7b0d0e390fc2097a134d79aa32",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\559ffc26e362aa658fa6e7d27a31e82b043f773e86c1aea93c07c3df1743c74e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\39f52fec6bf914ce288dafa7c7cd845e8580785b2ea35c0a9f995e26231f4449",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6243d015a27375c37c34a03befb3dbfce1c963f6592c88c923415a128f1fcdc5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a00fbe71fd2c8a2d9dcee7d0cef9cc7436caed5e0ab6442b5d6ffca71dbeca53",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7d3c6e876488365aa65756fb0d0098edb055090a338e9e118f7df25f928a9d5b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec0c92f1a731245ec6c0739d600c0c9f3e72ac5f0a445bb911c6474bfabe7d83",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bf85fb57df9844e83c30404c5aa2893f7d51706e74575ca597ba7be857f4da63",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a780eec4cbb4efb8e1666220a612b9de9c7461f092048b66b6421b1f1a7952bc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\86078aeabc108e0217632997700e4753a804eb9c6713ee58c71b29716b1bc2e3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6415841fd16976454f026374baa673af06356b08623a08400c53eaaf0a024bdf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\038ba8b0b76e9237e32a0a080c2a8c3cee33c34ddc554c8387ee6b3f757c57f5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9bd4fc672cb6bcbcd403587ec4b0c683d8fc84cd2e026e98eb3e71c36b7ceaaf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cf6cf093d1abfb615dec3eb2e1292d4feaef53601f019013ec3ee04a2bed24a4",
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
 

