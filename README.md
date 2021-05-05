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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\154dbf6973049700be2340d1069cee4dab074128c9ae84370d8d6cd633121c59",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a5b1d91859764fca2b4bb696c075336de0beeddf70346f05d71f826d3d76b6f4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5eede2a7112131a9aaaa827e32eddacf9d6fd70c2cb20c467931a760a0d0f2a6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e5ea4c520a69915a28fdd3a82819c45937ae6bf9c359de7c48c4f670b9f13ead",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e926315dd1a1f4efd940744191ebca36a5538b0467cb82219d1db6ad4fd9a9ea",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6a9a5691bea36376ebec6a96eb725dac6cf8de634e26713b7743a27d271acd5e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\039c738196d03eea43fcc6d63d3f15d08a3ea37762f32c65eec44205a0a2d5f4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c7717360adb25a7337cd4d1fd55256d640d922dcb91556002ef387479e617914",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\30e0aba719d673e59990f8703fe639d3f5a8e4a79a5f94cec485599c37c4877c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\82d92f5f040854a3ee6591c6d391e2afedaf9125a6803ce056bd0c5776e5c211",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a9a9eb069496b4f3940ee86a3130996f5662b28ba8913b4d0417cd49e822f451",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5c7e3d523fdb43cdc8b8b6e7b7ee1bb1e36b795955abfe8644541699b6c0b73b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a40de1aec830f5d11b5859b961fad0662683ab9474c84a5fec3cb1d60d0ed674",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6bfbde9c1df29650fb624a43606ff00cbaf5bcd06e610d42cdc496eeb83b15a6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\437b96a2e56caf733212d41230eaa622cfcc1d2cbf35eeecda36ba28f6d6d5a8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\086dd879e3ca6bd68e60534224ce124b728e643db847fca872adec0f1ebf6169",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ce416ab8cfb5b102f8e901504f4b33776dd252cc24e70097718cb93f41053e34",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f4d025b2202a2d15194a79074a40e3c2bbc6aba988ae07937574086e87955dbb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\15b11edede1334610ef98009947648f085ebcf100b2d53e2f8bd18fe679ad7db",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e3b95198cf8f4ac29347938728b37145cbb271a43b12e7168e0f51d26f97ce78",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1c220459592a5d24d8a5927426377f325c2f592fc4a5490186f3bfbf61c6ae84",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4eb30a3ca3c5dea22062d0fd748f643569f8c701e57991edca1fbf7fe7bf00b8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e8f17d4988e090c273cc236087867d2c889ae61045313eb6850674721193bb22",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5cec8d17ae2d37708057fbf8c2fbe3484692efb0b0517e88edd2592f84036538",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c7ceea3fccca2ac2a91a4e4b1e92b090a21838d526b08d39dd5a97d5ea92b1a3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c165b5b403dba17a83980a9ff6f35afdf9149094aec65fa8a256a5f7f05fa65a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6ef6588df9716a669c6088fb53a894e6c16220596aa6fdf1aba7c7289170df7c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\416496cba26bfd734f1be1bf02098151a2aa3e023443cf9c4134f013e58694cd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dbf053c678acdb027d675435e332d27282657d8c2f8b295183df399daf69e7a5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41566670e46bd6f49a5b5b483e16900f9f673b0ea95188def5ad9974ed98359a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3b8b8cd1223d68fcf3d9eee32d5bee0a1b8fa3be42b554bc51d129706a09324e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c30ce8f596301b335d06702c17415b93a216dccdb323d63e3f25970db09b64a8",
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
 

