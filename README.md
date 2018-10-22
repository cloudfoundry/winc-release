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
                                         "C:\\ProgramData\\groot\\layers\\adbf322914279d691420b397c06d4fdf0ea2d91d4654f0179cd9ed612d51ee2d",
                                         "C:\\ProgramData\\groot\\layers\\81a8afe7c39f7c8874d647fc6e1c9394f7c3883fa957c28122916af1d48909a0",
                                         "C:\\ProgramData\\groot\\layers\\b6c98949e4db1e910c48fdd6bf508123e28d385117f0cb5564b1d8ae2b65be71",
                                         "C:\\ProgramData\\groot\\layers\\8caf630adf9870e43774b863ffad14183ae25928fd0faf0d7a729fe901230059",
                                         "C:\\ProgramData\\groot\\layers\\2f67e0dd9d77764c61fbc3f77e9abe7f6c6532bce05a5091495e2f5cf34ba0dd",
                                         "C:\\ProgramData\\groot\\layers\\267e6fe588cf813b89e85f61ff56bcdbba6030778f45270c86594e3146ee4f31",
                                         "C:\\ProgramData\\groot\\layers\\6270225fefe3db812a437b62b34dfb24e34bd4c13fd5fdba33de801934433e6e",
                                         "C:\\ProgramData\\groot\\layers\\d8101c3d973b61d97fc456e285ce95a1225e88eb26b28767eea20746df5fe088",
                                         "C:\\ProgramData\\groot\\layers\\c6ee0e80540e0429f741319dec8b040407725cf40e2bed91636768a1b6ce89d9",
                                         "C:\\ProgramData\\groot\\layers\\9252577e253e5322484a390c5f491ad0ba3b4833c9d2e07b272748b024817305",
                                         "C:\\ProgramData\\groot\\layers\\b7f802ef41bcc5069edb01827872e0486fb2efaec217c95bb4ef5ca43efd0fa3",
                                         "C:\\ProgramData\\groot\\layers\\4a11bd895d82293e47c9ca35093cbe8a9043da4cf37e691dd6a27feed3eca0b6",
                                         "C:\\ProgramData\\groot\\layers\\f1e79c091fc6c0afb4f08c6af85cbfbfb5337ef3884dfc6ad691b997a1e41742",
                                         "C:\\ProgramData\\groot\\layers\\de68ee4c171d4eef1bffac6f47a364de3bc1da7c940132e4a03c2dadc31ad0a3",
                                         "C:\\ProgramData\\groot\\layers\\05d062956766729a5c0a238df01e0c1593f7e352da9d46f9e447b5c74e1d2fb4",
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
 

