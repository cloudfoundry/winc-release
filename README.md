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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a6ed0a7e7d529a9f4ded52ba92c5b53c25ef06887616d37f37ed718c82832dbd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f350c8bd6ff4c1a84f2db74f1cad515ec5c422e0b043f908913086db91ab7dcb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\17e344f4a36e6f44d6954f776f3ef8faf864060f19e836c479788928a9e341e8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\08d5d518487e4d0cd42a43ad969b3dc66e5e016f00370d8942464d86c2918bab",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\75079c697854563221c1c4c45f67f00bdbf0294c079b73f776821a7344861f90",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0913561c2a3c7c73e4c5426d5423e2f3dca45625dd0286910a0d246a1b76173a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\99954cb21cbaff085cee2b2b90bc4da84c243fedeff028bc078c14b6bf1126d8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b98766ae61a6aa54db37ad3c36f45404b01f969759ac8769364012d9794c6c67",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b630af45d072e830c783e572b4d63b5564c740597d3e655ba02af8e1e7a9edd9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1c8ba48106f339f1b8c02d5ebd296e73b474be96f8b81a3d0320bec94518c78c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3bd868843492be20863f3d7ae5242f4a58cf01162555b9dbbf876d01bce7ce03",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe9825651b5702d6fb35ada2a38cca9f2a6c9045a125aad0ffaee8ea993d2b93",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9a26ef092970cb21e31e40b213aabf709b87c767c042540a2c044cd45785beff",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\052e14cfbaccdf1f904693111663536373c4ac4903d750f98d473e00df40ec5f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f567fbd3ab17b75f5bbaa1b8c135a575d0cdfa42e86141c0ec2ba8b314b81d83",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b0c9ce2aae1c2d0cc2a15b2ed1b2b65cf39310d357c4b77ddd3c4728c81003fb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c21e997aac54d6df94577b6b8325a371d51fc8e941956d20ce2b9b302406453b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b63682d768b5e111461f7316890ff73c49ff5927785dce3264d720b5e38448e2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a8b42d12d9433c5a86ec645d3c7178ec41891a4642d7e7301847b93ee492b4e3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e4a08b91b78556ed0e369aa470f1b7497b055e732b50a5ac7d0d4a4df2a6bd7a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4cfacf7ee8386080be43d654159289e5f96ebb1127afc14f1649d4f95d37dfd9",
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
 

