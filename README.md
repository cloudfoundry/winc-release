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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cd432adca66dc546b52420f919e109a755409ecfe0a96ddf42194c48abd8f21e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c1567e17a5b8d8bbd6dcf55d92b19feec869e299976b9faac04d25b049244f89",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3924dae50e72499083559c67f039dc71e0d06b3c12e72030f4d1ab538aaac04b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c33cb23cc016c7f80c9eb297e9320dbe16cb362b4055708ae6b34a25d7f72fa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6b8ef8c8563c2b60e6bed35734dae51ffcc15f1d9c8ed2408faaa65a20638a03",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a70e080e96852a0f6a07f2d73ca7530ae645fa5a2956864050093b698e2338c1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f2a38c9fcaad743c7a88b603e36a9bc762cfc56f2fd327633d78438f25c643e7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\982501f37c3822044c3b59b339553fc5074cc6ab9ecc988f483bf120af3ee73c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\922705c3f48ed4b1dd6745ae67bc8aeb61dcf78699c29b03543985984a837318",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3b5e9e98712e5f34874e46edfee34d14b33a1ee85b73b301f69671c913427e3a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8a98a56989a1495bfa380a95798ea56f704f42b00f1c8e405f9a558b1c135ee9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6c95438549566b7e6426b5eab12695ab1312c728fa9e24dd97515814a86c178c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d3719f99668ed8c2e68123fb18b9b51dc8e60eb18b716fc7dc72f93d4724a130",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\499c7878ddb47bccae5dcc2283c9cf0394644d079188c440f64ee41e19872c1c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\64530d882e1df91762437aff5f0f16723458b553ce00eea7cdd5793286ec770b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6b1d0146a82c170052432169d3a0490ccd7ef7287fcd11fd723c3f9c718473b5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\89599c206fa56f4a5c69e5ce0184b501bd2ff9a063f6b7f990f460aa7c088adf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ad4658f61e7e4bfae635ac3a7955b7204d75d7fc28aa41a8c719bfdf3bd94ed2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6921ad6eb6c2cd2e5c4a077890cc09fd1a739a98fd64bb86c5831eda1f82fb2b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71332a2a397776f252f49a3adfe87b693996a135daa6ba8b5a5fad6bb2849945",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0973d5e69eb11b6483a87682e4efaf8b5df26fa443c8576c5b89835436eb60f0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4e153f66e4187527d23a2fef619d8d934410ba7b6cdf00e8fa6294ac93c7d643",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f4b27c0ffb482e00afa990ed026f0739e0f148b3adac711eec235c87ab6922f7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cbac9532211c25fc203404dd2cc34226a377f497cae97fa13222da169bf6083f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9e698c88c49892b70341c5a23be51d7123ff70253a1159525d417d48254f3de6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2339857f1f4ae0f48cf51c052aae8d794538eae42279bd956cf274bb54719deb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c568136c7096f8c707ce86d3d7b4aeb33533a63243f880404e49a95012b547bc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f7d87527523e40b91b432cb4b3f67a5226b2a32c15ee938896a3fae71b02cb04",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\04a8064dcf4048668dcc09443c4cc80a1447fea33295f9ff2fe98074f19658bd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6ce0ebd19e8055babec62d3be7b9dda5b79746f265843cbcc1698e6d19656755",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\16e681577b57a190f1f02c6c7a644deedf09cdd6b73457a212991b48aba7368f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fb403a237110c48e44eb8691e018209081ce22fff1c6a63e2f20388b4fabd2ed",
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
 

