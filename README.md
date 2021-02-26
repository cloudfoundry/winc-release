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
    "ociVersion":  "1.0.1",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d10065981468bd33fdcc0ae74f9f46d10f777e80b9979a3526013d8d876b8219",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5434d87825fc91b9effa76a3e447decc7bd5adca1187d1d821d6cf025aba2129",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1c6aaa4fb0d04b3777de560edea677285f14cc592f845ef48638a0e8390a5683",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bd124f183b086c0aa21afc2d77568015dfa2998e7b085b9c08edf78124e754cf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71a7c34b5d2b7cfd6880a5b50101d0bfbb9731813d826b34b3c715b858626514",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e556dc5581fc6f32be4ffcd18fcdd15ab0e31b4fdd20be6f800aaf383d4fc94b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\36cbe77e9741320e9e280860fdd7b12d01544459bd74a8e405377bc023f80971",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d0a129ec172db8dc3a6901dbec6075f6806f08fb63746416744570385dfab32e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4d7a8e42b0033531d073b7672b91a9e6b6078d07abd2375cccfbebc5e49bbb53",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\52e140d32adcc34346f8c5b8bc29b41ec82841998944e425f4addd69b11adfcf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2741915c4bd545f0d2394ac4661bd1b065962e301b7532c6793092a908906ed3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7e9db93f5efa8f3bf99f226b80c8f25d766525524ebe8581a571f795a1b2a301",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\626d76c6192eaf532c3d5b85c6721d928ca4a092283385e266c9c0b112e2d68c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dcccfeed00736d168005495b264cb0ca6bd7b500b9b15f237c9fac6ef0f89c02",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\019228716c7e8423e6b42e42d462f99b8762423d78b89d845202a4ddfc1d4187",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ebc87eac5d3a5f026fcbb9f948bb15c285fb0d9154842b2aab85d27e8027345c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9378ceb319b491c9137ce2b3a8d9d3a05e1b7b0688d005d88ebc8ecdc87c0247",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ade460f55b3b161accfb5fdaab1daa9af5f5d7c7545f80c4f57e94fc36bd590d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e8dc813a8287fc66cf5b0c46853f147edbc24cc2119f236af72d508cb679eba1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1f692fd55cb6436f56dff73e77e5d9fdb5b00910c650ff97cc5bfe87345559c3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2f495b0c57f5a43405d82b94a6bdc8dab75664eb5e4aea7d222be637614fe117",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\162f7ef8deb0c44a2d0eb7f2f8f4ecef28649f210e33cdac94e6c81d041f1dcc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7ed121481bda986828187a4ff5f1cba830fb23f196ebb9ff734cd48a6fc23f93",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9be57c6b302615631f4ab1cec29f7032396344ed2777024f560a87863be8c90e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7dd42d41092867ebd50e63ff745a77676958d9616c44f5d6fda51e2b305db00e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\64da5e63e1837b7205c16dea8c0047f43d483a449bcd8552f207c4f6bdecfe43",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\25b3adfc207e80971ef0fc4dab1784fe568bdc3e8513d333985d055967b2deaf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\af38f1aa5d3c7a01cb99158dd8c5320e46c8134d6927a9d495f12456fe3041c4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c831f77fed5b1b76bf0663afc1c9faa21026fdd69165816749983c6342d91bd4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71a9e520f21057b1034d741d39c7bcabd488bf07e7edb37729692988408af3af",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4055d7176f31dda5c2d7713227bb6d196b47749baa43a886c27ecf4686587a56",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\693d5f5da081c93b1d67eddb790ea22eb03c504d13f8663609ed964430d2866b",
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
 

