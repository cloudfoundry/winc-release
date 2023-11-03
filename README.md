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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\df2079ea56c071379010c063e6f2d2293e5bec3e98391a014e624f21d516ef6b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c6260bd879d48307c9dc4a6256ab4e7fc31c25fa6eae3c21c642e9af6a56f47a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\20f9ff1a8677c19c5fe83f916a5ad3d67a1222f57470cef75cbeda3d0eddf249",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1ce5ac8a521fce33fe3f3473597778bd368d36e72702aa2f20db453190fbde16",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3a4f95fb160f5db2b06bac13090b9c9fea3c241ab486ea941d80ac37c3450f84",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ddb955da55432916bd10e70788000f66aca5ec16bdb6481e624a1312fb87e498",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\afb24d2901f35e4e2ea46a815f17c011ff5297a7bf93a0baffdeabc6dd6b0b1c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\618c8debcec0ec47858e376eb7e6af06597748cb8812fdcf5c412903d9dd98bb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\527565912274aff20c5315367a56f285194eac654a73e56c4e07d8331962494f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d854ea1b3758caed442d65a667505a342196b491a3be905a86048a8f931f126b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\64ed38427c68b3edfbdba4d1d629608b834d966296a61f1124472c1bd464c919",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c0adac0fccc636e6f2688d6fca51d5232619b404a329137fc66b828407d7731d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3bff820b6d4731877abbcd569024c4675dd9e34934356d06e5c284c7b2238436",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f587c87c94380145b3a519c29782cac0036aeae67d07246fb610cb4c19eab6c2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\47bc0e720bffae50644ee71f991c805024d697890c4dfc0c61b39ce61a2cf454",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7493a7e939e10a2d1c9a70c45477b2194fb3c93503c3b221c561af373147213c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a1e1241e5b8e2ded2aaa26eca3130392339c3762d4d5e128ee431cdb2e707beb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8f953f8c501de7bed47b9c46ebf5c5440ab3b9d3d0f5773627202d9b8cf7eb42",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6ebd70f476dd33795e515c3ed0b865343663093787c8a830e8d3ed6200941799",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7c1576524d0c59de84d2004ac55ae9a311dbc705047a1c56dae5e872197c888d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\47974dfc37d9d581487b1acfb40f464cc19da873f3e30a555379d7867cb76165",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\af54aa236aee48029253a4a7d1c7ecdc4ffd95bf9f11673ee9bad87d7df4f927",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\630bcd174338f273c13dd120631b14c3c49f75bfe0a4c0fc0822eec89e2e302a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0f756e01f2f147785e017cb17fe510431ec7b4076c873eafb59cf83d2bfdb5c3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb05e7686533d6277e0fd5e4305052dbac7b4ee0c36fa984b07fb3cb71625633",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\42f65fd20efa0a0463f16e322404c172f44a874660b1b4fd9115bcb68de1c440",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\52d1548d2e96d5a9628a2c62784157a8ecfa7f5d49e08d8ba3410c65ae6d7375",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\311c16b316987f6ddc7e49b521e85b1b8780b10750f4f3fac2600c88ef34eca1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c9d279659eaf523e05d9801d5cf99251cd9ff5e40f72dd63e01d7c1b524ae4eb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d95ad5e85f3c4fe1f9a89790740697d1ac3946582b8ad946abdb2da593b0763b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\854eab7c63b8375d6406c67144ffac5acfb27f66b99ab836cab12714aef7cf04",
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
 

