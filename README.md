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
                                         "C:\\ProgramData\\groot\\layers\\403c5e5c4997cd499ca115a02a88c5b540398748306fab0b7fd137d77fdf347b",
                                         "C:\\ProgramData\\groot\\layers\\fc4330a812101dde4966d2a898b2e7a0d87a3111ef9ee6dffaaa2488fa4e6232",
                                         "C:\\ProgramData\\groot\\layers\\6f4a26c0fa10b5e01add082ced983586724b749c746a160a80fcb2c83e913751",
                                         "C:\\ProgramData\\groot\\layers\\93fd3d91cc54dc9445812bf0dbb39dc53fd16a34699e4ecdeb7ee8a0c056e4a5",
                                         "C:\\ProgramData\\groot\\layers\\d2a19731d56b428339bdbf820d5aebd35c9c7b1e6caf9f9f08eed8ac80c45579",
                                         "C:\\ProgramData\\groot\\layers\\f8068cd90e50fa3cc710843d2abaf316e0ea0d0ea5764c1a048bfc27688edd94",
                                         "C:\\ProgramData\\groot\\layers\\42ae51bb892362e0f169803ff588ad982420d2ef29a9112d8e662b876ad7df4c",
                                         "C:\\ProgramData\\groot\\layers\\4726255350e511021ca9871074693064cad723f2a8eba99686bfc2cc1e6daae8",
                                         "C:\\ProgramData\\groot\\layers\\ff20e4afbe42f06377522df80b60d1ab578674313d1d39764acc001488b08e1c",
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
 

