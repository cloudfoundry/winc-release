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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\354626cf86aca2f2ffbec2b8c68fdef6fbe227b68b5fb2d55ce8138b167eed88",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\23455f6c358812c4282b9d2b013d023e79202512b1138a3a8a270968cffeeca7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7b5abae0839add1167aa48499b767fc4c9613f343f6caf24424ccf55293efa93",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\12a1c26856eb0d6d6184dafc0357d28acec91eee4de97c624e4afdbf15b4cf21",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b92c6b7ac9da27cd8f0179e6b0a2daba16fda7f96315a1729e263fa0a6177021",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fc787e5775c32d3044aaba6dcd529c639a9ed95337018153a966fe30d2711864",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\946b4c4f1d1b6d02b0a9b531155f48232993c4cdb08c26a353e31d95f0a31cca",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\352f2e7db182cf535822d7355b13ea2772a2970e342c87ccd3ede88ee9501271",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b9c523ee5d6df79e0ffe3fcf2156a45c6d66b2b78bfd3df8fe4c32d6ec3457c6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a0c39e0e9b87f66764872bcc9475775d7756f2424f77050bd1b8aa024f1ae16",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2a8cdcaf4af2ae3b1de89a96f7d8cc8a28d57f393dbaeddc7468ff42e9863257",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a78fa055b95e17c53d33f4f73facc94950a433acb06ebf190e02bc81c3eb5255",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c7a458f87f9a225170b72c63a76202070bb924b0b37ea00abdd3cf681c43d78",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\35f6d451c8e35c32492ac6ed53202ce04dcd908b2ebc4825031ec1e259df847a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f98c4e3c9e8fa8cdf453808c663de56f68f66204bfc259d2d852aca22bcc77fd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cbc6abf21ecea156357ee57dfe0a19cb586dce9f965c6555865718d3a4a8c75b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\862bf03fce030e2726a74479a2d71a29fd68aaf74a2748bbb241f45ff64fff83",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f418093154ce3933b832417ac8e7e6acd80a0258b6300ae2fdde372de558e988",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5a055efb339419952f6a7a02199bc19b0acddd4bbe70f2c958c6dbce603098cc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\395738fe92b7eb048450fa44c1e54e569a2474df507f8d2d233d60f7226a61b2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5d432bf0bba6731c5d09676b015f55e6e4d4918b73a3e5b73ac88ab80d624fdb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6e7aeafdfcefdb60d97b7ee6628a3fe082eea8e30b1856fb80e3fa8cc105e288",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c6d0b9b233cac3256de04d713ab0c6f21ca9072229fa7c02b25b3b8068d3405",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb642fcdc0887b3976801237def8861cdeffead020730d5197be29e50b547a92",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8b90780c28dffc93b43769cc9570b969cf5fd642841bd13f9b6fd4697ba23a6b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\077b09537bc9e4730faa1057705da19a443863e800a593a282f16262d61d665d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\401a6695b3015d6565a75127bfc6c0db26eb3c3ef07f912f96aaba7838133e7a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\989647db501ca78ad6ecfdc56e862338ce8ff046a61ab94afe430a554eb3e905",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5a92c131198344f652dbd34635ba86f5ae7e957f310fe7048e5f43c86485d849",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c8ebc82cd86ddd8d0c9b3995aaa4cf1d72417454b4fc9d854332c66566b9fe16",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7905079a0e3666a133c82ca3a64cfd1d1996e1fb8d57efccaa6c91e07bf311d1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\11b639e050a38771052eb4c9111dd77303c6969292f9492a4dd6d0a56c6cf2bc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a7ba3db29ebb3a32e6a9c912d6ab5941bd981a0c39a420e6786c70a66babb80b"
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
 

