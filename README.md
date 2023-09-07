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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8621cbd3addbdaf5a9d0757ef17c5b4557c2ceeea48b13cc5bb7eb00efc8224a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f32c3aea460134e8d2b9b3195a33631f87a693447bf9833ae74b55258e8a0025",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3bd3f1bc2eef2dcced40f34c5f3c2c54c447b1ce78bd21293af3dd87ddbad491",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c2d4773abbae385950186959736a78f7af5e0081bde94a731368bff80395f86c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\386e86cbc3a9a55910f3e3999650db7b570312801d318c4ff374f58cfe87e450",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\67c47ac780ad99543e32a408259c44928305a05a45bce52026455531a0c47635",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ab6b822db96c725e4918f5a21374935216469285fd33265bbe30396d2bb06f2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1a13b3de2567046f5dfe85229505537e435fb29671fb054e4674ef901df87183",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\89638d4008046c7ec878edf9fdb70a883e0f6cd12a9c5905b7ba09b5900dea67",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3c90bd4f0e5948fac6689442f24549bd73c42465c570fb3da11736a44b43c38a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bd0d633621379039877f114e154a7cd8c347f186f163a3cbd89ef0245d2731b1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\31f41ef5b0610dcf6751640d2382ac73e80408702fe7c4d457bfc3a3d4f0b8e8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec52b986683492320a803a94e6ba84080a2250e17093cb35cdd9d5c51836a9fc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b66bc1f67ff4ac1de1a045c2ae5376ed595683cbd92802b4e3e751dcc6f5ee4c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8b118818d4af4e0247ae239ee5996daabde4b50566bc814200dc3d564e010f8e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\942f895f7cbfe1464581b0bd8163008ce8ed871c221e9590fb65a8efc32dac2f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c5f6cded5645070143b1dd0a9c76d7f5bd4f3c3e82930f86d78a472c63aaedb8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\83874ea91144e71eb70904d850bc0782a3023360a292ae227028b16990e70ceb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\951a1536793540ea0c661382d3b9ded0ec5d3457989ad38241ddf293556a0c0c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41d58185ebac17280168b175143c78fb81dd6b3fa394ae7535daac4308796f77",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cff2ca757ab057567749bbf2ff7c6eb1f5366cbdf062edd5c29bc27d6be7026f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7709dd5a32b4cd34d4f6b3fa96c86e8818a12a5a14d30dede2f7b8f26989e6be",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4bbb7b65b211b102b94710d63791f675e9bbe48b255f26412cffabefd7cbf4d1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\561392513cfdd8d04e3cb0bb72123838914fde2630d928dec12bb7558a773c70",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\001f9c0329173647120305ed6e587ad6851ef7be7a0bf90b586bdaee4fbd5dcf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\aa5104e7fffb21f8c5221dc7047a725d4dbc2abd2014e3886a44e7abea72beea",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b0585aea8df32628fdecb58566a3fdded28e2927fe9f52c3c8503fd7928dd273",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d03e26b059007169c59be626d5622abe5163fb7a178e1c6a95ead0319745ebb2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c910257426bd03fba3cded015533eb19e08a6be88c55b9a8b2789314aa877c4a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d1649da3c103b6ee050766bf23e4d1f6030cfb694cd37902492eda44b0f779db",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9293972bb09fe51ca1718b0d0bd153355c67c482f5afe40c04a3fe1796676af7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\13f90eee9ac72c63ea0f0292849d2e833dde7b4be0e0cbb2dc787c98b9fc35c3",
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
 

