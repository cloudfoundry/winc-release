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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\10c967db7de3950a379918edf8b12cec338c6f90262d7dd6cdcb33de6de6ab6f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d65e8e022d77deb54b3c7f5d6fae362d4c51931cfe1f96b007eaaa5a04903a3e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\375dbbaced2e9d1403363e2c8d0e6c4bbbe4177d30b19c5f5c420b9cfcf04f7f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0d66737138e4524af931e150eb21c3eb5ddfec3e1f1479c557ab6a407738a46e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f796ab3a282ff091562e62ed4d0c00258ea451b25e4e54c38bb3f17552be29e2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b449db476ceb247176fd7f474c557306f9ce1fe4f75247c8da5512c14ab199e0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71b371a275be40597335919c56d8dc51e36ac6ae4743ad360fc7826a3a4f1fd6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d0785f94ec57d1bbd8a6ac5c1a845d1b1040e36e78709c449a90fb5ade5eeb6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c1c8d6c638c9825b53a92fa1a8910883ca459634916f5a2a8454a8fe9b091f4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b1a7d2703b4b8bb9e4b6f916945759dd83b0acb91be1f5ca009628f60c0929d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\73249e3ae2182b0d4f2706ce61348da42f021a2c74009a3a64cece6095a31a93",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\810e07f346781b1f75b5f0215d6dea0eff12e4ef2423d0e1de14ec30a19830e9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\326a1f4d715bb332a60e3cdb1c5a9e1c2ec454992ddd17829b191cc08602401b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c924ae84ead4562d32e182e39c95d26c141281f89bc123fef5db1e4d395b666",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7c4f97b1a14affee29a46576c0995ce2bf463e5c1eae4aced709ab56155c4baf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7c8e46d8ba64be512ce2862a73e8b22aac27e6dc71f48e75e3fdb56f37bf0592",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0b5915618c574839bb58c7b9a9e7f268ac42f7b6a9f1fcb6c17343d5465a4a63",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\31ebf41c72c46f67e84f3b5d7449c41ddef0c3e27ed6f068b92a521d75255e93",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0da7b0ffe5084d9203e7110e655b7ced2db4df605d10487b5e923e4af0df655f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d09793b71c0275906ce7af0940b55019f6a08ee04943dead4194eb49e623c91",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cf75264fae4c11a75cbb1519e48d36e0a8aa3d675f800daeba607839914e4247",
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
 

