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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\adb48ed51da2c0ca7f6b1d75505c22ce69cb75c9d7581e34a806016edf6b0587",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\515a54d83e4ba5cec84236a00dbb2520281bae2be07cedd6d661ad4331a9fc5d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4caf9c772da7e7d8dcccda2b09c75548744f126351e7f398df0d6e9e73bfa9ac",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ef0421cfab432360754c1c7dfb8a9a8e896fef61121f54888c3bdc0d21af08b9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\da67118e33fcafdf66ce5e1c90a1a11451126f77f9a1e13eba276a1513587e04",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b28aec99f013e777ef8aa88e886423ddae3e7e28c5d9100b4e172d6784b9aa45",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b6b5cecd18ca40b0ba3ec4e9a2f51a6dbb2d06b8f8f062fbdce4d9cc4c7fb17d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fa62d8782ab83a41d985eed82102e9e3bbdc6849c1744cc43a4567078411584f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b7b5c5dcc90a0893c9b657ea363e9323ab72f5461d28030978e264e2074caff5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f0169f58af2330cba2d24f34630794601d1637359373ae0064d7ba281f4d1d85",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3947e414ce9ae5412d2bd481fb23513b19e1a0b5ed94591d754603e86b865a6c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f6f0136b6a358b3663ac7f82cb3c2678eb3e92b62247ec0bbf26d8487a9e9a0a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37954c271ec97e662f8771406049ad5e2a180e524c9866452a5bb277b22edea5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e4fc8c6fa544a19ff473ddf78a306e77fddbd90523da4fc8dc76d638b2e8854a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\55e678cba522bb9cd32c10bc7ca210146b2821366f75b8c94c92835d88fca176",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\44c707c87eb37e77203f5f283ca33743bb819d54977588de5ef4b2bac7e609f8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e952665ec16a952a03c71ef3275909b930314d7e6aa22d9785e0d72b9db67870",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\15e3c723414c60b46eb9f0222a828d21de4f55db757c7941c50f922ed3b1f918",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\adac2f13412994afc54dd981b61f327ec67a6efb6f8cfc86db11363c595c2f3b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c6427c0a6c714ec6e7276ffdb94e61db1763ab129be79b200982227d54456a0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a4ec178e205275458db94aa56e22607f2006916ede3fa8b508d6d039647ef10a",
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
 

