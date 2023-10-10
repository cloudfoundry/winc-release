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
    "ociVersion":  "1.1.0",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8589f6e03272c25b367099fdfd93663c9d3b2780bb54c13856184739626ead4f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e6c0ff0ffd1a3b7263cb9feebb538c7cc81ed9d50a2dffc9a58ad79b58b01955",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f5d9091bf1045ab5f4a91176bb57dba45af4156799e337453919e89bf6db5197",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9f61cff86ceec6229eed4dacc3dce40416d750859cfe5efc85e144cc80ab8c76",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dd853f9069bb6c3cfbb9e4f9b04b73a270cdbfd1479b52effdac7d0c14526d32",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c398e3d29454f3fb0f5919ce208e6740894bc7c0e5fbd09db6450145d810c91",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a5d76b917b8a11d50f22fa2aae9e8273634207c93fdab4bbfda58237a5fac019",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\05035d16fcb2f37289c6302cecb8318a9367e3465866ca1f54c1ac28f656e34c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b9d9cc45fbbda431fe8d6d1a028b001d0813d3efca9536bbc9145a21972aa951",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\23a9dac124fea900cbe5f5eee2b2e213adf48caadac9dbc6bf775baec9027655",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7ba1470b24d0f498291502722f7faafc502843112e951e38e39aaa1a64527a93",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a1ad4b41f25362ca900a404be90533223fefc243d34359be133e833ef0d4319",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\409eff106c2a94ed8855504d71fb5f66dbdebc3db5b6bfaf54cb8d5f6c29894b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\23cb06c47d78c92c736cd92505d054a2a60af8c494b220688e5d40896967a3fa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bd863ed6cdce85d4093935088029f01b13e92bac39726cb3bd85941eedf0fca9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\77ec5be78c51afa318dad263b80c6f6d1af19819ba071ecf9416e273966599d1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6759bf033795342386782518666cfd5c758329a5a1e1a45f594ec1d37d33ba20",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b05a34e8fb63cc5374658f711fbfdd02cd4c16c94e6db0f1586fdd388f9f035a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\38aa40f79272b2b12a743f2c7303797be1623364625ace07d1626dd9256e6183",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\755b91c60e43aa7cd44d42dfd8bc19360b7ef437c639e2e09b2019b11378b445",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\020c653bcc1079a7e2da7753e436d2c8531995d932a1d11df2c9364721f0e9e2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\472b92cbbe5e01bb599bdfaf7c14db4ec075395a6e7e6abe26efdedcc9e44c1a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c6cbdfd6ec6c3132c504e3b63a0ceebe17e981a43e25e535595855fe7bd41a20",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b7ea916ed3a5a5f5ebb6a381de39483223aed6ac0c0fc1dd897f441cc08ca426",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ee6800245594d0af1ccc7dd5656f44d720e2c48a3407028dca56265960865eb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4d9a305c8413f98050c98950bc411156d370355283a5e061875f6e59e3bb142d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8e6d0f0b944f5a67077582e3871ec738bce295f64902f197e424b8134a29eb02",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a15a0a02d29aab71f350a2bae7c13aa0b1b40881c1693e1d0ea8c5966947b23",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d4f45a657902cff150b38937f85e470312dc027ff2034ff33cd55d58aad00daf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37aed99b750a6841886e0d414dac184c04614e04a232e4c756ff169c26a5046d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3cd3afc9cc86a782ffda75bdf14a91221291f31f1c781ec1413133090012ab1c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ed5d08b08effbd6afb72bbf9842d4d9ea7a1ed6ac50d624f11c6b666814fe707",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\da2d874340bd0ca5f710fcb2bb9abc7423e71287e9f2b87694767375272e797d"
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
 

