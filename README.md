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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8bbf09122eadbe7b70b34206da87769df0b5e12e9431a2d5605f717b7241f3cd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3178f00cf9d52e72fad5d5bbb6bdcba3437dd5bb367f414bee233fee649e7574",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c46a77de4de6334de70c83b96e037f6942a4746fdb66304b6ae48fbb645ce9b4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\12a33a02102016773d1d25739be5df73fd5d8a376c28957230d2073e8f450356",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3e75184db048acb95a89a223b0e82986f2393f0ad5ea0945f326d08ea56e4cd1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\179cc91f1672e90655013261591ed1ae74a2c67c1f63cfd40e624351d307dc28",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6680d1f2f2673e3cf5c80bfcaf407e64d8dd8b296d81ac5c2f6cbb15601c0a78",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7505fc66766d08007285924796b0244a78b047ff66020d7009495200be9b9f94",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4ec316b85d4e2a8c0c25802d964e87a00964e6a4cecc7dee0ccf20d59afc824a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6c0b117de79031de465f93327a5cbb850fcb9bca835cb81c4c48f3ebd760016b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4ddc27a5b0ea8bb0d44e604444fd5a07dbacfa382b6967ec348a0ff3954c2c1f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9605d0f4597352d6334ff4def05152cbf51d22503c7ffc4077ddbe754e206f4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9029980ce54196850128aa72d9b03c825453898e83df25ce028217eef67e7262",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\61c9ac2784900af67e50e2d65738248f4f8323fccd933255f530c4e5dc15e039",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\928acba56b2a3d5b62bf4f7fe4d6aa9a39ca0291e825c820bdd50a7a68889846",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f0f2c6f2534cf0c6fe4693cfb6a6df7c211017dc8dec37e4415411c3db908fb9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\59b9fa336590fc0d8e8be4d00644d6081c2a303fc932fce3409ffa910a5b1234",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e83e4b6d65a81febdcd91962c5d8a6dac48c640b0ffff0e0bfaf69e8fbce409d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\03e740d6eab3720f8ad5fdd59305c4184b03e5225b53e6025edc549a2d0c10be",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ce0d5959eccbf494339d97285c29dbc919d3c43485cd0bfcef1a9e4a6e8664e3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\43a9036ef7d0231f953a1e7ef3e8a3c01ac5d1b12f150b53a6af2b11a848ffbc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b0509028de35a728d3c1f22e2e9e2e696192701024a5795cff90efc64c8a448a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7f8c4ec6f135bdd2748c9eb4a00e4e283d6277586eaaf6b5f0f4c33a10bfb168",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\18b8757bec13bf26278245bb51bf212ebb123fd63af4fbba2c5c0c86f19206b9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a13dce6658f89875480b72986f5b7e7374462063b2c844275e7f7198006f4d7c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\689c0b71ab60d5f73daad654bff710232567b1a45e68da23106791ebd9ebe107",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3ec9654cf86a2fabf065e90e267ab417becb9e7b8840a310a1220e21c9c5abf6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f03d238e93ee5543c74b7c0487b8619309a3c049578ce0c2d2d18ac600fde78c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d42ab301a39eca7c1155d6ca8e01f8b910c1f2707a709539fd9fae87f080b5e0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d172325a7f95ba28b32743d751667f851cce29b28ea352fd7ce6ff0619b6ab9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a223d4148d06b4a04dec750a56fcdb300d19cda1d0f9c7b964d7cb6f50ca6ffc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a5086257c21d9946481421c1a92eb1b2a1cb1819ef790758b7297af9c745a1ab",
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
 

