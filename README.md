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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\88f7166414e7d873f2b88ae6d348dea1c6eb284d09c61cc82f3323a4d98fe812",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9f20959fe4fd361dba75c560bd41e86f20986c8fa9d7d147f4bdc1b511ea1ef4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d10a392ef2ccd226e66f1e7fc1dbd4f17a575fa659afcf346dd0a936794bdd51",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5d34a784e2cd4a6cf4a69f896fc7b403274e08d82f40528d77dc247424187c38",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\56c2b3fe94862b283e5eb4e70607ac1e2daf34a2a8374a67305ffa1ba96eb0ec",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\29435790953b72ab251e0b77abfe8e6219b062fe7d04636cd3a17259ccdf6681",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f9a3b09f063fa3a03a308283e3852242172b883affb2125845ebd099de39fe0c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\59b37304941be51fdbec492b2e59255bdf6365b6c38c281c1f729534cd617144",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\25d9c06f8a94313503928c89855d5d1e6e505b644c9b0966ccae1c79f5fa4ce4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e0f92a114f5af5b56654c1e433d8866cfd280b8140702e65e9ed3f5cabc36381",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\74af306a9a49633ee3957ee945f4cd282223cce627f26e74c530d0ec0feb8afe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9a759f588c3dee4f0e1026be8daf4d3ec83cf4aa771742a602fe3bc0e8c62b00",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ee803e804731061dc96d880f8624930e0123de7c3eabdca889b5ac018e33501a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3250543d2f6ab2e1d66d6d9c12ee5c27bbf7588fa59539ba4c27e5991d8105e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4a781f35fa8e2df589b95cce9a5e73d5abebae2d326535c06102d1e79817cc5d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f5f165dee89abd0896b678e7f82120291c5763a23a6e89dc3315fdf3b3435f2a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c039a08bbb5439fefc161f68baf40ac44b94fbfedaa100ffab21e65ebb704f8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b0095d6a3121b8663c36133736cd21868ca7dff2e4b48b910d0f46184dd64039",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0d8721bc219f42bba17e937fdc0a7d11e572f1a90096c109568c892936918884",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\51ee6cb1b8d10a2b213fde4d833b5b98dba5cf943b12eff7844a62aef38906c8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37c19b20b4115869e780bc5753438ca4a5d77f0e710b262157a26e6ddb9ebb29",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d5c1dad5c5c4ef2d7eb9fa27842e0e45322db76ac7dd0b678e6effcae068698c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1909090043adf98ca568706bf2ba4e092758d5b7707b733e2c743156a583e49c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9645b05889d190e7a6e1ecff11efe6d6c5330e34c69805d16dfaf129703f6f49",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\76793b4456440d62ed59c786a71f50db77301d5966c449060d8d067be9b015fb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\412d9b8e2ea1136a4380b1b9fb3044640f2d9be20af960cde6b4a1ab1c0684c0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b4a4ea5b14f5ad7764e816bd7f4a64e4a50ee53a495b36c270a8f85333698399",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\538658579a596c250ff3c8595ed9eb8efe754089a5e7fad323dc0f60b017c299",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f90c29b7f194b59531e5935044b1b8a02f1d1a6f5cd1112113ef49aae8edf8e7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1d742a77d301d9f9e0f2d7cfae9d64052d980b5a00dff394b8b882231048f429",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\42eb6527bbdf71d09cde584a31b2edf90c10d60b496e4bdf7743e026c0ed8db5",
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
 

