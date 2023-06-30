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
    "ociVersion":  "1.1.0-rc.3",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3bc251362b785a8af03f53b4172ab0dd1ef2bd05941198197a7a9396c73dca8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bb1c5ab896ef958328d3b0c7961ad887cb6a74658ae15cbb0ff77d3e9eacd48e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\de14331dc5a4e407b7e84f79391dfcc96a5b07ca3d3dfb99bf04b9620c166604",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a36e61fc91ae00241c652d2e590ea6b80672ec9cd90d585157bdbdfd0e2d45da",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c815300007fc23bbf3c64e95005c18c392f92f2fb798c9eddd00ad7105d020f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\12a4e50796e24d84976f5e7798b4dc5019fc279ec03037d09ffca5078f066b67",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c2d93c2e1d15675ac0cd4da9f445ffcb0cc1f8a6186bce85bbc681a3f7030736",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b64c3a85586e9e3cd712a4bf9b2d773494907a1516fa316a8299f8739227542",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f763cf1f1df59c5bfb19367855c38d28ccf3c78097411bf9667b44dff0c4fe96",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0c014fc520e9a3233a59a1eb9e17db7cb9fed3fa54479a7ee4dd60cd7e17c4d9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5935b27c7dca7bb528ebb3c5ff22faf84cb8ae1eefa2645fee747a78bb4a990f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5b3f776c670c9b256bdc8381c8706b57ccc64ff00d12940835b41750894672a4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bfcd5fec20ebd4f6d67c8c1b6b9125f67103be4f4b84a86c800389863a00b1a2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\03351db62b48b370720f502c00b7077853c0c999e309f7a70fb690827b959c68",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9cde7bc20023cab4f839fe9c53547a7bc18e976002fdcb5b3915b2ef127a24d5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\10274f88001151cdf09c90fd93785a4f0da4c92b9d91143cba4c264f6b411fea",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37acb99e74e4c181f761e53ce87b2159847a6a1d0debfac6a9e0f126de318c67",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5e3a1b367b478b3d5a8436d1b2618b22d9d486a1cd6929710f2e5393d0c825cd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0c675021ec4dd58d8d781cbb4677fde801ed9bab12a227255f6a0e8e347b9641",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\abad647703d8d90d9e730bf2d6c67bc0db3f96679f0162b56a5a4802be52ca81",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\219fac451905c38ae2a81d5f17e20381aa42bd58ef131a1a848aee766ada2c41",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3857cf837ac4d8a6ef24befd0d42a58e91e7ac8fe58bff711210fcd218a790d8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\87578f049c969d0974ac11bcc51aa68d3d2018f48b390b8334db3342628d5abb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dba8eb0aa98805143e9d4a2c987c23ed974dea672174fce3d5d4b70d0b13f7ff",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5c35d7547fc4d022d4858574d599da7d845125ea3d644e19b9d0eb6744d92047",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\87772ea38e60b8b077b594f2ff15d49c08fcf7d2c4369e7037ab927a97cf7906",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c63b98004555187fbddbbe8379fa056d345dc92148d3e228b84a2a4f09923ee8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f3844e60a34a464c957d75639bbd82b25c6b8c50921efba6fb67bcc9ebaca28a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d0c782642a70547f9051743c84ef1db0a37744fdb125a72a1152bd9dbb7ad0aa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\afd8dcd1babed6df3c65c5084f204d9c6aa7564001a748655d5351ec9c3cd5a4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8463f718b1c4d62738200e1fd265e89564948f82134863299032542f7ff75713",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\da2d874340bd0ca5f710fcb2bb9abc7423e71287e9f2b87694767375272e797d"
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
 

