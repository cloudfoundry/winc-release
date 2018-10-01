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
                                         "C:\\ProgramData\\groot\\layers\\29d64fb014e8a6323d77c3ceab8040e40ec55d1bf75b785a693f69c8e7feea6a",
                                         "C:\\ProgramData\\groot\\layers\\5e7a407a4419ae07532a8f9f56b143c7463bc239788003ac348992a1ff731821",
                                         "C:\\ProgramData\\groot\\layers\\2b4f19595d3c36e9598e7c77fb3a245942046b515e8fe9618a6ae9bf12924c48",
                                         "C:\\ProgramData\\groot\\layers\\0534b794fcba79c09bf12e648926ccfd81e2005dba6850cf141edb9e8675d657",
                                         "C:\\ProgramData\\groot\\layers\\8a1a2253089a99640a8a6c3f5f267fdc6c0696b272f9ff627b2fd3ff8d5270df",
                                         "C:\\ProgramData\\groot\\layers\\8f647f2ff2fa9be6fdfee113136a5b233862a75266e34e843d90b827e9381312",
                                         "C:\\ProgramData\\groot\\layers\\52ab7f55930fed1dd0ecbd58b949bcb38205709246b521e9a127b0eb0c777951",
                                         "C:\\ProgramData\\groot\\layers\\a9293fa23bc6efe7816a9df18840e14cfb526bdd4ae207bc768dcf0df8737ca0",
                                         "C:\\ProgramData\\groot\\layers\\c418f8ee6f8f0dd31fc74e61a3f4f0dda93d72096275dcaa1d4b5a39847899b3",
                                         "C:\\ProgramData\\groot\\layers\\8bec3b9a88ce23f29bcc98e81681546f04dca837e4730e3bb53a670138faa25a",
                                         "C:\\ProgramData\\groot\\layers\\d2db1d57c7a9205743fa1b026b6b7205d225ba2ee15a9804f0dea47925ba309e",
                                         "C:\\ProgramData\\groot\\layers\\c0c507e2e3410b1ddb1420e0648dd41316dfb018a3285d58792c08e6f7cefa69",
                                         "C:\\ProgramData\\groot\\layers\\276558422273f3bf2763dead4ff0c0e4c292789ffd6c55c4d0acc83ce003327d",
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
 

