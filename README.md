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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1a75125a8f34533902ba5ab43280dfee04017d89fbc938c50a2ece5d36c612ac",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2a2a494c02e5c1a7cd2e4007bb00a181aa3394453c27e2ce4ab55ff9c84f00f0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fcbfec5101695fceb927d90bbf103287f38d972d6af164a4d91f0fed69bb5018",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6f8b08a647993daeffcada36589b665fdda5352c5d5baa627158dd5f905ab567",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec94eb4730162bb2402936e0a21ac6e864bc62d4c8e8cb4418ab739aa4671af1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c4d67af8dc879b5eedb032e4dd245940aa083269b9fa692e00982c8accdaddc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d390f940e3ccb63884174b7c64dd14da5d48c1a9c2ad48c8dd3bfe2bc9e2d24e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3b68c783d5f726be1a46cd223bb729ab2ce3e02140284fe065905cf373c061d3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\11a65d591b36faf463ad129d248c81c3fed029c1a226c8665e40269e99b16f2d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d4f20efd1d7e55c6d6c8dddcce6e1a5a3bc2025de54e78724692955307664e2a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f3654f9a5d1a2956e78a0093179f2efce1e1527672203928db1fc805fd3e7b3e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6a53641afc67aa6eb0b9f5517021283eb0ae6b52c1890d114fffa82b70039f4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9e003e9d6017110e772d7f5b519cc77c844f877a8b96da39abfffb90f69b5631",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6991c4c9a823483c5129f40e5925f8d70e3fb8d877378e488d751d4d2ced201d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9dd94a1c1f13dfe0f0ca97d2bedb19ee1285eb5ee86f4580d0ba0e2c68c65a6c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f29326bc0284be4e34b2866a17d200187a6067c9a5995975e19b28bae16eda28",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0fb6cf577eaf8a7b12e11f3f3df2381d3c266e06d08e7cdbc41468607afb2f3b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3d865441464223dad5cc1672a47e2a1b9413fcb1d5ae6335026203ae501505f0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4e40e83af011bb9f0bd917856c634462c612d6509c8fd4481f704d248a12fc81",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2855da54e2b00c43f560fdd54e6f3f36d7e97e6c89cb4605d8fc146f969ce3eb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6053a38af497530e4f078a5c0b8f78f94e3d3637d61675b4f6c6b5a5139f92fd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b9388f1e9103ee571bd4e6fa4c5f10a29088eaa39a48c9ec9667c3f14dad5416",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\370fde29c69d475bc8f5524ebc3d970f05578892bf8dc6951fdf9a49f22732c8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6f73e9fdf92f3b0cbf81c498ea53022433692db6cabe371a99a40ac36eeed22b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2f1fa4a149d2f31d835992e17b2dc3cc53970d6602951d9019feda617e5d4771",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b50f40e774bdf6bcc4bd2bc3f913b2cbdf5bdb1c082d898779554de90700b74e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c4d02418787d264406bed4956f2faccd58932e4466bbd693c1795e3a64d60e90"
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
 

