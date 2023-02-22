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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7f161b24b32ee9cf766b4f94bfa462ffaaf319e6832e7bb40f7c7b82e8ece722",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\69b42a2ad34de646a811f94e181e4fb35ac56138e40c418a28c476419addd487",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\634de78fd6641fbd52518d1b80ea88c02314b67b7fda98e86439016ac32adc21",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\db71f0b1e2e521b7b7550844c54c342c6217100d78ff9666bf9edcd836721bf6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b838395b8af67198418c96adb39d5009799b234c68e3d631d24b07ac3b76720e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\477d211cda397e1310ac0918187a7954d11df6f42b7554b3d0adfe5d02b6863b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec1e9a2491b76a22275a9744d5b2060d3157dbfdc347d8d527cf997f106bcf0a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d30dcf3794c8dfa9bddf4a19d0e33ffb5f080de9c6f250544dc6b1e12eabe61",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2405507d80b613c9922b339f936673d3d0d82a06eb289de2f1be526a728ee14f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ba944c8175245fab43d8334e6fbeb4ef2ce73955b877395154eff1b21e2bc10a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e9ce179705405281d5ad88c57818561f86bbbd7e48177029949319688998524d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\461c8d0d241cf78772c3b099ff8bbc0025b0f368761c346658d3eb8399e578d4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\55014528e2e600dc4cb3c52316668a8b956ce27cb9a2aff690d0d5af1c907245",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8bf1cb9e43cf4ddd57f4faeed3090abe1b20b679c5a5e9b95adc09cd85fa8fc6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9401a3efb36c6b4ec60ec9c22eef05a302bbd3f3689ce0fd0ae8ab15b1cdb2d4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f97f71f596a733ca8e8387e79b7e95451f4896ecc01ae1e53220c829ed2747c7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\498349c2d919929fb2ef7777034602cf6f5fc3b43677224392f8120aa2d3b6c0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a2d87b6344cfd4ddfb8d0cf77b9688745a419369be734ffba05373a8c770d3f0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3324dddda420c89399729949b4c499a76db1f5017cae0e2fd172fb4cf49b6e2c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\550d0364137237d7b73fbe76c209211ef08d7b9d20fea565adb67ade0cffcf3e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\16045fed4cae78a1e8f2c392e21b64376dd2567969b5a039b35923fed0e2559e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cec418ea349b68b37eb2da9f18f450cae1cf5d25179df7272d325aa6554816e4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b375357054d2f61081b47a592e14ed9a4de5e4f03489d886cfdc47a80a50a971",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9143d7bca3a9fb832ec91397025fc074c7494c0fc843882da1d31569f95356f4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\de8994a2204e7e7c99145500eac42d073063e064ad5b2bd75a28062d024c3a63",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec9aea13a38ad04dbeac2b03d45af75f6212b5c49dd7c340ac7539d630d1a5f6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cc684777d13d66b5beb49d1ec25d017a42ba2735f6c9f997c61405f46900b07c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4123c8886a07a505298723c1e0035244aab86db1925072446c35a532bea2b488",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b095b588b78076684d587324abbbe951933dcc530cb9e4ed5f82a9cf32125b4a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ad554065e81433f5fd181a075a6e6de5ad40199afad44fbbb5d560e401600b27",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41a5d576f4d086afcc89ccec5bbc913a6aa3e2b711e2db38be8d6113b2514986",
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
 

