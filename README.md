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
                                         "C:\\ProgramData\\groot\\layers\\26acdd70ee04b8ef420161258de43303ee56ff702432ce5d5c1c295077bee0d4",
                                         "C:\\ProgramData\\groot\\layers\\7837be25c21d7a116a594c089e53338569a3cf8abf564bcef7d23f1e4649debc",
                                         "C:\\ProgramData\\groot\\layers\\5c1cd22f4fe9d25b988ce70ab449f89dfaa1759240a44fc19fb135b4ebb49dec",
                                         "C:\\ProgramData\\groot\\layers\\b2715894e2fdc6d45ad4998adc4738d779681422e63b3ecd0900484c7c7c1283",
                                         "C:\\ProgramData\\groot\\layers\\e2c151aee5ca0247a893bdd64bee136bcbbea084a88a25836586b36b51cc35c4",
                                         "C:\\ProgramData\\groot\\layers\\49611c645c97e575f9885136e832a424dbd7a0118b471b12f6ac0cacbf3dcec5",
                                         "C:\\ProgramData\\groot\\layers\\c7ca5a42a5998d7ea9818dd5ac03f3954d7ad75f1c30472b0e6a2b851b352bab",
                                         "C:\\ProgramData\\groot\\layers\\4cee45bae8d76b1bffc2dc2966acd67a2513a1fbb078e688f67f7f766da524aa",
                                         "C:\\ProgramData\\groot\\layers\\82662999747bb1c1b43c2424facd5395cd6924b2a74d7739c77d447b440a80e6",
                                         "C:\\ProgramData\\groot\\layers\\4f256b24926f3d8ee679c5a3e51d09352dd14ed201ab99a68b33ec3482dc5cad",
                                         "C:\\ProgramData\\groot\\layers\\d41b6d91bfa505a5e810c9edc7528df1b3c77fd1c2781e118eb93143f3d02270",
                                         "C:\\ProgramData\\groot\\layers\\be34e1fc523b08b08fc05ce80582cb3ae955c61a2115c3e7659a37569e2cfd04",
                                         "C:\\ProgramData\\groot\\layers\\5bbc783fe548f65f0cdef24bb44ba459fc15868d699d6afe04b90203cca0fbe1",
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
 

