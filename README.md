# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1803)
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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7fe7596df81f1344e7f27eb1b97ffe2180f3765c21387fd8d0b7e08a95ce8c30",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\136b3651a4afb87df720b934834de0cd1be1242492841957efd3f0989266a2f1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\92d40d93e2f03023448bec8d5f6155febac963fd9074e9e42d87e04cce364d3d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6d1614010bfbc290b5e2c7a7efa837a3a9eee1a12911569a03cf7fc9fc97948f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\27231565effbf1274aad083b93e75a131e08aef5134da15186264e24916ce968",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3d9ed13e8c1b7d718b6f8ef4895beeda3fbec97d01da7a33f7a0c7c243a49e35",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4118e4946dae0e869da70ca071f84cd9d0132d0b77a57c221409eb7ed4c9fb6c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b5d5a6351e6eeee0a4505b0fd6cb975ad36dc84fac28b858e5804ac5cbb8c8e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\296943b76bcaee5435eafbfca8f12678f3f8d0218e26c87d13ec0975109f0931",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4c26f4d8eefd99b914f1bab6f323d2c5709e1f3e3ca00aca76a9ab93be1e0a87",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a37f64252c1e46678706bd2184d61cb937ef1ca3c52ede3acaf00b1ae3bee57f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3cfcff8f7ab1d2341e0bb7f360e4e4be44d966b902f06914155624a4a6882b46",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ef18c98836b33062e9ec55f06c9d6c81fa4cdb2956f02679daa78fbe1472c722",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e00b2d6cf54682c79cbd354c8ac503439fd317b5d5a88b8045346badaebe38b3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0b346470e777438d23f113b1f1956ecae4e6f840761a1fbeab5ac4352413dee0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\35c983da78672998b50742ae423c30250cd4809a95e4c34966300f80a4413fae",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cf62191f7906fbfb919df22f2f5259f22eda9fcdfcbdb2bd2d3bde1aedacfc78",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e921beb965af0d13bdcc6d683e5613c5a883b913b6402358fdaf9f432147fd5e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7ab40253c3fab19e761aaab1308ed7b081b1775e0935dc16cc210985c795d14f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9a1c18b0e57499a183bc21f7ab2dd8bec2bcf69b32ba4cca19785ace1737c7f6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4cfacf7ee8386080be43d654159289e5f96ebb1127afc14f1649d4f95d37dfd9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\70bba925263c1c193fa7bc7f79b1aa062707b09fe7774c7896b8aaf091b901a9"
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
 

