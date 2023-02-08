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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6a7d9551314288a1244ba7555b504f4df0373a5f9291d81f51fbf33c53beda62",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5b8c8fa7255d0dd55bdb9f61b1b325e398f123ccfb8d8ae503cc8b4ce3b6af11",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9a9c32182b2dc6fb57154f443d9bf79163934f1e2195b14dd2e1f0877052818a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\adf5c2f30319cda8cbc71db7e19bdf1cba098b2611ca08e5b5d215240e10cf72",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e7e659e13b4d48dc3af99809ba8dcd147309e8e51b20411dafb60c28f04db6c0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\755cf8192f74db000e0b96b1265389b997a6f2c7290d026fc40c677a2a33d008",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\687c7e53afb235e57f832b39a2e0fb567155a107769a442132e19840234eb5e4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d98ea4f6b8c5478b5667014b5241fab3a6a93860fd09ae25c6dec2e655c4ba2b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e372f081d7ecd7a205df66d731baad302ab84f9e782dc0073ebac60c467e580a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f81382307289c3751a4901e9018beca6649e50d3dbf960038ac358ee525fa58c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1f7c90a1d205fc5cea4612a70f91fda18b7dfaadb68f1d5ce06587ec78435890",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f952e9d30e378af0b73bfd0daa9f40437ed37727b80d59dad52a86a12e641295",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\048a36e41f86e29ba86e10f7c0aa689cc66e96e225f22f23d7c553a8185e5d29",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0bb403e36a6d204c0445dc3db723e34fb8a27fcb4ea963a6a729997c26010d9e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\809a3f41f437d396b793f8beaf053cb66c08291123d195b2c2057ffb02c4b484",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c7c514b718261e1ebe1b83e147f2fe90f57f15f8036ab2ef8fa118a4552fa8ba",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cc803f4fd01ca02e7362073b28fa72a202aa544d28c766ef72c4ee0dd15e5a7c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5cf246119505e030b8d96ed8c50e06fa93a7ddb5aa959abe54583fcd658e21a1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0b4b4d1cb712bef812b1f7aef91a646751555d9879e8ef6228f6448f5ef98faf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\04d5c7b4fb1bc404a4ad034ae3eea7f13a55ff8f90ceba3b5b5fa206566e3f90",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\64dc6faa58e612b2e68de126cf1ad59301803c2208a5b4a986412c49447becbf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a7fdd2b06dc4eb6e496054362e4191cb95fd372d0512dec7016d88be2a9d35f9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2be5245b9c217cee660cb0fdb452da50552a41686e26771774936ea73cc65487",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cf7b41bc4228fa2432e49264b78c23b1683fcab65c0e5260029978e655d213c8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\25239a174663fc4e69d9c3f860916f920b892086998c6c5783e32c3aeb09dd06",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\be258243564c819b1b0f4ab677456adb5b1c3417d4f34bb1025538912f2a5154",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fc8c8f50572c218d570abafcd452d855621b3569b925e2db376f1ca32d7a3a4c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8869d0c623a5c239fb1bd82248dbedf3d722c21595b0eecb8c3d6e92c37dfe29",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4e49f222db27fda1ca9f189ff53b8a1e751b530f1983e8de9abcca300cf62764",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ca57f7431112f4e66865a8df569f29b2d85b31a3f2e1d99deb60ba3c4ae57830",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3e6e3f8b10798fd78027341127571aa263ac5dd10d23cbb1d7790c1f47a556ef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d37190a40e909425195ab8fcb1db81a2edb6000c4331e2c56afeccb5fb18a1c2"
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
 

