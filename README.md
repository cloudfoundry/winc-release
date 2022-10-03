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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8f91fceacde3f9e32ea167f9d8c8a6fb8ad62e19aee13cb9a5cb8dfa1d9932c8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2051bc462ec88f24c4bb33ec2c6231a308203d825168ed3c52d07c3452b355fc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4e6548fdf173a33e564007434f965961d7009fb4b0815deb06890843625e0c89",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b1aa5c8e357809c4528567485ae633ba4dfa837a38303b45ecec4606a97dc538",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\707ee7630b4a84c0a6fa900f96c94c572fb04350077e3c1e368a8076a7345ffa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e4ac259fd3ffe88ca08d1ba1d902be8f3783d96ea4d5cb0ba798ee183c9e81de",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\648ad2e1db1a97b3a2ca612082fef775238fcf677825f13a52404877b93151ef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\544a2f8211cc9758d5044acc406783510ca1610f7af2ded1e25f1c28d89f7774",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ba1ed4c495d780fd249bd6df5f56d111d972e98ae48c7fe2530d95e85101b595",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\afe7a118ec15108d3ea8f28302d0525107f0919997fcc445fd20b783118cff81",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b6638a7fb88f5cfb05b76afd1ff917c6d13d7de89b9be83798b63bcab4795595",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\58772138af2757ca921436819458b700a88c13dac6ac51c6653b7eeb0d981a55",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec7478dee2307eed7159670279a0bc4e95863b0294c014a22a53f826c1dfd0a1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d6d93e099dcae4c84cb996c34ef44fd159afc68c00c48f9bd718914adb425961",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3c222df85f9f1e431224024faa772a90fb76b7c4f22661cbdc680eb47c6629e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\35f62d8488deb89c0e5994cc7fd28f98ce4e8631dab17de3f25eb1e1bf81546a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\864be12ba849e0052f6e812a728413ec380644ac69707ff6074e168984e47cc9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0372fd85359a5922022b19f49a8457917b14e9be8611a3184a878bdd0c4a3827",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3e08ddc76e9c74a9b7f67b896599f9b17ec18865fc3d640249e2d60236c718f1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\af35068f91477b56a8937a6a909d5a4273276770e0b20f4f732445cdcf7f7232",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\84fab86630ae119478f9b26bb78565348cb4e50026e976e9ed2bdecdc47ef922",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f8531e4cec917e80dd5105606513f75217f850ce1ef66dc41e7f45fec174e89e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9902db65a833f805b6b68089010f6f6b9f891b72febc38ee85fbf5fbaf5a6d76",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\024427e6a998460aa5047ce2d2409aa614003808f73b895d139f5715217fcdb8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fceb523bb3929535c2627fbada1292ad6784258d8dde38ecc430e33b600b2461",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dee1fd05bb4bc2c7393875a2dfc6f909ac222a0374cfaed21cc127caef17dfb3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fcf4a4d3031f26e897736d807bbbdc4178430fc917c08dc6769c40acd335bd46",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ae49081343eeb30dc74ba04432043bbd62ad36c47bcbef6c212ece36acfd3421",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a54312bbfee201089755b8dae60f34fe1e451321b8cb55adb135202531951ca5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5ed293b90791398bb4555f8873082e8f6d5e6e8296249a96e97eb31a594fde44",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c64c069b6b1ddcc9916b0d44cf061df5ddb9b7246731c75aa230d0519fd97cee",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\131e33d08d14463cc4c764f45cf563168bb7422172e01931df3bcf90e8d5267b",
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
 

