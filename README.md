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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4622b88fdd3b93a7b6502a6ff0e73738093715e66c816a25ce197d530a3f1ca0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1e0cf8987ff7ca84734c24c10e4fd08a23dedb1034cdde0733c3869d4f799b58",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c6e53cd0de70975c5f2d979049c93cd02389f944606e728926b9f5e873b0bb64",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9ddb3c1e1caeec4a477f813bae6051c63ad142f8aee9f0ab623b1e24601734e0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3f9f13514c5f293789befc8a02c2d69274be56d5a618a649690fc44f77f9e681",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b65b85ce8066ef2687c0928f45596228e47100091d81b9dfeec6c949dee39a25",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f30c25b6add15b7e9cd34d96fe238d4e5147ba8597dfe49612bb7215d5affa7f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\86f668cd3f481127c1adea629fcbc97ecb507b1aa2a124c73559e7c33c610c27",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe2dcc7a30be9a2797b5f17ac642ea726fa852c15e50fba817aa21729c4f13cb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\10e37ce141ff15b7ec72104226b2a8d8546b2cd64996e48822035bd5f5f51549",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f30e2c55b5897039f7d47c120a9fe26ad6c4e5ef0c76ab5b07457a95a5287f13",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5c73a51fe86a48d0f0f8c1e7997a70756e0544d7abec350dbc7cd86a91207120",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\96fe075a5ae470632af99c5ad66f8f88224f1c9d90d7d320e09f0d851e997413",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\da87f963b03c109ddae830063d63e44722c285defc73af21ef856105cd56c842",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\36c21ce39d4fd86971d97d710c40b1d03ca19ea60ab3d03bbb5bd35f8c7e4ebe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ba2837c1cbbb0cb9fe127c4c70afba8418cd043f7e74087ae683da122a7084ed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\53749169e417129f25ef5d1a12e4594c74097cab9e7566743a40beab27ac73f5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a13b259ddf2985d3e0e580b95cfc62859a1ed4897b7ce6bcff1fc97fd8035432",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\60b7468fbecd8094d89e43f2a31b176f0f173d7a284849c48012d3adfda1de01",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\290ece751ece6bb3e4de6c1bfe46fb65a4df5e710be30b207f08b2cf64faf79f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ad8782bbe48d04fa47a32d53a9610b724351154b19e27dd5b1cfca25842decf8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe7cf29f34684ac90af7673cc83140d2e3e400847189e2702de40746f5d4b41c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1ec2492e400c91e7f958ba700715593dadb8b9bef0e74e555b44236cda4ac033",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d9270fedcbae9a581ac76689fe3df68b692deba78bbec695626b76a8655f8c73",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dce3d7dd3d86abd701808cbe8710011293010f2f26808067aa0e4a8e61b49c67",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33e01b90fd497ffa91acae133f47c7b350dd46a920b6d33656fa322812208a24",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e88bb208bc38662d54ba2bcab67688cc6c63d7d1d5450fea7ec1f850d706819b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f1a88eeda8a34c7e68ea463c368ca886ca9a6ca387e7dc8d54f54b3e27cd26b5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\150262fdd20361c96aaabc8d09b6e4f5b3e4de46087e0ca9ca8743ba80d9d2e4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\691b309bafecf31e96e08af2aca57cff7c83794bf8e38ac732c251f86e607be1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\be7bead3fe5cec3c6130f0fc23b8d79eb2ca363cb2a0b558cab9d448c99b582c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e4fba260ea914f14581c6152d185ca2f9433abedc53fcbcac84421a23370a4f6",
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
 

