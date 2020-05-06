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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec2c428b9867ae6d7ea983f7ed92049a8f77c91882e709053fc6a9df14da95c7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a65ef1a20ffe558caa70d75a9067c8c8018efe95e028f123fb6c3015dab6a93c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cf520148ccf4326a9158c82728b855a9b646daffff0d98b4386bc6082eef9072",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b32a5048a02d536326cfc6a69d1f13e967fdbeb6fca9ab3c5c3b35c9a035e3bf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c4fc2aa8858525084cc09f3e893a6472b9bdc9f02b1bcfc674a4cfe691689355",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ed15df8c207d84409812ed13d80c04123c5a54fad4816a02f79932ecd52bac21",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bde25874078b898bea25b2fd86452eebc05f6362c1a6f5495d6fb6ae2506e74f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5734bb0f74f1a36d87012a19bcde046967d71f64de253975b2790372935f79e4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\83be6fce8afa0d92ef9636fda26f5e3dd65973ab1cf4eb9f0c723a94a5ed0ade",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3d6e4393e81a09ec489e13a4a30d4d00ab6766982ce17efe7778915334cc77c4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7e32d2b9465c2a02e9c76afcd6e61b92768baa3d5eb0c5a8354b90422111c83a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\936d2f98630b314227f8ec68bea7ad4b9d248c71f3f2509c56c61d008165edc8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7e9ece51d2f16d50f6d61acabbed2918822d79735df102dc04bf57e7cdb1bff6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\589c15e71dd571b386e203f56cb04dbb2944c65c6b12d0111faceee11b4623f5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9b0f99623a07ee41cdd92b3892c0608790a92c2bc01cf8c4b08cb00bdb6d8c7f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\40a4a7ced044d925695c214e7faa01972469286417fe02526ddc3b03aecf0b05",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2f724d18f3091a581fd720a7730054f2312007283fade4fdf35c42ffca9dbfca",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\64271292bc15a773944702ca488b7d5c32cb6905b58cd8bf3e62b60bca44568d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\677b1746e0e84f03cba4f6267882f13c6516936cd6ae8d1ad9df0455011c2b06",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5808c1a5ad13c47227728111b0d959be4fb1d3cef4c4e1caf0ffe4b66ad69b03",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\42aaf5c95ac1716f6a7262bace9fbbbdb47ceee0469f0b1b05cf50acd0dd3333",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\121c28535c21b65fd59e3417d8317168afd00e80737d0c011e771170e16e2c1b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\05a63109bd1cd33c873b17b730a068b65395545ea2069dc863c7373c239fd0f7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\39cea971adaf7646abe87fe19329ef2d8602422aa86cee9773aee42c0e278e87",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a50d7636f0c8ccb266656166f7cb539b4c715071c6a91d4cf7a28e0fe8698be7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f16cb325a0984feb34b5fd325ee624b7d3ada11d7dc16b116397673523beebe7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6f8078a5d369cfa2b5aa2e9ebb28d7e4987723a578308f3921a5d2a57d216a4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c47d1d386c024391310a7614e6e8f0150f01151c2d5f4f951580c441d12ed861",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2dc8df0951658d941c26261763248f6ddd28f1121e167c78281102b916baec1e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\14e4e9b7e212d863894eb4e9d787cab9b16051849e2f8540ca1ba24069a72620",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\812ab2ef36bb4c8fe160ec71018e566e403c1abf0cd0441e5f8338046fc97487",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4b668ed1e82592adabd211e4e721763c8e6f1fd6f8db0c153a054f6f46d61692",
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
 

