# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:////microsoft/windowsservercore)
  and `GROOT_IMAGE_STORE` (e.g C:\ProgramData\groot)

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
                 "path":  "\\\\?\\Volume{8266049d-3390-11e8-9308-f888cb3c348e}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\ProgramData\\groot\\layers\\dd6576fce09e79ce5cfd4aedbea9a97627fbca8c42830fe1db38f22ae4497f14",
                                         "C:\\ProgramData\\groot\\layers\\d8012fd01be48b59f88ec6ced8c1df641fbf0b6802ee5bb181f5b895fd075ce1",
                                         "C:\\ProgramData\\groot\\layers\\01984435d080155f71b0cab95d334f6ac892118b7434a3a21daf82b926460ed6",
                                         "C:\\ProgramData\\groot\\layers\\5db0833889c37527423872f2b2e19d9902911c20090dcf8d346164625bed76fc",
                                         "C:\\ProgramData\\groot\\layers\\5c88b745bbd304b01e14dc6e06d6d2d1e368149c230b37861649e71af5b310d2",
                                         "C:\\ProgramData\\groot\\layers\\d2dea76ce99ae1fe245f50aec452eedb83cc1480a7395dd71c9ca9a40eccffe4",
                                         "C:\\ProgramData\\groot\\layers\\09c6e9b5f761ba106ea441c3cb4d6a357e3571b629e22c3e0271cff524a19d14",
                                         "C:\\ProgramData\\groot\\layers\\83d71cba804a1aadd681cd1605c40c086121f6f648e69f0aa0dd9bcab2cf1a14",
                                         "C:\\ProgramData\\groot\\layers\\3a05189f784ed1702f24df10a4c31897ce6892193fff24e9c31c3bf0bd493ff8",
                                         "C:\\ProgramData\\groot\\layers\\31577bebd7fbb96341845157a4e3c12940bd11522bfee8ec448f10a46816ca0d",
                                         "C:\\ProgramData\\groot\\layers\\927ebcd98a78c51081a14afdc99c77d8f6c133f11a3d122f642d8313b9f15a0c",
                                         "C:\\ProgramData\\groot\\layers\\d73eedfff4f8485b60ab862324f2d61432e3e6d2322a0423b8144f3790fcb2c5",
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
 

