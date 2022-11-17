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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ee56216ff17b0e783dc224656afc23019b6c85694a1fc19ed60227b60e644cde",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\23b8b026b667c5916bceca07b397cab1e301f945eaf92ba62789fcabbd5b365b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e4c3c1051b520a87108a222d1b424f0b27c0fc2d5d9e1f626b7d02af0fbe6f38",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\60c27cff392d0d1bfe2c64859fad3c8ff3ff12b950d62f57e7c0e06989ff0588",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f5b10f76aa298a7ec590c21def23feb2378ac6abddd737adf2de5464eb060576",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0852adc8adec672d4e40568a1ade4c5b867efa7bb41e7199abc68f09bef76456",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\798d357d2ecd5fbd4fe599089ddcbbc3b73c00d15b2e501fe50cc2b4718addfc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a8dc3d7651c5232ff247562037148c4b84c10ca245b5a78bd964f49c56808f5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b15c48b22c590068a2e96c86f1b249f1f21524365d76f66fadb89f8b7d44dd52",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\456009d4e0d1f8c20abafdc68515cdb400b19c8114ce06f62a685aecbb5b2dc1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\68636de7fcace6a7a400a429de7a46e63b77114cb876aa9b99f4cef40898562c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d502496061eba93ab41f84e99fc39675a8a2065a6c2773c6894bb42bdffd4f1b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\93233d0125b1e5fd2eaf831110d986df532380d3140bb5c1ff8addd8b6724c43",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2783088e3b750c13f302bf28a3838a76ef7ef62ef2e90505624ccee4ba201e37",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33e208e2996f5a62ea01677345d08c4c0b2f1fb9633e6c2122a671049da2204e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a6d08c04f046b04eb70c4cfbc98f4568a4bed899ef43186e14f776f47e17294d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\84cac5a8866917d68ff27c2e8bba496df77299e57b4f7f290b00ac0a8160c182",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f4a99ceef1543a2114bf7f415c8223a705e0851089b6ceab0131ca89e570eb29",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\08564af8de747a8aee3e68e4a9a595b3b3e7aab456f264f16042c4e4ac7b87fb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f9d76c080930366ad8911c72097a936a24febd1fcbea25cad8b10121054df8d7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb43e3287f888a4e9297be962bcc0c1482dc982d73bb4b23e55a14d4e5ec9a7c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe3ed13dfe565ddbcd49d5dc3fe8f3e8c17040d3c36f7187d7c74dd14f3dff9e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d3d1fcfc2d96aeb26c356eee387f2835542e37e63dd53afc04d149c9a3e082f9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5cb08ef5eeb174a6e43c614bccad04c4e7e4e6a5670572d06f667042498bc8ff",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\679ebc208a3e8adef6fda6ea68ef70796a03c3c79888ff633c0eec0bce1686f6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4dca490b5421864805c8ecbacbb41325be7b97553e1b867a31988de18768c0b3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41c9d98ba1c20c374cff7cd093e40bf15edc6e9c6e35c1749ddd22166ce23ae6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\310b472fcb18bd08602a307bbcfb6e4808e3bd5b4a0fb18fae05f1e08db51927",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c47434a6a065528a0f9ddf3061a49187e2d669bab78b507dc1a2cbda1f6293cb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a0a24f0876c84cd8a22723531471a7a2eb512e6fdc351b604c0bd6b381c0f932",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c9b9f37f3013e8ae1c95049b62f1ceb7c96529c26d6890e7396623ab48bc6fe6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\403e0c1a5aca1226472c9a8d3bd0525245dbbaab6ad253871f75fa6879643fe9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d6fdd6832d95a5f537e0e7d87f2613ea9741ad9c20438b9d5a2697a883c4cd96"
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
 

