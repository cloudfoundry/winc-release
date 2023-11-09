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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f7340191228816f51d8f08366ca7841003c506d4abb4eb7a957efe18abb982e9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b1e8b4274938f3c0aedf693f6b1869ee92254be26d9e0e3a763cbe8d037666ea",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\821952ea73e9e263ecb164e162baff0e8d877c21224a1d60c7f87191e4b6ceb8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3450b6148f3e6bcd0831f20af06cbaad7d27c0877f0517a20c6207152d2ee57b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\860d84aa60a8387e65dcf644d96e3ad3af150b29b448a059a78b5358ef64b4a0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8bdb7a265b8396b94b6d444c157b10593c55b0ae37cfe25067584c89e93ce75d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cbe7b130aef656cde21fd1e47a8e230239a32800dbf1dd040913d50c61562df7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f058f2d7d9a6a6ecacc6ed97d133def57c37be2de5c28614af1010c09b9ecbba",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\16c9458b7429d748c8ce54dc6c740676ad8879550557e33155f904992d0e1462",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b5c449f5086b6c35ecbaae38a765fb39486199b074b094ef0d1707615ddd94c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6803eaa3f9af06c7062dc17b7ac8b209bad6861880d943bf1fa4a004348e7f13",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2f94ea31391046fbc56189cd063819b58f7b38aced3d966ae5760c956d6c249e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9d05abe90ef9c8d25600956b762a5e8ef60534d5b4b9c0a1b2260bd3a8a29f34",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1f98ed3e535f40d156fb732d0a268bcddb6e733b44f4c364e7e89d67879f26d7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\49f75419033cd79ab3fba77818be8826cbcf1f925fef86bc222445fd1062c584",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f4bc507086eef0213039db44c4999d840deaaddd0124754acbe1e31264119f44",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\abefbe78b1310dba3356fb5957ce80745e841a31f78eb9b746f344cbb60ae0af",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\705b8fc18752e7d86b8d1bdd2d31907a96029867f615b4642ba8c025326e0c78",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\357d8914a9f2c15040bde7ec24e509a38c0a00cf53309c2e6e282f7a8e23a12b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b1ffe5d26e26b6b684687fefcb94c62e0a911a18ed149c3fe86160224eaa4080",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d5d07e5abf10c1aef37a4b3b8d48782ad4a411ea6952023bd0c425c7406e23b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3bb279c8a6c4a47c1a1f4db60f5870696413d4c6df8744d76569aa3a98b4f10b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6edbca88c6be07836471ae44ce112f94f103fa132cdb85d9782d1c65fecd6539",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a83f207aeca03b317ec7dc82f35345e23a9131c3a5b00921cdbf5c13e3baf3cc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\45f8aac455df16ce83cbe2a476ac74e36a5e75c10916b99b44fd2e2a3318130f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\65483ecccedaa3bbc1ae472782a4ad0f6e4c53e212612185838ce5e5e421bd33",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e28a05b5bd7eb915ac16a76d0891fa5289ce517a8cf7d0ac597dd0be060a1268",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\02cd5728e9919dbaa9eda84578a8be25a1df3e9d6363fd40ee901932ffc982a2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7aeb38f46df59a48cff90cc67299d38c7aeb3a7e2b8722652c0f1341d928cbe3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cd8f597945a508e5e9c001f6ddad4c393d00cc5ddfdb4f9a5044fef358f9c3fb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6633bfd7b4a1920c569c3c492bfe74af735b11e53191c6206f9039be49fbc279",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\194e2d79bc311463d22dbbfa87f9d3151a68a81cb566791f731b1605d7fe44be",
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
 

