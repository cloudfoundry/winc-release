# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:2019)
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
    "ociVersion":  "1.0.2-dev",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a0abd3da9cab2978d1adc56cc4dac6dd95fbacb9ef8645aae28441342cf71ad9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\54f6f4e0e1665d97d0bdaac6efbd12c6dc81bd6fdb703b195e5e0c33ca61e01f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e2d2310df1590b23d4858d219b82edb889ceab5e3eefd74454fd905e818b8836",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8278749ae03f34d44bcb3cc893e715e16b3ccda300bbbb8d8c3d04705dd2d55e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fbb7ac3d568641d3caccef6d13300e3b5e6e6387dcdbf91c470ea21b5aa6ef6d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bb24dfe7e5da941702d23e39367b132464a2e1d5580c2a1d3e34ccb66d1bfb99",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3025b1dc6115725c2ed02b95210279e3439acbb01b320bf620787388e6d3c7b3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cbb413c2a1f68b11beb8e012881487f81320b85d885548768c2ae66f7ee534a9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\052c2951e252cbb559ed6e07b9f20e5d10cd759ddf2606e4d82762392251a8d2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5ba8d2166d4bf3054a29d065ae4f2975de166147d1e8f2677e2ac00d834e5b5f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\704e6c118b272e7e19dacd9dfb8b7167d03d0e73835c0431306bd4a6a64d9604",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4bd980d79c0a641ce7e10bc343b91338e2618ba6c2e39980cbdad7ec2d7fe02f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4e7b211a9538640d146d904e4441a5185e3c00fa05f273a13c8bfb09fb9e098b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0f35a3cdcbde21b4eb851ea42e428df0909248236fd15a2eea91af7c741c336f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d7203fb5e81686f7370616c5d2910d3fbe98b83dcbcba908fcf5230dddc12f31",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1cb1a73dcfbaf4cdd4413246147e456c8dc81b3c86f152c256b23b0757099c37",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fa2ed47c9cabb18834335ab0afa8819aa885d758ce41fecf7c29938c4fe075fe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1e565e7360d43b8d92ec3a93a1e45784a2b571f5105e5d955b83c243ee1a3260",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\130222f7cb9bb741fdddf2675369485c1e261129c87cc6999f5cc24654fcab6b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c924420a710c68b120950d917717f6d4a9edb76f7dd760902db7c066840457eb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0a9acc6fbb44f82af1b5b96cf408f006a291c99c847635b92303029dc55d64b1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bdf6b2508bfc45637a6b0f603d2df9339229026979bb856acabceb2d78f7a214",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a89d077f1f5a7df21032c908805821c57480879aa4038bd0d459abb272cf42b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9bb49503c768cc417c700e95369b51d600462e3182162639b91252cdb78ea547",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\949483e430840d00b2c23d7e70993b38df2c003d25ca1b0ba7007d72580f4170",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\90a437cf448b721be7182ffe732238e9a733151bb1d4610598fa2fa916c395f3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\81d6d8d07be2d7d460a320d05ac7785b4cb1ff55ee3206e27fbea9c1f23d954c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\98a672345dfb56346bef3adb6486ec93bae72ddd2bfbdf56e381966b2449f89a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\51653580434df80a8b3929cd5eca16135e9e8060df57b7524755f35a70037447",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0448984dbc0ae2d9a633a983dda40e7019e7bdc2771111897fdf4dc14c512303",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\46cb517ade423ac9545789d38603f0dbb4153c7d3838eaadb00893a652a7b536",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6185627421a57b841e2c1a625dc4fd6e6e3c7e3caecf6f1c1f5baf95d8ce28e5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a7ba3db29ebb3a32e6a9c912d6ab5941bd981a0c39a420e6786c70a66babb80b"
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
 

