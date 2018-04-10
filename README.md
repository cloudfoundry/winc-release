# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:latest)
  and `GROOT_IMAGE_STORE` (e.g  C:\ProgramData\groot)

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
                                         "C:\\ProgramData\\groot\\layers\\8e72e89fb57b2a107b18c95a26d101151a330d5ceb517d0df2fa36f545c23731",
                                         "C:\\ProgramData\\groot\\layers\\108bc92f75f82e92b222f578e6a0b0bc049ad793cd0669b8ea8720f92dcdea24",
                                         "C:\\ProgramData\\groot\\layers\\613e2c0d220cc5f3245fe33e9a643f51305092df3d37765b0ed962d07254ba38",
                                         "C:\\ProgramData\\groot\\layers\\3a88b618c9a275532dd8c8712a2e1a06370d79fc92ceacee9b64408ced59e11b",
                                         "C:\\ProgramData\\groot\\layers\\f0a87f7667ec4c51d951a248eef9104a2ee8dd5414028d99c7afaf36e080f572",
                                         "C:\\ProgramData\\groot\\layers\\1a3bdd198895e248a02f2abeb0b56e5ddcfa4da53d685df51d4af2e0773c0d39",
                                         "C:\\ProgramData\\groot\\layers\\e974f03d689b9619dc5556e59a5f420a9085a5f759dc15825e99ba7cc7fb43a3",
                                         "C:\\ProgramData\\groot\\layers\\f61cab9bf565ec6de42a98c5632676d9c9b8c362752333716c76d3700daffb5d",
                                         "C:\\ProgramData\\groot\\layers\\1e2e9acf5b1c887139ab925a3d89dce09a7c10695681037959f85c57dc0b573a",
                                         "C:\\ProgramData\\groot\\layers\\e5b0866a17b29c017a405cc87c7747aca41968608c8ad1a3e1c487a09a90108c",
                                         "C:\\ProgramData\\groot\\layers\\589ee580ec28fd281d6e19351311e07124c9de253e44a26b64812f2ba54bffb4",
                                         "C:\\ProgramData\\groot\\layers\\27fd2e5f65a96b8f97536728b64839817f5baac4fa137c3ca6042a53de649887",
                                         "C:\\ProgramData\\groot\\layers\\22ddde35bb3b9f5267ba5a6525fcfd8a673b968b717337628238d29a25d59be9",
                                         "C:\\ProgramData\\groot\\layers\\4bfe49d7bc33014df317149be23a71dfe176f2ddd6a78977068a37973dde89d8"
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
 

