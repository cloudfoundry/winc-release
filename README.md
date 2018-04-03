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
                                         "C:\\ProgramData\\groot\\layers\\fd274a95416d8b52be4a6ddd1ea6052ed5916b8b016149aa741b34883dfc971f",
                                         "C:\\ProgramData\\groot\\layers\\7dd433c4de3bc44df0d6807edb33a22230a88d33a2cd6099bd9fe998f0a90ba2",
                                         "C:\\ProgramData\\groot\\layers\\1c709159adf895343eac065fb51e9b25f4de04bb6b3d03ca8c2b4f1db93ce7e0",
                                         "C:\\ProgramData\\groot\\layers\\279ce138b2063c56de45a35397f5b9a186a8175b1a16a768ef054c229a1c823a",
                                         "C:\\ProgramData\\groot\\layers\\059454d898ea23583c5fa70b9fada36d2c0b09f3c3601b2442d258fe91b51067",
                                         "C:\\ProgramData\\groot\\layers\\bd6be413b77d9bc134ff0b572bf3b0caa8d7d62a1b867201087082436385025d",
                                         "C:\\ProgramData\\groot\\layers\\24759e3c7a6194950aede7e94cde4c2996bc84ab27f1873e4228f53c97049674",
                                         "C:\\ProgramData\\groot\\layers\\7804c2b0472d2f8a6889e58cbddbb90927ddd25e0719544c6dc730825c4fc691",
                                         "C:\\ProgramData\\groot\\layers\\bd23033cec85501bb02616fb11090826da62d27240397ddd32642ee8887aa611",
                                         "C:\\ProgramData\\groot\\layers\\13a59ea54a5c8cde76e6a08570ad16a96e947d6cdf5d5533adcdae208095022b",
                                         "C:\\ProgramData\\groot\\layers\\d3de82d1c9776876f0e2eebcd4b140947cdf13d998b0e0758ce8f1867c6e3a0a",
                                         "C:\\ProgramData\\groot\\layers\\ed2daf58f25289d3db3fd697f387d7bd19a27c5996160bd2900aa3b1840a64fc",
                                         "C:\\ProgramData\\groot\\layers\\a8ab7e3b173a8fd207f24a5c6fbd0359df391fad90bcc393aae7404f64a2314e",
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
 

