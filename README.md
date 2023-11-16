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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4353cc5504724d85488e0c84afaad75f73ce041488d9220f5a8c430b35d36602",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37c8c039ec7709b4d5233ae1a9110b10af1e2d0e699d4e7c90114385a8cc545a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\71c4fa0bf5fc9ef94aff1c0e833bd81ec96b1bf49fc7975dbb14921a0ea3f75b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4a0dae0add904bc0b40e451742daa998ac14ef763dda94cfd4d5f951bd6fb182",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0278ce365013cf6bdc3074ac272e05eb8e5d91a455d9bc94bd51989a39f08e16",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\94330f6062ce978b0aed4254261d5d1dc5f167922723c751b8aeff8e4874744d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ced6da968d87318d939444223d00e76bb4020571f3ebe8599f7e2719aa802ba",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9dfd2f9e403d766e59b15ddc8fa3c6c222b55ccf3add88b0a4c94b36d9f3bedb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c00cf77b5be69a7c12fc3a118a6cb15a69f5fce4781da67ccc61b6abee3fde4d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6e0e620fbfd53c1f0775ed3c968ec9a80b0dee68b52c2226310cec29a9747d0d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cc6ae0d0b4bc4422e2a144dd9b1f22be501e601bef918efd44d90dff57e9c79c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\94019662e71880b39c2f71ab39af58899d6172f2c11c63c7dfc45eb44a840441",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8fb08244a82d6fe5a35be88ca82c056b09e3c1e34ce12282d6fff4b583d0df61",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\91ba72606ee5101ce06fcd3a55fce0a5f60e0d3f0e395e996a379b6351d49f7f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41e59ba294787b1418d85de510694b16f1b87a63ac1a2c78f3dc8f4f18066149",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\08aa996f7ab2dd0291d465a56bfabde80ccb2075a8f3e28ea38ab41ace029104",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c6fb20bf1c6697c6e98ed6e6a0628c128126f0833260c71a0de945ae79bbab9a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3b1f93298eee5e844dad2a2b87633c466425f668239194e939969c4236796f27",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3df3f163c8103ea8eb0584b4b859816fef116ef2a67d25c5e0f194680b7916e3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8a949cb0d92b95ed30de42b40863a56416f6a18fe4180ef4eed9190c6455459d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\88be45329315b2fe057e532daf2cb4a484e979c4fadd88aae8c22891f9203fea",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\635e501ebe31f77b5c9284ef587d364bbe4705e421db6a2643b6bca8a51071fd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\02e452effbe0f97b507813dde5ba0fb6ab85dcaa3c3f93d2d19afaaf75637abf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5bdf51d1ccfce6c24832ff65ddc5ddf28254c47fead3222ce94015653057fbe5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a69ddf862a2826abf8c874eac9999c2c46ff17ec93485fd061282c26a29eec59",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\74a8ad35a69585a151114a3353853606d01321b0fb3c31ffa476daef52a1023c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\232802ad99a9f9db11f06a560d492e334fa8c182f8b41f3ca145b54cf276dacb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2bad0629d4b07e01dbaa189a80199f85cde7b4f47791dbd4fee474c8bc522629",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ddd7530a6285a10a1b688dca243f1ba20772e5dcbebc6259d07b0c7be7b41932",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\414c69301752584e25146afcaaf6d58070f3a0c19384f3cece78d86f6a1c0d30",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\32cc8fee1fb7b6e25ce59fff9a99ed759465175b567cb3f97a04a1e1b642aab8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a5086257c21d9946481421c1a92eb1b2a1cb1819ef790758b7297af9c745a1ab",
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
 

