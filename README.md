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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f82e8fd6c1bda2ae36ceb2afb2e0409df96e6df222292be0b1f0d640e48866d7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a309612b6f18bfdf87903c9883c8fc80d64c2b12c7534aa152ea78ed5531a109",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\92d12c77256f2e2b1ba06fc555b8ce646d52f6724c6a2ccdd087ec61f97eca52",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\24fa73e119d11892604bf15d535cc262f789caefe2b4eb73ecdecdfadbcb5dfd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c4e9386e5f820a16945016b44e5eadf86e28cbdd549a5a829a9099351dbe6b9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c06248d0c17e70293b337f922f213174c23aeaead167366969e96459802fe19b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\10f873275334c62e0585b06945b658562a8e47ee535f676ae771083641e76675",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9f9d3aa1710f1156511583a384084b86f84dddaea0fb469d7ed92ee6275df938",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\98decb97c809a32f14906c3e0ce1855075ec52ecbbba3976bf89b1e356c1c6fa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\307ae0dad54f223433576ade735354698437584a75623392f81c30634caecae3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c370d093fb6522636c18c5922d5c660a99c4fe604dd79461416fa08ee9ce82c6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a9322eafb6c1653272ed0a74cc418c6186e550bf638f2e4365c9db4f24cf4a23",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9138cb865a2cef6cbd6eb8c8e330a9740aaedd34ac3ce7aa8fd89b5630a1fc5b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\44c083b23bd835b1720c35fbc0184f9f1b18e847442fd3c0f071a4c1552a2028",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\11809f4d0472f7e887a0f537accb31acf7d8ec523f4d2f6ee050d93384297387",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f64ba7013aa1b4e6cc13aec71a394baf3580ccbf4f0a61e8ca24929a57ef0670",
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
 

