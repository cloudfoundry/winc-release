# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1709)
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
                                         "C:\\ProgramData\\groot\\layers\\4b80624421c2d0aee8cf2545e41af76f3ef98da3372ec85b7ab640d1766e2e63",
                                         "C:\\ProgramData\\groot\\layers\\c1a167b407cd6c3fde25116951d9a043694fdc780774ccfef48fb4232cad2381",
                                         "C:\\ProgramData\\groot\\layers\\9a318af2971284b5bc8352252ce42c773454e4c5f6c80013839af992cf946475",
                                         "C:\\ProgramData\\groot\\layers\\e1bf1f8e21a206c9a34244279edc943a25d0083c1475942472478f5fbe2d61c9",
                                         "C:\\ProgramData\\groot\\layers\\2ee39465411445cdf22b10930ca960f71ad7645b25190e1a040fa97ce1630106",
                                         "C:\\ProgramData\\groot\\layers\\4ecb556ebb54524db796c8f76999fd4422ec59d27dbfdec70798957937957275",
                                         "C:\\ProgramData\\groot\\layers\\8ca7e199c302bc7f808b70ff7225002f22dc7f288b3ab3a872aca07cba820f59",
                                         "C:\\ProgramData\\groot\\layers\\c94a554728b920448bc0126301034b757476418798099a5cad4d12cd1f1f6243",
                                         "C:\\ProgramData\\groot\\layers\\dbfd19e8d3473537fa7ce50e061d30c36dd6e33c53aac65c851717b4fc1d13d1",
                                         "C:\\ProgramData\\groot\\layers\\a4adf04a4f1a1908a22ac6800b6a30c4042a88e771b919ed34c9f8c8f8a68ed5",
                                         "C:\\ProgramData\\groot\\layers\\dff23fdb3dc70de2d31545ab2092db38a30181b62625b618348682d09305dcfc",
                                         "C:\\ProgramData\\groot\\layers\\377e6bf70e86cde165cb9038d8844cff3c334ff1e3d854572661f2fee3c2e8ce",
                                         "C:\\ProgramData\\groot\\layers\\cd287184e0f62ab3af6c1f015d5b0d4de2aa2aed8d7a1ba998bd104eb176671d",
                                         "C:\\ProgramData\\groot\\layers\\20c571b37e743a168690c06ebfd17beca53589a3ccd3ce4a90531b8a6bb802b1",
                                         "C:\\ProgramData\\groot\\layers\\9284cb82dc68ffc2891fdf7f914da75ef143e806ea8f56d55500d7878702130b",
                                         "C:\\ProgramData\\groot\\layers\\0feb5918e8bd7ac607d8b5178fc088907a52bdcc71ef3541d5d3c63838dbf1ef",
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
 

