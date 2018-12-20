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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\06a9db04b9c019c56ef2071ec5e04bf3d846df529e965bed517d3c6c6f365f5c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a181a3a264479661c6363e0ed6002ba0e0679075878c0ba15871f1ee6124bdc4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8e64d377ebde1b04915578084e5fd45b418476f0a83ac34ab8403395fc5c8afb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d8a1576b712062d65564f4ac2c945ec9b3904d3e862aa419b9f3ec4ecd7dcc5e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\940e6bef60ccbade6c79e3aebd37056b99c1b4b1b1cf078fb61449fc66847acf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\21e1040cb34042501fba856d22374f86fe9d4e85c2dc30589b10e6952010eb90",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2adf82971e2a2c010574bce222488aa475f0d21350dc91a69463f2ebc81af4af",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37c57ee42e411391a57887ca33ffc167803f6f614974387e357d671be11e27d8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d2a9e86abf9c33b3886b8254c3cb209ac09569b7debd0fd591189a62668ddf8d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9965105c1ed4b92c8459655e0928b98e576a6a3418d2f90b71da3b2987923d44",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9679c9f82c212f3c5c21b669862b9204a226282afe8ee95a6f36bafbbd6d3803",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e1483b9136e8f0bd5da07c8c777af53267c46ae3202cde8fd9a27ae96c75bf19",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dafa13b56583dcd4bf351caa04f8f255442dbd2f778799fb27a5505a113b18b0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3cb4b2862ca544387ca9f550d883e47463944905cf7e0180a7ec7f2256a127cc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9ac62c85c97ba9e43b629af4f09624eafbba2ba22a2d53f35d042d000ab6f4ca",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\85f4941227b6a9bd8d9db5e37d7640e6afd19fbf47a0f2a31c364f01e3f4d4a9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9da3fb7418da9ddad6f8a6c180db52a0bd471a070eee3ba9a127a8038113f005",
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
 

