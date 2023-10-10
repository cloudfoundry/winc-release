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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\aacdbf560457b16fed6f29b776a3fbcf825200090427b8f4e0d1493f8ffb771a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5fdf3c459b782455e83ec622d6e686d54042a12a5cda6b19606b4dcbdffc7247",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c27c32d371ec628db6982beca2af590030a71819997d4a9d32bb3735a16c22f4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\af2a56e069e0f54039c90b18970022fa3ebd98e3372701b72586903512894f13",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\000a70896b005650f590ce8a4c70557d87dea331caba5983d729590eaa5584ee",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\662b56221924207416a78b1fb0edfeceea483c8d3517c573207b6ab9a12f2710",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\26f2f2651dd1cf2b34dc08016f59736f69b95b405325fee072fceac6344e0a9a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\15a23824025b472189c605f2e82d505314165d8c81afb2e9e7367a5c25a44be0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ef715115f1e06328c71767f7e0453f23abca4ab691c4f63975b09051de67f53a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\194c1edec20c71c68162869f0f2735324d1e76ef7a29406618e754eb4e92b790",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6aa1336363b1a2807b424da937a4e059ee882a2a8e55f69b00167c5950b6a5c0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e976aedbbb51b7a352c2c7c216540677fe7915a6aa4bba0ff58bde37c6d07105",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8ec5c32ef5d7d5c23faa88911263e581d5cb0ff9502709bc16f7556089c1811e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f60475991146926578770005bcd0a94168427cb5c0a369792b913d73159fbf7e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d94bc49549c703a278850663012740c9439d59b5584943222058818f96b8f12f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\98fde9aa8f6c8c7d9f3b8342a287f11fba6cc5add6b19d68436dc552a7cf5f6e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\18ad90ef75c06151ce986687922802fcb79fba0571ca04771baadbd4e0f75fdf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\26d57d5d25b4c890d2f6442837b5b04c72966b0a5d705bc69c1488ce896eb219",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c2e4ab7b3addbd4548faf93fe15e4d4618c93ed95fab27d6d3d9e65862d0c208",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5c5274726967f4cf7bd6cf3b0d604e986990b41e062aa88ef1eb92b2418345f5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\218d19eca9badd4603888e65b2d064a43778f5b5f88a0096ccef0a23c8894417",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\58e731410d45dbf04247bd21d794e2b2a416398b8c5c569fa017f55d318f2836",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6eba1678f7ee0db0d22dc61df54dc63348e88bb6480f9dd483fe98eaab6f1b37",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ecbcae8f941c86dea498b66fce94d9c0354bb42dd2c716b5ea5a6375d8a17ebc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0d93b6968fa838a420fd19dad2924de3912be29182ffd22daced7e1e11e8aab2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7686ca077a479e29a09d2a49280901504bcf0f097ebe0bb53a7b4e25c0a8b358",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71d955a005bfce03f2f0eea79fe04783ea38ebe9e0c0c29ca2b67f4842b39c8f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9536e5a290c474d5a92455c6c5b65e7c2cb96b4b92e3c43596d14307da27e693",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a815d272ae738961cb74873d462efc44cc016ffef682922fb7e83e9886b70230",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ce18f5e4a1aff180b9bd8bf3fd2b0ff1100b90b76df127b356cc817f8acc7bf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5046f9a7ad3692834240c1b4a8317ddf15e9f2aee865131ea6dc977c02835429",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ed5d08b08effbd6afb72bbf9842d4d9ea7a1ed6ac50d624f11c6b666814fe707",
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
 

