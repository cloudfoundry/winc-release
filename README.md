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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f56eede008f66607a5850cddbe8990ef0bae33ad1be8b7c77db6ef1d64cc8d41",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5007e39ccd3dc1fbf0547ac1b3c7b1aa1d82bfff17372810b0aa423a5604465d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bf9cca8b107e2bef2a45e2df0b1f707e61ebff0eb8b7dd6e0fe101660bb6b242",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b08977f6abad0e2d52f51909b61d5513ac01302ac0f7ca316dc48e72c8d44bb8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9ddd9a5ca69681fdf66ebf08d125e6163cac2202201257ac5ed4983859eb5d03",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\240d67dbc5e03b1f1f6fa989eff545cb5c17386843b8f47678b6818f4cba9d35",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5eba2a85e65e685805732934f3ee0d8d8bd653cd2bbea7b3eb9a15de61342460",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c727b330175dc8a68f4053e91dfc150a23ac476d54813b7bce7b5bfcf193236c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f07e99f95351efb6e990e2b92dd827ece3484ac5d1dd25fedfadc941bee6760d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1d5c4a43af180a13ae83e189acf2283a7e63357f8e0b2509c7e94352c5ae4656",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41372ca77254ab2416872c68db75f8309ab3cd29d4d82a1ce61f0899c3e036f5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fa2b6b738df98aad7f85bb639cdc8fe432a7056b5ca170e12881c8b439786a4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0470558816043059394c558a43984461132b3a060e36a79eca17613320a07c7e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\719082a104456543241b9c08ceadb463fb23ff664d2c56d6a9e33579fb7bc4fa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\441344c04479b98db0f96efa45bb7f4adfa9653c9d0975be7e0aebdcd63b3621",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e843d853b3035e2396ac1117d05906c6c9fd6943febbc32d9d1c2275b7cbd040",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4b437ba560ed52dd494cf271e5614eb24625efd87cffd532f60d6606aa055c0c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b0081201edce116779f47072c5eaceeed5ea42460172b6b454f6fa8802b27b89",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c2d553e93d78bc02651dc78fb4f1c296b949faeac1adbebbef64dd002e2866d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c79e7b898dec86c39b677a5ef393a6c5676c03dccf2281684ab10917b846ceee",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\952a82921e4eaafbe8878ab040d0b7e27fd5dced38a3c911e2100967b8fefc1f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e0fbb70c0aef40a1a3238b1555f4bd9c119e9fb87a75586e53cc8e7a2b370bb1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7227a69715cdbbf3b3b50fccff9f2311afff08937081e1e5c4f5f3022f201364",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\30ce137c951bc5539671b568cd93c21afa10407d34042ea5a4b4c004d2d1839d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\873fd804981cd5bf958b18cbd3ca11e78b6ac1378cab6219657344a70a2b3e9f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fb098be6ae21dae5e89b94d1fa61ec4633671a831fbc0417db3f66ee16c15d05",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0c79c01c3bfa34e399266741f1aba04a185e90e58a4d8356d8f9c9c54c0052b9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\27c28ce0dcbb841b9558ec9ac333d325e75ad664474e7f8895ef7f1e6bae9382",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\436782b6744295b01381e396f7288a31e3cbc69171fcfcb05071fb3809ec1b5e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b78fa5b105a83ea4263143ea387c418f04e173f0254ae783cf26b72d59bd67aa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5c9dc8a09f9a3e0981d8d07e3db23c5893a8189a5678718fdf8ec0b8abfd6c36",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5ed4877e3a837351dee179fb05ee12be51b0aacce8a8774714a695501b3ce5f1",
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
 

