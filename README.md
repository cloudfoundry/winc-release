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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3f726caf2f029c189a1659f2acf104d01fa1902bc4a2714c4244ea8fba7ceb0c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\26da290cf4f5075b5f2b18209c91cf2d353ad9dbb7e7deca76b47578daa9991a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\883ff75773e50242e7981c40d9fcb7b37a000deba24a38b126df9921e269235d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5eab34f7f1a7074599056b292e558bc7a06408f8d75a9e23323cbc6b71486f9f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6093f3656a09d8f767650b1fe1624e9a5100c5c19aff732016984a0115b4ca7b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\26c5ae17dc58a06d8680c4cccd95758291b540e71e030f1faa02bdb8f31b3c40",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1be0ce890168fd2c7e041821cc9df66cf04d05b52aa7859369f6967df0a4694a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2dc7b3b26dcc73fd99ae60dffb410c3223055795ffbc4b32ac5f77dd43106d5f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d1c5a68c1a3ea5a36b83cca6fe09b6be324e147dc38061106d809c7492db8f00",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec66c46c96d7ad4a42de8f1d9c5e776f71c4792301d9f9f1de4cec296e5fbf9e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\db7933c85cff40a77e0bd872469158980c2f0b02b8e830050ada1d7c0b7482a3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bac5bb4384791028bc78f8d894e1b1a35d0bf48f222c7644a6bbe8d21560e8d6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4dd95c4adf3d16c3dd35a2737e7b512b3a33f6d94cb0e3dc2103ec08c3e1aeec",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\466b542f14595db12dd863f2b5925490ca3201a566565575d216c1b3dc579d76",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b62bd364f829aa13befdfe0751020ea6d6a97f0f501728fbbebfc9665405dec9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\afde6cbad7858257ace34391532f40fb4cde50be39b14e1ff0a022022906d1a9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\463b3af457148deeded204a37a39cd7dd88a4228c0ca828504dad896aa63b121",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8b89604671093548019622c5ed259bcd4b94bde1da92ab5602f2ab00eb371627",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb9ef136cba45c82db42208ff035ccbefb4f98b8f0367ecbc716b7de387ccfa8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a3a224c3696cc8c03adfa507d19e960287f322c76a54df2f293de6af53fc959c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\924177ca5df163072e6c0d77255a0de2e8c05f8c9f02cbc5ed89d1d055dd424b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\58122a6e0e6e644a0c85f45edef1bbc93e758866f43e45361129d5378f4130e8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5498071e5b2a5d39b37c4ea3e9de9eca10fa55a68e532854221e28b385d9c557",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ca32c4c8e686ab0cb87723eeb91a2bab15a8197050538f45dc63231d24d1ffe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e7e48f1c6c3c698bbe723f3e59adfb5b4f938f034ab13bb196a9b00b272a9813",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4a7a839d86d1ef4d1ce868a007ea1b7c87f427459e9e0d22bf83d4c649993f16",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\88a1195cf44c15b62e588a0cc957eaaafacce0513f7f5804dc95075a5d42fbf0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\67eccc2aeb6f6204d850b355b55ad4a04ea0bee52998fe3d0a070b189e16045e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9d3610478aa2f8388e126d999acca1019288a68c87a49440205bdb41f9d9454a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ab653226d471ad53e3140caf5089fdee1bf67155009980039e3b03d90d00b12e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5d17ba8c547488847268f0ad083ea9d34a062a4fcb414f2687e65323bfcd83bb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\66279ecbd699d105d2d3b20b8c84d61e1415fad34de3e2793fe65be138c2d6ef",
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
 

