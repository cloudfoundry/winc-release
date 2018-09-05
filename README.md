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
                                         "C:\\ProgramData\\groot\\layers\\776981d75c9c343e357769394a65ec59da1653e4e4488ae7a1d2d8c15b26f66d",
                                         "C:\\ProgramData\\groot\\layers\\78662d71948adc7126768b2da96cb5f8a422b4ceb13b3d39a45094c723cf90fd",
                                         "C:\\ProgramData\\groot\\layers\\39b0fc839f99ce64513f4b44c482df055191b017551d95a14cfb558e9f99c86e",
                                         "C:\\ProgramData\\groot\\layers\\69329a7546bf0a6021a5c6bf1d3d9881a80cc77d990a1c1f093a7b607f176b14",
                                         "C:\\ProgramData\\groot\\layers\\6df91f155871adada66c564e0c61eba2e3d158b6a3247de467d69c769ea62c40",
                                         "C:\\ProgramData\\groot\\layers\\dc8aef625bcd264d6ff3c856ba5ae62ebce324aa97866035c5575d03e9cbe686",
                                         "C:\\ProgramData\\groot\\layers\\59c0e81e4f976e2c67a38681bdb221d1a6d71cda269aba1e59f7bbe0ac28caf9",
                                         "C:\\ProgramData\\groot\\layers\\6ae339927916a2eceacad54f1ae33492865aadd483de4510fb564375b0e3f50f",
                                         "C:\\ProgramData\\groot\\layers\\bb98b1d3230b667856dcf11f64b489fb5cb8b821549a5019a1c4bbc540128638",
                                         "C:\\ProgramData\\groot\\layers\\84b527dd75048ced2605d5411c2b70639cd4488572a4b6c14197c0560499a71d",
                                         "C:\\ProgramData\\groot\\layers\\e7862c69860efc1db216e915f1c60ce19d962a5204429d365ec9300d91ed37e5",
                                         "C:\\ProgramData\\groot\\layers\\534890934f3cae47dd1dc2c18ccd563a1777d84dd7836af6de6c91b0b7f904d4",
                                         "C:\\ProgramData\\groot\\layers\\95055c6a6a22012269f31fd25abda0eefecbb09252c14f4f3f7aa09f46633634",
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
 

