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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b5ed46e98aff09fe404031e63f87aa99e32152f0fc732242b9c93308914571ab",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d9abd9f8a4dca3201c230f4aa6b1e47681ff299f3b588cc2fdc6d0aeee6c7b98",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\733c54790d49a241ff2d69265022d71f08d9ecb8a972b09bd4eba57771ed2c6a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ae8d72e91d95521bc63be310c96572238775362f1da28d37ba617e1e6da53c53",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d9db79b20ccb96cd31e8eeb639d845a3f084facea3c90de264ca2e29115510fd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5210b35a64e0c05b6e48ba1c352f68791163aebed59d193a1b97f0ea101a3070",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ec8648ff20f2fd6397b03d454c192ae94630d39a74448b3dae6025282023a02d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\96eb0d408eefb577f01b3da0b7eb6a4282d209e43df224ab9f0d3541d3c670af",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bfabd8b5516b528e070b80d4d411acf9f1c051980754ad22b35c8191b14f3d28",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\764b62355dcf5d9ee8ba37b37978fa9b6cce13e245d2cf02e69b998e4a8049bd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7d6fd5653b77849c6134827d312a38b9feb2c4728363132fcdcb77ebde6b4f7c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d9615c35377170372fd94d36f616fe19a329be454506c619e96d555ba6b3c167",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b6ab22405b945e190303755341a7f9e155fa7ddbe1247f74b259f386c67ece86",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\39497eca22565d461398c6c32eaa59d5ab437fef049ed485ab46af23d2e725c3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\47f436bfded807c6aed972b9de31285d37f09dddf39bbc3b65164fcb57924963",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b4dc5525be3c0f9b6f1dbcd90d7e1b1925f9d2e01321a3066acf0e181b4d53a9",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f9cf9c9bf1ff15af8811bac132f7b562088f12aba0969146fcf2758af9e8260f",
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
 

