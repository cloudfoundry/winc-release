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
                                         "C:\\ProgramData\\groot\\layers\\9380613a765cad8ba54e29b07eeae891df4a8319eae5551164d70e52f2071aa3",
                                         "C:\\ProgramData\\groot\\layers\\eba71b23b2a7a8f19742c4da74bcb704af909f7a1b25c1df514160dc3731e612",
                                         "C:\\ProgramData\\groot\\layers\\4939bdeaec36c6b8736cee475f9bce770ae99dce7ff849a81cec546ffcc50f40",
                                         "C:\\ProgramData\\groot\\layers\\efde954ad3ce170086f5a23770c3d74a5ed257e8dd990b73bdf0c276bae11b9a",
                                         "C:\\ProgramData\\groot\\layers\\1bd1793780efa8b50618aeb0c20ec6017588f2ffe7b0b63734f473d887d36ba8",
                                         "C:\\ProgramData\\groot\\layers\\ddf35455ba021a96a12faa728dcfc6989a948bf822049c2795eb8e108d4100ba",
                                         "C:\\ProgramData\\groot\\layers\\9d79b009c8a85076afddb1bf8cb01750e8ae251d276d2eaa437d4ea14d93c867",
                                         "C:\\ProgramData\\groot\\layers\\bd05883672424a358bacc7725984d4ad7e6253c8e60f554c00b097eec76d6712",
                                         "C:\\ProgramData\\groot\\layers\\dafd75083c2c0a11433bc7d72531797d60dc9ba1face23af503809b0943c0c4c",
                                         "C:\\ProgramData\\groot\\layers\\5472721fad5ebd81d1d717a12a8874c930ccd91f7b66626e48c49169c49dd60a",
                                         "C:\\ProgramData\\groot\\layers\\0e070531c123c68a0796b8b4334d738a07d999930284ff2885883a118322bb50",
                                         "C:\\ProgramData\\groot\\layers\\bfff62aabc137560acc1bba56180eb66833411792d7dc1c629e309a3e61b81de",
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
 

