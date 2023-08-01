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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\831b9da2cbef1e7af45590324012900e5da7bc9b5e823de2af58cd8ff3aa755f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c8a414170f7eb09b6f3fb711368643556733e6fe320282debc14305c7830eb1c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7fe2c675f0943a4e0b42d07a294f720e0b7d9ca5fa23dc8cdf0633e427cd3d57",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e76a8cc4a87da796966a28bf35e55f77337cca13952f58bce12908fc0a704874",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1ba26d31224d746ccb253625267a81351588ceedb1fdb40177907c1078456d2e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\56e113aea3a842afad809cf296ead43eaf0ca936d97b5b26335156b0407d0e4a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3852eb1505820f5fd9787edbe42febaf91b51e50c2aa3572cde9e53c0b60fd30",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\76eca2134b5b1491e0d1a7d4e8cc9ee2ffda9e811b134693c4174997309ad46a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ac1d7be37e8147863481aaeb6a6a02d05334c3ee737fbd44a394e00208472c1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\58711b1361d7b94ea9d201c4d64d57a4ba0add7021940f5d7eb89cedc19044db",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\748ab623b32b066d0f5f6278ffc61479bd43f2bfdb1762836d06d5d7fa4eaf9d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e127803b1d4587f6dcf24e44c11bbf4cef775d85f0fbaa54233ad8e68f8ec36d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1b9f863c37ebfbc50dc26115f7213136fadec887df811645db1690d1a43c2137",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\baa8d2df32c7b87c89037cb1f87825d3157e4bc3a99e73e1191a682bd9883ec2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0702c48b79d5c4e9de77e3ed3cc0acdb3724840d473ae4ba54ff8f86d9fdf7ef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\85091e9292640542c7041a5bbe48a8ace38648a6de856282a2bbe7106fcb504f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f0b1e4453f40b01e3dbf927b705f4ced3f82cbae8cdd8b4f977b685631127013",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d52bbc6dd3dd0c0f124f93fff4475a1ebf4bb8a0d8bcb038698248cc260eff58",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e2080f01feeb6838cc0bc3a0475d2e6599200996b3957f7b159ae9473dc5a141",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\351e8424b3a98b51ce9512c418276fcd863dab12f66a800a72206e93e5763d94",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2901e9b4599a1984c306da6ec09f024fc9fe1b6e472620f9a7df5cbd368b3628",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1742e60e14d4dc1b8e88bfa78c998011be271fb5fbcd5d6ec51de64745f8b06e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1eab7e0bf8b186c6d952149a96bb7c25d9bc7eb6bbcdbe9faa72e2e503a9f7e6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4b0a00997eb4e9ea1b9733c197fcc7c52b097f86f6c374d004ed6a80f0d65f9e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\84ca8d6431dd0847f26c8425fa260517d847db49abf08f6f6a3bc02e0de653cc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4613a513d50aed2097c735dbd5724bd1a90d339e49caa3e9cd6ae19a189a1f9f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1b772afd846ae911d5af8a1274f83ee1ba94fda453abb75e73dd7689577e7e6c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ac115e1e94acab2da69c1da3530adda0b5d50c9611c7dca78f6c14d23ad915f8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b8a12848c63a3a5f6ddde8f48bdaae782197dc93d83c019daf7b11d75f66652a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b24e4307e50a91eb544dfb03b7fd773a6bac9810833dd37c73f5dd5901c9e6de",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9a69d1879e3c0e9190794b53601b286b2b871de4ab953cda497a50f1a4e3007d",
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
 

