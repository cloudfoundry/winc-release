# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1803)
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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\05f379d77fb662b138768f5e756d4ac4877d61bc4de3f622d7ac6af904ab794a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d19556e11713b132a542d36f3a473a03fe5bdd3b8e378f96cdd4e1496b0b725e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a876afc0f501a8c075c266490e7d5e9b2c45b6e95525657fb917e5f9f06886c8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d228c41921a95eefc0e6db36d1d45e59253b18cca97408d58e51e7560a18303a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1138e5e31b4190bb8f2095d17fa5982fc3b33578d3c8d5495fd4b7ee11ceda3c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\021fc5fd1873ac0e186d4dcce6c8df5b4b1231cf7b5e73673de4246734803516",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\76c91da2e4cf99a109ab46d194b9aafd61385ec70717f193eee1c699249bc529",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\05f1c14df7312e8d6dad2135d3943b1b0065bf9af69f878e954647411d05a9de",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\56af4cf57b74454466abcf28b034e09d2db55dfadb52824aa310f63cd519a223",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c28fea4c8a57a9d25144ef5235a7bccbf141d37eb097b61b78346c23f42ef897",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fd52ae02629715924c75ef980d432cb973f1327978733ecb879d06a243579276",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\617d67f5be63db8620f964d6c12498aa64370788d3fa7ee0efd75f2c8d4c3680",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb8d40e7255a8b13d637c5de0aaea02d9cbca82889b3e377aff43c505a7f0d60",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\21dc604854a9650ccc4d0c7465d9ef3029d884e8790fdbb9531b34ca43df7473",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ce3be34b69d3e5e9714363045d16e069267928a87fd6b7922852ecb51bde5c54",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5443241dc9563b2ef687c39efe98efeaaac21739c17679876fb5746807235bb8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2b95008beb380777cf59a784d4e4b1fc150b700e4dcb5a8cf0817285a211c7d6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a65eb838081d7af69e51f62d4e966d56d26b2cbfb9cb1cbe5bada4173c78f69b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6ca61c4dba1a471b7bd9fee312d4f8b264dea96c4c406d14abca114452b23e28",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f1c16f55c4403c0ba3b9fdcbf6008e8b00adcf9099dded5c5e8f4d5c07ea0b64",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5f804e1b8e8a928772303587f83c8c1574c7f1defb822854814dcc4e244fda7d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\70bba925263c1c193fa7bc7f79b1aa062707b09fe7774c7896b8aaf091b901a9"
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
 

