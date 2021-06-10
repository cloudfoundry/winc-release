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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c62aa2bfec779c19b98875f78c91158d04da348fa57d4fc18f13b3ed38271399",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3fba241a7a2bf00db0fcc27c052897ae7ee3f9805cbdf367a3eee66c7ccabec",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a21d517d8da7f146f125a0155892248d2047673774fdf16157f4e61a1f11a14c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b2f4d66132ece24d5bbdc504060ea7e6345234b9d6576dec411ee5ffd40957a5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d352cf5a2025466b2bd497d2907f78d7fb08dabb4b0ff6799d0ef289083b1df0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5d879e0f7a819a7761e0f85997a55b8c3a702d7fa0c766b4c4286e4fb4c622d6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e2959d6125fc4ece8fb2de14d8e9f80b790650e4c4c90219fe636699601412d7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5057684e6ef3fb50bed4b397f967afa586219ada0dbd357f129a09b22826c624",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\26ad896fd5f2ce5122455493f78adf08d571f16e1ffa8513477c897c9d45838c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\90080d3726cb0679d08c79461e358ec1f973dcc881cfd16f39a60aa176e7f0c7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f80b96860c3fe057f9d5aa042d3c972be853117f238d7006958aebb486974d3c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fd264cbb5707ebcee8e0e212302a5636dcb811ffb8e27c978e4c90ea94f4a1a1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d77da72cb393899df4868d086be3bb99a4ec50ae2df942558f2a541972da43b1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\328967a1fe5ac15f548b443d1d956ce030bb07842234da07500c7b520a165727",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\262a9324764fbb7b3df2ab081de14984e9af7e8726562910e3545e260e28d26f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c9780ed78439d92e07b4ed19c09b7694b8486462831418e0fea73cee5fa053f0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9349a0b74f650b301e4056d92499b7108d7853880b305a8ee6ed25466c4fb2ca",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6dfd9e1bb4cc7ebcb305144bab5c9ca286e6a69ab9137fb4612544bc8b42ce16",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7511af504794ac21a98b6c02a104d99fbd3b47780efabffd617159e5a00e099d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\518e2409244e0ac358e35b34300bbc95249ab68465751a9e9a6004abb26e8358",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a116367bf9c9891e42779dbdb4a4bcd28d1d745c8a73724683d5d5aabbd8a030",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2be64e92da22b41509f7a70d9c1a9ff29cf7f1d3221b3716f98d434c665f865b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4d3bcff1d21939094b20d296172161ba9fabb6c910c6a8f534747cc060728359",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\de86fe223cb478c2b400243eb233888ec5fa0e8a4a6b445dc6c3059314115ede",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\794e3e38e63f9bf23581004e32060f23f8fce3ee93884cb3a55c9325cebbd579",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c4dbea128a74b46cee912b7f2190d9b5e05c86fdf3b30b107994abd30c9019d8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cc688056ccc954ade5cc4c739ecda2360bcafb8c5ea11171f37d8df8a62354a3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c7928932d578341b88bd1f6608a59f90607fd27a790354ce8f557a89715222d0",
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
 

