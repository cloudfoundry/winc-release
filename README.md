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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4a2afa66312d2ebd37958ee019a12f970bf034937641e2a44f0da9d3c3e52120",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\829089e020668490f26d2ab5e5771cc8bc2da3899c4d16525f62573f9ec7100a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0f98cc2bf58190b2fd4f1df4f9b30e329d1a2f0a2940584c512260a23af9364f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f9bbe84517bb3e79726c0d02bef05a7bba2a323d3f93a192a41b47c7d26310dc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f818cc50ebbfa0513dac38bdd8cba0eca3df09ce80dec5c5101d16d5050d4636",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b42fd8bbb2d847ff226ebe379b553764b4453f693aeca7aa71234b8422628cf3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f98f4403f1ad2d805707ebede8ffcfec9a0a7d79466a9889db23363c3e27d927",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37e8eb95989f23cb09a85a6c3cfc9f689f50a0fe36611703933ef02887eb82a7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3bde961bcd6d099a3b37457561aa0ff2936a94b09b4c342ba9b689d508eb5eff",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\281619115b6823c6c70f7b51ec6b35791f61cfa62704ff79b34c35ab80db2588",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ed2ab5f171d2fe1aeb0fa7ae4a21c334270afde5e00797df9475315fbdd5e569",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3689fa86a4f2ca89ef9ba292f745ef4fe05aee91ca969ebf8beac299fc4830f3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0055cdacda6cebfbb4fa8b5c3341df1ed94eca25a6b9028f3a526af38e619c5b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5199c7562e8c140ce1d72b83f839be344acf429cecba7eb80d0737f945a41f96",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c266b48ae00f17d09b95994e994eeefacf244a70d968bc0ffbc79d568f93ddd3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\032efd7f306b5ea40eccab4ee91674d291f593b0b0fd8c24dcab2cd4957ad06f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\472d7858eb5fcd0d9151fe8747daba95787fdd55d93ffeb281466844233078b2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fb15e3057b5a686a8f453a3ce87ff211f459ecbb2a5d725aff3da39c24debde8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\78bd9dcb133e713206b87b55d7b74c32e718a8fe83758f0b7f0d4ce64c0d2181",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\42951962007622e737795a126356d7df16bfa0da4d6df696cb13abd8952aa2eb",
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
 

