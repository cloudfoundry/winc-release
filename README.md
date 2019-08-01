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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a07954be02c74b4cef25bbe5e7d9fabb0d5b74f1aef68b824d4e1ffa14e43e5a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7d9b7162422c20918eb97a77efe98c7eeed9e004aacf9002c6897b54cc338ec6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6004ee89e7e126b0397f2d7d131cdbb1941e54494807398fed34474418deccdf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\03949f56a89752ce117639fe7f4e334435d56059d2b51c14b410f2c615f6c552",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\385f5076761d7fd24498a23e808941e347abdfad704c12e2f897715ab0a71fa6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a3a46889961da8b6e309a78e7b9113c2aeade458a1fae73022854ee73aefd246",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\43aedcaea6dffe279ac6468b60b69ebb339f9b72177b47b42f2662964ac777b6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\76dd41e0949bc3e2fece4c4845599463a4bc1f20377a9fa63ba800f6bb2f7799",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\369dcac9fd4cb17a63324dd7bc54b1ad5cadee36a22e97790affefd64ad84573",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e00e5c200ed0ad7d6edc2701733c0a50ade5f5cb69f02860e9ea076c2c4cc4c4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f828a74eeb193db7742997adb61c068c9fd3870fe7cf4a12199d1bec2b2dc385",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3fff0cc47a780af5547d9fccc740468b0b299ec33ae4a12661bf67bd4a1f274",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0f105d1bc950834b3f3d9ac27b9ba772d24672e036bccf630d6abd1ad706f001",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1d5caa493290ccffa4b18e20133a3f5d9001d6d3aff1baed8ed7eeca4d166f05",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a491c948ec5fcd9d5348c3890b8347a412419d1adf5fc6d9066995bad70fd269",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\23e4bf35803677b38433039edf66de6a5764f9beb826f72f00924fe48e698b2c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c22a7df47b6b79eccb7ffacaf93b1604ed3dbcb7acd7ce0f47302a9942558216",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c2de751b8a921e67ae5d156060e2ba272522083d9c779edf647e317198b12b64",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d69b0d115bef07fb45a7e7a15c99622dad738edeaeebc58c5274733556d40b6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5c8d5e3b1816d73f31b6d40c0e28ccbfc256a1fa6c99ca4c57713f922e8b4e0f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8ee893009ab84bbf0861f5fd36906f5ec902038934b969f9e75eefe744e58e2f",
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
 

