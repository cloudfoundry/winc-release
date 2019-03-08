# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1709)
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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\619a5e79931fccf4081e7058ab6153162a88641ca80caa4020576f9b672b45ab",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b128277df69a058f1b9b861244f08c7215e0fbba824e4d2a9cbda7f427a9e74a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c9173a773aaaa08152b613d0c9cd6d1e09d39b89a84cfdc6a5557404bcd3c3ef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\246a7401583078585515d4f12a29f9eb72ceed73eff64c92d3ac036cbf20bc42",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\31e7f8f8151e45af175d9da3d127d7658415eaa6d39a35c44fdbcd5995bc6dbc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\45f647f2a12eab5145b4cde9aa6eaaafac263ef2857354403486eb369a013751",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e88683821f2162ce95e2810dea34b0777f86485269caf7dfe502095bbfc3a3e9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4ca04a183352620d6bfa3aa11c96faea1f72b79b91129e14aaf3cf6dc8796d74",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7ef5ae090928218ad6eca647d0d2f06db00efc6c823a9ecd9c4b291e84f2ff48",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\946d083e8575a47b5a92c01b50b254923ae22ac145738170b9858a33ce99621b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\14133328bf197b88224397f39625173a1d3afdaff780504370d0b62f23ffaee6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\022fb276b9f744987bf102fd2d89b08b7eb6b7812a0879ce299dc2703b61c179",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0b8ebf8b2fcf0537cdcc839ea361465ff711987f4a0fed239d8ce2ca7d54f504",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4e507b106a651ba6723b0a8410e876863a1daa92e16d62f04e5b0b790e489ee6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\40cab09869b979c0def3f0bbc8842895d205c4d7e7183b5f84297e46204492c3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\51bf609e3b08c7d72887a284191fa1f90d83f64c451196cd6674fd78614d48d9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cb674467a6ab17b792ae7fa27eabcb027af8f36c5b38d0828ce99682badc8bec",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4bfe49d7bc33014df317149be23a71dfe176f2ddd6a78977068a37973dde89d8"
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
 

