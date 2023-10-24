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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\18f37c0af27b4c3446d00e8c0d60febee8841ed4b937384cfcf0aaed4d61df68",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\86263a5e16c2ec81429b3aa5964482bef9774f37bef42e1c397a75f3722249e3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\35dd61dcbf1f98b040ace3e4ad21a88af3360dab2bfbbabfc4ac7cb448eb3a45",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a115f80feefb0ecf87a38d77c31f92ba976ff8e3a148c76a4c9c22dc209a5af",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6aeaf0fbc1982ad3fbf24f30768eff4ef217b8d122736f49d437eddebdea98e2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\64f96029d0e133888cfad4b90353c171539a7a41f47eb28e34ae44694fdc073a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cae4813a02a6c604c6f9bd481016413f90accac70235467fa07b7ef2599d0197",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4cdc3b19a9ff238a294d87f2608a3efac858adfa6ef7af5a95dd1a7046341135",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\394afd98a57ac82757554d41cbc0281b8e95dd12ade528de3e8364012aed99bc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a72f30188013eebf37c23bc2e063539a666689f0e450f96d36a892c00418fd9d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bdba0562b63074dd1881c9e60e15180be91fe1340760c383e914ae583e2db0d8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\15f895faf80f872308f4db367823b97b4840cf9b45a0407de228fb47a863765b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a1922fab57917c21a00497d229476eca92a7be3a16312b82b1e60e4a1b32645a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cec40842428a4a568fb4f3178763ab2e16cd20c305d8efb6bbabadd5f6ce8d2d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7a4a55d5794ba4b3ee4294713492aadd6bcbc50a551de86ed5628a8102071524",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a554b981d3b46568f3be3eba852d1690493095d3e48f509d713bf5d3e6342557",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f5a248c5ca8f2c96dceeacf10576d92faabe70b3f07bf01fda61a547be323644",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a3d55b19dc5ca85a94bb172b218b47a5f6b07478ecad17df15c96f473296d25c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0893e2dd4945474bfcf198d2f637923cf44092e9a5ea4617722ed4c55d6b80b9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\91a86eb4c792fe8b9ca748a7809f31a78ab56fac2e8197203040756b3ee02248",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1d9c25b7bf284af70ce091b4f684f526eda836cea54dbbeb2b0fc1c4971d10a8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4b68c5e121ed43ab8ac12d035e98a45e049ca3e6346f0b1c3c61cfefba0ae949",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\62a237c19b7edf0a7defab5ab1e55a9a341d3811c8347cc7e66af2f7edf3cc42",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f7227ce8e31bc332ea2d930f5533be261f99fc96d8c192a223e51e8c2cc0dc7b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\910ffbc316dfed7775ab5057b85c755bc2ed34d58f005d42c8726354cb99ec49",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5503c2e1967d9a269c2b337a965b89306e5037a8f1452f4055c771ab1119d070",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b0dc4ed6b03eb42af8a537db20c38139b211840b45d013fabbfb0586f677cd37",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8d115d2ad614728fe0c1b0d156f266c7ac58441cadfd77e2ffa90efcafac7210",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\27b9de83967b2fb5235f763e5c1452f316a964196ab9fafa9d93d2720100beef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\39936783056bbc25adbe9e583ce18b56fbb77724f9cbab58c6bcd561df4e3ff2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\913320082f272b153e5c7605883b96e26940ad5bea4f56f2f74534f2cbb7a561",
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
 

