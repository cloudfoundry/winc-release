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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c402cca7b3d1566524525c1579079d93d8393fa40071121605a54f48a124319",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\350d58ef2b8ba72802c0a294f811d3693640816654ff60379a7af3c3dc553175",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f6d9e13f0b1d8c16ed4fd71aa509f6ff81a03587c4d4670a4281f367ba9f686a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9a0103b027ea183054e410552fee37a5d1d209a3982425612ad4ffab7a9e013f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33efc3c591d3d107f99901b92948a1c429c99bac13eeec8fb2f59e4bfdf25854",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3926d28652605cbcb3efbe806be094ed511dca7c4d252a8136a43e506e658795",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d46b93dc4b02bd95d8004cce7cb22b0dbac595df8761850a5e2be3f2e5d8ac86",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\459f34ee1d13f65262d2cebaa17feed0fedbd1e35779ad175157b2025fadbfd9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4ee1dfd959de0c19037fd485ea41191ad69dc94699947c5a9ea421188dc7db2a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\25d96d3056408c575cd29282ab5cfd42d71cf5138095acc89c40d5a04b8e7fe5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7a4dc05ba6bc7b0a44e524e933e8d90b818bfcb02a063887d4b54e23bdfb1a48",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\56af5bdbee8f275cff85f1f00c3ad415eda857fa736ee69fa744186e1e60fc6d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\85b9f24d0e5ca6d69d8a3471d9a38974595a88797aedc0d0524f104312a1527b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b067ac0ed4881debabd8c246f72bdad15ba4ac67d32785be503b36d5afd91587",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c3610e888dd42e403e1267eed6af1f0d36e34442d27d93da45fecf0620a9dee9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b738e4151a7d9c78d45ef181f298cb8866c08d364a79bd994dd18792a27fceda",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a91347505cd27aeba34ad3cb169e91258fad723741619cc087a8855e7f239c95",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f44bbecf0dabcdac04acd62dd6a8c7f1cafddebdbc2401150972ecf55af7e45e",
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
 

