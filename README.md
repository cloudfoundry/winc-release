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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d4d4de6f1ae70c8da9a9e398861138aec97625bdcb113ecac533e91c20c3208f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0bcd59b25bf199ab29c1ed33bd923df45ef731ff0e64182d7d275a1084cdb068",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\024af21faf3c573af916c92e60b2e29e8c7c314b3f7c123e804616870d202718",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2a707ee498484c872e6666415fc98badc57f06e0ad8e6936e00b251d5a0ba45a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fbb67b17c8bb6fb8b8d4f71c582de78e88486f887e8f6927d9d6266e92d84ddc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\30078a0c04553334b2dc9935ea69ded2f46cd794eac6b631d43cf124aa54c783",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d0d59e00e8986de59be173bc2e4c6d3abac33c9fed6803ce7e3ee5ed65ab2c9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f8682d5574b1d6d11f0ee50281fef62c1d69cf4394455cc053b38ee4d26e9679",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a10cfb9b31c4ff253126295d9b9d3f76987c88e2c1c583ee3c357c5405fb1ded",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\243a0a280b253f09737bd7a03852afc461196485f9a278a58a9b3458e95334c5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\174c6106bdef3954324bea343b528bb0ec3f966b3e4a1081521eca501db82977",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0fa58718e20e9572c04d19b147e6a237707b79f2c52883a992378e53495a65da",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e11e1eedb55d99ee3c2e61a535b7f23c02cc3301346b605fefdc5522e79064a2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\170240042e8c8fb0b3255905fa493c0774ec6d21c24ec3bee89ef5d884b89fe5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9213004014b575f5d936aa5741c33e65993c77e4b871782468939de3c0ebd0fb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3ff0e6dda1c9d619f7ce9dc332a542ccc1c250afd3126e58e33fec8936ac49f4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\51219ef4c5cc683674e4b02a7b75c53eb240cad1f772a8abdcdef71cac94fc2d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4173e02debaf9279a14b69f9075023de2870dc72b5014a9aee00263a493185b0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9d2196dc9faf9ae7eea6ca6c14c98d5a58d5e73e71ac911d0afc4311f387da38",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\db6dff17389bf8c0305c3e706ccf11e692af6c1241fa107ef6539b9abe3576cb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bad4bc2dbb75b1489dc142933a2ea667334bd407aad662087d0ef9b27817d4d6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d6b35aa9d0bef5739ac26364cd962ea51c66abacc686c1c15fe26db00e075d9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1481f60238c1cd90742210146d9142293d3c57f15f04355961c238f3859846cc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6ab8dd7aeb12e785702a2ffa2ae52ba6b5ebf3babf8ad4b072a6275bf1906eed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\53d050c3dfd7a252ff31006ebaf4260a3c48374e75c76e991698f240370cfee0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\38ab7cee35a336755607634e6d205a8cd7e9aef0eb1b5b0c7f066089cc4f2d89",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\261180a5a6d2949dce0bf17a9d9ae95f050a14923e0e7b1663297f6b90532603",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7fac25828504c1e05898a2c0381517abab497998a0f1a758809fdf86c62b3b78",
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
 

