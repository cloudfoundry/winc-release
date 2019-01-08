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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\57ef7ade17a2e70de755a7529a54983127865eb4112272960de16bd4ff0f4f09",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a94433bf18ccedcd6a5755c1564b33e2ad895f510945c12ffa3dc287ae46822a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7355d7057a9a5b54aadaade42893e9ddac1ea2425fd4a8665cddc7be09c1a3e6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\19cddb946ceebaa06735c8e10e08b00f7dabe6d6d76a62ff91218501574cc7c4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\efd5a32ad7e332be0e25206cf2eacbe6b33c54eee93749494c3386fee1d42797",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a9066dc737f8be2d063a82f1b2dedb300e225b13af7479da046ba4c7c5adc642",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b351457274d9821f0d8a81c1332196f66c909d8843b56f49105d6dc8dcea666",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\488acd7dafde11d14d8b929221a4088c948f3c4deb393e2fb84d8fd446b335d4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7f259dc3859be2def2d1ad4c0e5f0f6aa5f9a97ec63fff69f4b932b3a837a6a0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\49dee10d7f21b866ee13e1d52d050602e7375b3b13506c40d16260adfa2c09e8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\effb696209a83f748bdb9187a97dab245c796fb38d2e513f1f682025c6c4e532",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d56eda28d993f730654e8e22359dc23c1de6570a3ad4dc749c9baebc84087cb7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5197ded02ca8f9bfeb8a95c68d025cd62104162b6971d980c0c7e03e371e99c0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1a6c5f2e34857ff8cd333ecf3df3621155d514853c93396690f818c3a4af0951",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b5f7fb6d5ad683c13e62dd7efdecb0a579cca33ed1aaaabb0fd519de323ff6ed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\611bd6e7590b32a213db462bd5f405c36fd44b32e3e56786a72d264fc0bcbe40",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dc84381339545c311b13db694b909016cfe200f00afccf615f1844fccd8e26db",
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
 

