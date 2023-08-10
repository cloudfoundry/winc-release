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
    "ociVersion":  "1.1.0",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8d5c8d8dcc07607948648d7ec3ee0588cf1130c2d3793edc67bfb39f7417b1c3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a87d28fa6e62f9b686c6473b8c99e60716c6d4b6649d0c6eb203ead2582ecac0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe12da79c36ea62b4170d47e7c661fc58756d6361bf244471def4f2f82fff485",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a68ec3a644d964848816a219aea138c7b827c64c233acea69fbab3135f0f946c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\eaa49ebcf26d78772f7efb1fcd1e5de717056c4f22ca0182961e28ecc5712b91",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6bd1c10aa692383f55d32dcc80c403911b7eb897d0f42ca0a6d082053dfd430e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5fe5812a1dd9c5c99b17f069e22564db9365493ba218dd021f0dcd6325e7c789",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\564c94c8da43754ab9a2fbce3552e87ab7619d9395544fdbd1f7da653e607ca1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a75d9ba5759a03f6974415526254a8aabe513972113da74c4598f4864741b8d3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d645387806c5b0f6cfac1e962cdd88d4b3ea0e8be2b28246af1dc723a65847a7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3c34abfb27b996db2dcf1cf4504454f1bd59d6d02da2c20625361fbb561ed88c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d334289b038b54386bd346d7bf696e427e494e6eabbdb68311646cedb3e2670e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c0c9c7a2ae6e6a0578831a5532e554a2f1fc5a9cff9267c884373be9aacf0df",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f130958b731e83c989c7913567d885118bdb1e232500ea5d6a05e290d92a2f0b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\84b5d164c6e5c48b3c4af84d353fe457b2bf17d5a4b89439c64b3ee5ffe09076",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fc538a4170d3d655362d7231dcaebc10b3e6afad30fd15900e26b112a74fd624",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1e711b7dcd2d0cbba63bad258fd055c00ffabb5e6ce80efe4ca9a76d34e44515",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8e5153661faffaccfe483d27e2590ca2e932ff3d916b621132efef457c7844a4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1347b3f6e2f1e64248367b50d7899174e94c4e2309847984d6fd98a75128fe9a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d26d8c50cfddd0903fe8848936729b32ffdf84ade15c89f01995fe35e459da5d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\208d03e4523d45254076098663dcaf79aa9289488b0e4970a72f10b6fddd1cd5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3923549aa0394aff6a749fa7082233e9e1c4613eb9efdf525baabdb6079d559d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2afde4e5da8c5eeddac2651cd4192174e208c69017356a1752632a37aa55eaeb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\19cd85e02c3c20670f4fd2232bf26fce142eb55d042849859d1c009321eee8da",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\306bb546f3830ca0a05360ec3e83e6c1a1048ae7aa3797d798146ae827088181",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1456eac10f051616ee42cee4a8870f92a5b6793c6b7c4fbe373a13c5f7c9bfc1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\50edb0eacc1ceead8a8b8800f072d0c054f26eb479b21add3e3f83977f3fb03a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5d012e8238cb0b32d1b0605266dfd69ec7051443bfaf93bae17782ab8f896a00",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f01256af708f41a30461b43faace6d575003e3f05229bd8db6384ac3f5fd871e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5e7ffac1771bd3b8564dc70b101c686710f91f451018b2b02320a04287c1b1af",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ab4ffa5f4605c8e0928e7e58f63c97eb517dd415abf2c6ea5334a99273d2dbe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bec3ebbc8ade361840806c09222c4470500c29db9baa183a1abc046cdf905e08",
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
 

