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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\43b3829fd83c0c40bbb3f0d6a3b5ae1ca23a5e063e4242e7b481a5b82c254ea3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\91108d17171209e63c69f46a97d638761404fa0f53ba7ea991fa75b9d6de3f17",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\546e987a17bfbb0fe3c86a92cf692a617fda387e3fdfe3cd05a32ee0fad354ec",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c8f088dc7a8b6056e4a861a153ee74b68ad866153f4071ea97b6b9cd33a0a6d1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\35bd2dac1ef99a968e3bd23c38d94930a0e802834488cc364caecd6f78b482b5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3437eb88ba9bd14670afe6ab14e9fa01959761e2136eeecb84e9ebecbb5920b7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\96c11072f34dd7dbddac5b9c91ef08ebcb1d7abb1f3d32a17306c287b5f4ad4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9ce855f4b28720da73b9eddc67a3c12e4806934e8a162a2fc8a0699c90c7addb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\410754aee040800ab90287b4e2fcf1ca66a3f222a1077292a803def4dbf45446",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f07c99bd47702194ca1311254e2a20c48b1f7dc0d700eb19b320f1fa630c31fe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\37532487403428ddcf91ef183654939d59d3065c861534501c275369e4e66ee0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e09c82e251fefbe1881d60d73a98492de90167a55266c612bb935ac256d58295",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6e33d0e405503f671a90be4558a33e1d6c303a264f5a307801a13e3c3b5e12b8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e1a85321435c651d61674558aaf48b78e88ee1bab0c8af1b44d46b3e60ab3e6e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6c5610ab04ca30aa800a9f11697df782829de3d6f8335b5eaef59972ed736b99",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fd04d02301f0030cfb4fb490ae51c357ffceab0d98f40314e3ff24d6b69e96b4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\970ae1d6d1bac13f0272e5052e12e5e82d2977783f955af4ae1dee04a51be35b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d3eeba5b62f2eb12f42d221c420ed25db42984e5f2723bfc1436b8d00588a3c5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ab30b8cae5637b334477a6319657c9711c3071cd6b1f1b7571ea49731a0c5e54",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\df051cbe5bfba1c8eeb91779712a88f3432650dfe611a5790520a5776be54325",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\40632ad23a540520e479cc44c64e2ca6a7bd8e8729ba7b81a5adacea8246828f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6fbccf067488b50d873dfa58d70f0ccb0aae383dd5eb42ef12c39b1890b8a0eb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3cc30558d084460cae2bd132a269e43ccdbc13d3a8f563c0533051ecc1ddcdb0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a89ca50b26a096ad8aa625c80720a5f07e5e941ecb712dbd63df57c078d34d1f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\730a43558ed0352f48fe74f6b23ce35000664f1e71f24d69f251bfefeac8c2ee",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7204edef88f2570bb74e6b3b82edb9ae35e22c7ea778803d675fbe6d1a2f73b3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe7d19b84fddf3e2b6351cfc66ddbb3209b187508316d0a2f170e657603daa1a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4fd7d047c959f5fb96277bce21501a42028f7f29ca260cb90560149bcff13dc9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\caa39d17d9f49cb9676da24c18cdf8749e2c7eeca2ad54d232dee6c55e3e7868",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8ce0c9ed6164319ff2c5d3a394a02a13d05d7a8297017226b9f7ee7524be04c8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\00a7aac312b93d898299a4756924c9f287a5f74442ca9d762910a317013c2ae4",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9634772c712bb519843225cdd2c5fcfc61f67ceaf5b460d7bbc4da9d98e8b757",
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
 

