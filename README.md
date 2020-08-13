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
    "ociVersion":  "1.0.1",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bf859f1307adb4e7d875856c6fa17674d9a4509011fd6b488c4d837cbb1da7d9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8836eaab201dc06728ea22bbfeb1a3e7533778653092b8f83ec1e9988dc53cbf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\af0926931fef515d7a64a7df830b1d0aaeb7adaa60e05c92e0684288991e9ac1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e1c5f4635330cbe24ddef46036ef15033672880810ca19eb84548898b9a852ec",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\816331e5d332214ccf25e891cc13bc926c69913f0eed16c9cbdc71b9e82d5369",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d4ad50c952d0c0c0c2bc8026381a049374943ad784a27e02c9305d5978ad681a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\56e1d74a6f6271f7df3a668881bc87f3e0cb65bc62f99ba38905ecbb021468e2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bfeddc8d0a1baa0a12c99b5027a3c59fc29df86be0753714cd745cd35df0f2ad",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bfaa43652b088bbc50ae8f17ffd09e5397dbcb48400dd7e7a059f8079fdcc719",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f84861b4ccde589f65dc9103fe85fd71ecbfc36a409d129127cbeb7f6d64b3ba",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\983db74a62212ceab3470461b23008d562e2e94b741999d1cdb8012d572b12f0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0e4d5ffa71ba5007f5a560c2ce5f1877db9285454a8d8d467e42b8a67e7272e4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8a8d4fe02adb47936fe2a2a984f23adf086c901ee2a2f67505bff278c2ceb4da",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e2b5bf314b0a0f148e3ed0eea74ea7b12d17eb3cbae2e76e7c79a1301fe3c625",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\936bd49d472bc887b532a7b7f6021a8a2f1020c6b131da95d4b19ca7c3b5e6ed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\521a91d8e9b4e524208d21349d15e6848b09858d81e96592c6d3aec9a896605f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a71f7f1abdf4bf0298630b2be2194d0805ef60eddf42bbf69e34977e69837ae7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4fda9ece1a219ff0a3d255836e150179982843456f746195682d6ff00f883a2f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\43eec1ec54f4529d16db13d88ec625d6c8a511b1f9d56830a1972644d92aebe3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\79550e725adda8ef15a555bd27bf7364f65e0c4860267bdfa779376c322c2817",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\238762a1b08afb8fcfc2deefb3cd29e5c210c260b8801a8d12e355352e847ed3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5bc1d3e71038b3cd5d4733385c932a5b2b76067a09684e4a234a26871b7103a0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\474c65893bd6f4eaafb81e94b7bfe7651cb8640e0b6e38835e8105b623816155",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a7b45a41ad5e1631542feaf11ae25a9cd505b99ea37a6f0b210d67acab892468",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f7b6aa2e7f0e0d05fbbd7186a7b4a34f63f761f214f4c4ee5960ef0468900fae",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ced1282440f238e5b5f7cded44f85b918fc5febe1a10231ed04f8950802b789c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9381f4f7bc725cf2134edbc684e380304abf025fc4662795abce7d0e68fb1db5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\578aeae14ff609632e25ab212f18cb4052e79cc6d49204e8c1764ecf0d62d860",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5dd44c303afc9408bbf09bc9dc174eed1dc4bfe83d77a6fa2d6bad796b4ee198",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e0a7ae89a7a44eb9e2a7ae3e469199c46f5b307a423e733129fbc5bca322aa25",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\85878eb55f4e6eeb0173262f5c24c42d530a87408078242eb2e222c4d35f0f46",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\55b5e032fe5f07b7655e712bf7c30ed959c9dad3de93cdaed023c169e7f41b04",
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
 

