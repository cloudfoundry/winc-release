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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3495fdfa45eed50c85b070404d72f7deded10dba0c6a5fa96603a70a4a2c71ab",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\49742311fa9a7cfa5b98c0ffb38af5c7d889782df16ffccf0bddbf2f9af42e48",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fb0c8d90cf25df5d099686943a522a718f4647582e60427960faf9718d562016",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\542995afea1d4167fe736e7f692c36df57e14ae83421f044a01100bae93f08a7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\96d9105d3f2dd72bae39899517dd791dea194cfab306b13c80dcec005cc7ebea",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\15a64c5fa53c4d9df1a527446c264c066adb206eba3c75397215893d48246278",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bdeb8d6a0e469cc1e4843c996beb5d1c3d0d6242888cc29fa93d085c433b5495",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4f870e25df005a5dd225a554dbabedfbdd9a2b5fa6915f3f13fb3c6c74304757",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\16647c46b664ebcf6a2ed9121774f73976a6e43ce883667d72133bf2a94b6409",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e0d75747855880742e92dd975bea9c77e925eec1212762e2c1ac928e7e7f24ab",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\eecfa337ab891eb8f13a703381956eac4106d1d9883d464f800836b87af40aa5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3d33224ca40f7b4539efd748285acc6347247c1ef45982ca25adeae3f1b4eb77",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a2fa82b3f12f2ad0ef110ecd1196104fb062f697c3b662e7bf13ce98d62cc724",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d3435d4653ab815d16fb33528500a722bc590b69c444b754ee3600f1a7d7b3cf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b3f2d3e9c01bf57bcb0e7ccd6bfd190f6cd607b49edc132450d3fabc1fe0f7b0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\31ed6a37fe742b1ebb15d247adcce81580131bb98dcb1000585b15e15b3a713b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c9adedbaa9c454ef93639e58c348da6f907dec976ec86ca99aae19f64d79472a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\efb8ee73cd2b93c9c58b6eff54a6f24a362e5c82fcef3568b53817090d01f9f3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\20f8c516f8fd67631e26f2f68402dee18a3946d9d847498fea3804fd338aef1c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f0e40076ff479b2a6f5c2c2a46413c6769bded2cb2fe45aba636c0ff8d73a128",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\58dee9b89f57f092fe3c5b726ca33d4ba938409bc3bff7e245a41e0a9e526d5b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8280b28763c3b0d860749afb74a83037dbf719fb61834396d4fdcfbaddaf0b3a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\14c8c10f5976c0dcec825fe00dca181bc5652de1f6489c0ad83fca2182170edb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b46f4a55ce0973bf36859038a38032e708df834cc75e1b4f923a69dd205ec40c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d5f8b0bdcf9c4f2efb4a7741594cac2f7639ff7bed356a673abbfb3624ba8898",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f0b5739b387cc3b1deedc8579e0b8d8553d1d5656aa573cc86a8760c853e0ced",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\801db936ac03350d16fa4948e6f06a337a4ac4f0acde3d6ca396c7fe970f625d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\68c6fd89222c29d430f08ffc114832f2c44ba9c65587bde4351020231c0f8e8b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7a596d8d354df1b9fbd582249d43da90ea18f271d25b9f2da00b4e102d8ca5ef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7a33237b5d54ff72b2fb8346f35f43e15260223d935cef3e351c995d4d3ba29e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\75962b1784a0cc7ca308658e7048f017c8faa593a54cc8860b26f12f19a28b0c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\194e2d79bc311463d22dbbfa87f9d3151a68a81cb566791f731b1605d7fe44be",
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
 

