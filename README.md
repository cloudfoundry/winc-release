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
                                         "C:\\ProgramData\\groot\\layers\\6608983dd069b40ec5ff785fb3818486df09cbfbf6e9cfe1a2b3db099f2881ec",
                                         "C:\\ProgramData\\groot\\layers\\050e1ad7009ddaebd169295044c7e07b20165a77802a272d3cf708f654c0259c",
                                         "C:\\ProgramData\\groot\\layers\\3e3f6f823f5580d0750e177370a7a003f5bc93f4df69cf670d95214a9f30d7c8",
                                         "C:\\ProgramData\\groot\\layers\\fd30277cd2ffa5343511ebbbd21e8c92bbcfb52e89c4cb4da360f46b846253b2",
                                         "C:\\ProgramData\\groot\\layers\\ee85ae65a37fe406670ec9ce32fa7d12a51352d89385804ed9a4784fd5c9aeff",
                                         "C:\\ProgramData\\groot\\layers\\5601e9194a2a70f61e351ef57ac7c16511fe4674e1d3d00852f85e4c38295ab4",
                                         "C:\\ProgramData\\groot\\layers\\31ab1e26a24f738a3f7f02059e14e12dccfd8ec49071f0035a0ad8ca5f529128",
                                         "C:\\ProgramData\\groot\\layers\\1962b4fc416eab8820ade2bf036c760f7083ccf510a2a7622fea2188c8bf8296",
                                         "C:\\ProgramData\\groot\\layers\\143856fa539be8adc306347fe3f106674b317337afa7abc73e880314c74fa26f",
                                         "C:\\ProgramData\\groot\\layers\\f87d8470790fd0348b4e87f8f87b1b07a3624ccc58b466278ed85adf6d87f7c2",
                                         "C:\\ProgramData\\groot\\layers\\e8017dee5e92b3f1521643eea7fb1e0319df2d0e7e0de005de702933e52afb6b",
                                         "C:\\ProgramData\\groot\\layers\\1fcd3a565ca1081d58aa760549883c408293a5d4531f0185c5a6c8a451f59d2e",
                                         "C:\\ProgramData\\groot\\layers\\8c99383f625b28ef60a866047687dc256a6cfe58beb564b0993ad53d023ac0ab",
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
 

