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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5520ec938574c9ef6735245ab43466b182ea1f9618f8e90906cd9c145c0bb4c8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\602c6bddfe306e7088d2eb2bd0e37f0124aaf4708c8f424c2653ddf854f16b8f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0abba738b10b31b69d60743bc918def9e52815c492ef753aeb0b3593b6aeec88",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\99b1412aefb92851d739710a67b1590f1fb0f7de026e72f0638e412b1c07fced",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\883c7c663fb01f96cb7455efdd08d98edd05afff79d67e74f72a620c543e5249",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\187f45f3151cd5b2c256c16cd6ec692f55a1c9a1138aee319db3548131c3063c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\91c28bddeda6c6a0c8aabfda52507233699eb0d2c148efca7dc1483072cc389b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fba079d04709c7e29d2efe0f47cdab764efd50f83dc4ab09068778ed9b271604",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0314257c985b22ec8644ce9bfcb976ac78ab08756d5f45ee71f9f2fd7555f636",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\245429fd694098eed2eb1174d626ca0c61a41eba460ee78f46cf96ee367230ff",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\da73e995faa0ffc63733708be061e52c29e6c4d1feaab8631d9d5d8d3fb88650",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c5424afd0914f44ef5f7bb19949a68e66141cb585263e67b908f47caeed93ca3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a315dabee5eb5540c7ade417dcf74169285a11dc743f9d29e86800ad12ebc91d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\12fd7c224e1e38b889224600236a610828ab1258534f3630ef4e360e2d80d272",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4c7b61c850833481881e3298dc3dffb4cfb484a626c816da69f63b00a6319c5b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f740c9786559ba7b63bfe773b5a053d918bdb5bd9c220dfeb05fb4587e560169",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d73322effc0b91a4645bc853169a84fb497d126cfe8f1ce8ae68d4fd2e46d8d8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\07a0473c467bc2e4c9a12b05d8e91fba47960a75ee90c441441a1e72d3731d97",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3010f36d138ac32c57f0bb6365a33b417a7e643f0c710e03500b7609ae095fc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33075e87f54396a6c2560f021ebc7b1924c06b1e27fa6ad277ee5479a887b29b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ba2ba24c5c63cf84d525067f622d8a1cd7c07a2acf8823cd54b882a99bbfa2b2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a7da146ea78346e185ceeb68fb00fe7f3525e038e35ed55512166560e84fda33",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d1ca7595f02f60d1e0fd26fafcf157c20513e9c1b49e782a86052dac280454f9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fb7cc4d651d1ab1358b3abdb7dfff89c8d93ffadf5078c7ad34e40147dfa54ce",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\47e42fc90d48d46b00ad08758c32560c697f271c2b7c148b0ab8a09e84ff37a0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\26c4d4a3a5f0154d878fdb3c48ab154c8d823ae0b0646157f39c00180107a495",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b8e419d29b9ea19186e01e811fc739523205e64bb9bd154169ffaac3facca8a9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\abf89958db7ce57b6f2fe5e84ac93ae16c13747448cfd537de8d2f2ef45eea98",
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
 

