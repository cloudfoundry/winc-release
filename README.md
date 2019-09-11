# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1803)
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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ff7291e42c4f3a475d9bb2f166bc5507206a3de2a905bdb1967d3e6d83f665f5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0a3b930b61f00d653a4c3925d63fa5f2989e0594d90b5fa876f61c561a953b51",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d2fe540c92a12a7febadcf64de5c246d7f0551e8a970e23e7186e74e4a0a2440",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dcaf4859f0585909d9e1d349a06460c00944154cdd2fb24661ddc4d4c7712cd8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\485a1ac389894f84e115aa866e8598c0d29421b4465c228bcbff10b4bc24e890",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\952c7ab966a378a992f8c3858c8306bbd1543706d0310524e38795d04d4d38b0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb1a9c71afce4af4c17fcad99f06cb24f85f4e61e93d37dbb06cc0ad2a50e414",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9abd2db685e5b27dbdc119171e092c45172344a1cc7581c1ded87894f06b38f7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\01f03f87724d626211802f6575832156ebfb3b5f2278ca9e5d29d7b495afbae2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b6c266a192ae8158cdee759ffabb457142f121b6e594b0e2e48826148c4b8106",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\00fb29d65f1dd23e700c1f0a80529c746dc8e2f09e7cdd7f7417f4a5861eb2f8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9db6024c63c7f4d7cb60365d3aa65e9057e21f5aa8057e28c71978c9503adcf8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\004fbc788c2d42ca97e866cb94d2863054257f306ef12be8d5e2bc682a75ab46",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\485ee75a1365c8be8f2b64e967d912ac539b1c68611b77a92c206c319daf2040",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9c9eeca2734fef89504a90fc18ff8bb684aac9d80a1c50b14d2dd1d38bcac42a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2e9a39c6c551aad1c2c40a1550354cbda700a8dc9e89f9a08f757d47d2fb71c5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1cd1ac688c8e567786a373641419e29c9e99e5df039b3541b7ab82d8b3b762df",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\863447bd7402bc9f5f3cab66b14f1a14469d8fb0a106a1908c0423598208d610",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\72d260201dd9e783e77809aa462d7c24eba6c8aeaf66bf06414920b22f1debcd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bf503064a766eeed5096e5d72ee5a4d770901a07582ca51abc46b348d21c8d14",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cf75264fae4c11a75cbb1519e48d36e0a8aa3d675f800daeba607839914e4247",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\70bba925263c1c193fa7bc7f79b1aa062707b09fe7774c7896b8aaf091b901a9"
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
 

