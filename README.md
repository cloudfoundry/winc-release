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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\689522d262ddfb4682f838f1a3a20d9565da7d64245f5c874b23c6c74e03534c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d84b12a62ce4341ee8d24c7ac9f16e3254609085426263d0bf7fee050e49bbe2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\eba30f77dfa6ce9cd67b3bece681f4b466ad6b89652bd45b9233115babe5f1fd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\220ff66704a73a46bcacf2ef8448f9a63ac33e72a84167cb3fbe899771dec9a5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5fca4c732349261f799dc64229aa41cc110b7a02872af7bea346ebc54f139fda",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b8fa6e93f5d7513c3ec89af051a2f28e567aed85d2a79147ee3a08aab81e6f4e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5c75743189a65a72b957b3114efa12b66c1754041797a92e4f1861a75ea481c6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e8cf127229e9f13a94dce46a88c0165b2acae2a67dda10748ba6e89b6bfcc53a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b74834e1b7ad99e7cbe7728ca61f523cae728afb86dc07423a00e662e529cb0e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d708924cafe7b2e006d83d9c28a178900944b86cea73ce57d8985133b96429df",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\afa646a7930e25166e6b0674f3a89ba00ef33f356135f1a9525da2ade2c597c1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ad4435117a7b01aef15e4574a6ed6bbafb5d8878582e57001dbb8ed4fa33bb6a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\11a922c102c30c400c573f386334e3816f6d69e272cd9a508e298b1a784b0959",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7a02d167aceb7b71cc1e95b4d578e5b2f90ad5e0b123f7a6391c0f13f2c5e18a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6c278f3e48939b9567551eb7220bc75f8a574d3972a382d7c7cd372171bfd458",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f185ab78d944892f0ec90ca22d7b8e7d609955d62529bca4731e48a23da3a51a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3c9c8effc449fd46d381242ba800cb0a6d8e7a485ae468089dc38711de194f23",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1f5001bedfc1df0a1c46e59e21483dffd28d2997b1a4a2178ef0f232222d7384",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e5880ad409d36b461d93b1db6b8bc2386482ca841dcf26afc5a59d40eabce80d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\acbd1c2bf0e39571d684664fd1fad36d93f1c1bc361db339f8a06996945402f7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0c1c2b8b75674388d542b10089897d5878eaf44f08d8074331cf1e09b13629a3",
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
 

