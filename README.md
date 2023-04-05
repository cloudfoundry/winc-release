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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\444fce17f473df35c936abe0252c83627ff23c878fcc9d42214f42079b7fd020",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ee69666f4e985e2195be5cffb6693909e6884d249c82c309deddaa6d7e4019cd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9c6c8af4e287506bb4ef9412c12da5929a8a689fa6408549058b0c450f69c182",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\67343af4e3172018a744f3aab889b1d6c00cb83e098af3d86b5bd70eed864c57",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f7f65f6ca7b6557149413edb323beedeb9758dc096c145845b46373ac88abc5f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f48e4bd6b0e46d487de67caa67bd8f4d9e5a81d3ccca95f43aa8a2a2b6c02f1f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33e5601dd7c6da92777bd399573f72c7bc35735dafcbb567ca0fd8046e30e100",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33211e6fd69a7cf55df25b4ea0264bcb4d257bb2099525d87fc415a2581b16f0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\08dcd1a05b750c4b7192171a09e125d5b8b4b700c909970a12fcd93aae20a44f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\59facf7331d4bbc39813c060dabb373a753cd2158d2078ef2109bc9402d6dde1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\72543d89476baa7239fd284d64919679551b67f915242668b21c79c34531d481",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\54711f84e88f7dca410649339696b9600770c8cc6ff86a15e9dad4b8565ea3a1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71196d9f80dd3f9ced467cd39d5d41d419cde0c93f88cf8ac1a4e25b5e17b1b5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1bf437b228706c0828c748fb5e153fc0910d0733c6d2997064238512e0d11437",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\13d43d3cdf827955f2ac1f1fbe440e4e44ad2e6a24feb49ae362356c5eae4327",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\94b5dbbddf249888dd87142e1054dbd90b468609a37a1e11533eac5a0337e790",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb8c33f4abde994f19f84cb0a90194a1f2c79082cf4c4c5033b2004a1092f6a3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\46a275a0f8970502b2fb31b34510a34be9dbeb02eb9b4c0aee3a3b72e917a27e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\174627bc822c0ae084dabdcb7c7c62cb85285a06eaaeae563f26238f822644ce",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0512b6d3a0b7fd397a26a0a8a4bd0d241dbd12d7ea653d7856be81eb40a74483",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6f7b1541f012d0425957c7b0363b4ae063d7dfbbdcf317c111a5347d98971992",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4bc8c838523e95c8bf11e783c1ab72db6fe8e791b73a45cb1404e75d16863126",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6236e207626c44654cd857fad2f64c511ccc7d2d6263a55afa1c15bb62075b0a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8409d3a498d82add69a589c35132df700413803025cd2d84bf7a7bcd213e70ce",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3f98d699d1f7eff823d1864c80a74261f97f4364331cbcd30efe3297bd3ca579",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4bf618f10cc4202c66124c3975249a0450b0d528b3ebf8b51c2a50767aa3dd9f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cf4ff068c45a58d8d0034de994575b59bc3d5f6bc2bb4415cffd8d134ddc8f82",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dd5cb0269427ff02c125a7272c2c9a3781262f2d0c2566915834878278b81304",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a71ca496d5f1081ea8916967c272ce77f290fbefca1044fbd7034fefc7bc0e42",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d6fd1df963dda277795bfa34f35e208880defab0bccdf4250d9df5222b0640f2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41ffbe3ae5eadea2464f2de7989a3bc2649d50091f64e717d47b868afc39b487",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ce6ff249d1ff388147ed53d0ba1c446daa487d4e87d12fa93533bd288a477ea3",
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
 

