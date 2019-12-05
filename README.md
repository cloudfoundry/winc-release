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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d9e373fa32d822ef262db12d2b9404436e6496e54b92de22b5e21b7a6043bee",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a32fa9c02f5235c826a082ca74e2733db306beb0bd10e4833f3c69a272af5e41",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2f1756639f3c2936d81bc3fd3f50ef6e97998e49c8d5261f91a7c355dae49efd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\432fa07287d7c7796dc711ce2cbc6b588e1eef4668432eae5c5c18876937ac18",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3b6246d2098a8b3887ed102534b82321dc3e1fefbef306e970d4cfa746c64d7f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d41ca9b73096a9d5fa0484550f4f2f8ebc66a07508c6f079463cbddaea454346",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7d528e49486ebb6cd96481930ea49a350e13aa41b95c65739a0671c27bb68db9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f41f9e46a601a4fbefc3c9aa83f9a7d2c38273ed7f42cbcb957c784b6f1f01b0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\52dca397a03c5b1dc34e8a08689beaddaed1c06c4fc49297126fc9169164649f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b2ab60048fe8caf9793910bb3b3159a336d69799786c30f6d0f45f733a6da2b6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7ce5b6f8327344dbbeac5a0a9618bec15679b256f162392a45237b1dec4e69ed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9f8865bfedb7ad6b9ca23f7bb2478d4345d9f6425e64703f8b2129067658db88",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f7f30f9deaaf11e391e0191a809e83a9bdb7051b6e7b954aa35459119b29403f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c8f59ea041ec2e95b1024046d7889f6eb321eaf9c3d52d19f2d441628d8d9311",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d5f9ef9e728cdfa9e0bb070cd704d4ccb9a62d5b49fb2a90c37f5d297805e95a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\608beb73227ff2d5ea56d584f3c638068a118813b2f8e0195a3932cf539e406d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2ad82fe9d3cc1ae45e8c02a5cfdbedd0594488b86d5ca3a055fcecfe2ebba213",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1d4526a0987db0c462b2336d18ed852a3a0304c98a7f5cc732fb267868ee57c6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\05c79b02251fc428e88167a76422f79701b405d882f01eff66f892b99f8810ad",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1191b7f41d112bf397608599eb96057d3c19fe6e35ce87196b693f0160475d71",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a4ec178e205275458db94aa56e22607f2006916ede3fa8b508d6d039647ef10a",
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
 

