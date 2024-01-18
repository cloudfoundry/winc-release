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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8131874bbfce91748232e03bc3071d0f7a45840fa8612efe2d07bcb1fa17f03d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\277090c2a3c980f558a0e1eb00cd76f811246efb960de7d49c5b339e6885ffaa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e0f32b78ff86e9616513d3273cb23280f787d0dd3545423f80fe75af176ff52f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\519948eef419c64672c2808dce4d014597e0390714460d060d536707157a2af4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6243baa53ec9c2c61bb8a2a3347a742fe831b7ccb3da956ccc17cf035ff23b73",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\379a2ecb699014ff86de5959923288100edfeb21b3a88ec8d92d919b4c880990",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\40cd84b9b318fe8f31f211da1ff3c4adf21921241f65b5db773f234ca6b1ca6e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ea331a6b4b030d37672c1ec4c7fac5ecdb11febc5564d44c4115be264e2d1bf9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2069d693490003903aaf54fec38c375b29f55a346e907cbb92c1bd8ed1493100",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0f4d05332ce595befda6767956140dea94bf5fd904a610159308aad006a6c5f1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b833e142cdbe9a0c462a0f01818db72872c13a5c5d2102bf3ad3ea624ba340ca",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\89e12e2e4267eb38a6a608633d5026c6447b0b0f2fa6193ce83f1a2aa6238926",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\39f8665a194a28b1541c556464ef785ea23cb7b2bc61c7c6552433ac4fac7be5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c4c1c51feb5420ac236db2a8b58c4d8175c8635b5e2771059a66f7ccea2dedcd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b69d05b6ab50344d58130d9fb18557f5e1063c3e70cebd8bdccde2312d3d9ebd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7912c05bee8e44fe1d62adb449d16aa4cdb1f67db28edbd05fbdad75351551cf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\aba99741d1357a9362163e5b481a0a92cc2083a2f1f2e1235c100824a9ef2961",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1dbb4f561b96c3724f1df27cffffb067ede7292085a99157862779ff6c102a4f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e139e80ecdd1c8f87154a065a42a8dd271ead8f39e82df790b23304e6b8981bb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5cbc0a806e9e8157ee4e2e68f12a33671bfdc8d06c4097bd0a19246de5f8aea8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\58fb4b4cbea3ae041e7464362961d397d28e2c8cb6b898497933927a6f4b085d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\616786acf80dd65ee6cbafaa0fbda7ac1d4f52595eabdb54591e5d691e4862a6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a93d9dc5d4e6d0b48876bdd9ccbf8ceb49122bcaa0f89d09bbf3a6ec5fc5cf00",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\878207e66a4461f42a2a3e8dc1e090726f5bda4ecd15467dd77fd1500876f919",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c428dd662824dd03321c79f4c09ef0719d915206fd0eafa6bd919a588d3d763",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7657f9a16c2d68a9bc6a36c2ab3de7ece193131b8d6720e5cddc2047f733827f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\91b1dc8b4319833f6654c9aa3b95f653edab9b57201774aada0b714ada40f12c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ef715b0f4b753d43cd0b1453c63ca4690a928219ab52798f5d8df1a0d015318f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8e4e694937a3fab8f638a30f621591ebcc2c4569174c5668ec4b8d5915d5bff1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0bf4098ee209d1e5e2701ccfa761a8b9888bfc5e5f6c8b7d33a634fb4186299b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7bb58fd146d92cd770e4ee1739636598de4dc8cd1afe8cbc4cd36fc157847404",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\83f71a5e68abf3ad97eac1611eeea2279bd1a03f0d1d33c289922fed58ee146b",
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
 

