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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\27e07f01a31db3b403589e69408db5346982b8ad7e453bda354dcfb90fcc4a34",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a303882957580c991deb54c4df9dce8db13bf26a2463ee9fe53f881d56444bcc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2a70f4ef488a7412d85a0d9757fd0d39d8add4bc44c5903b4d164084333265db",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0833293aa4ba921183cab6fb3f7d924bcdc2e6f95c06d6a6fd26c36003fc9d6f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3e046e0893339d8d7b4f7f4f75e0197f5d6f2fa3d736ca22b591835d1c69d80b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2a3511c5c52be065aacbc79fabe9fb5b923685535ad8ae9a2cb20d3ab88eb4e2",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ea8b0f775a4540007f0c5c634ca79de1de2697383f501407d87035050d8029e3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6b7dcc983a18510378fbaf300d94cdbe0caa59f72e9f763acd097309c3df3017",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\941821952e11cfda4d30defffd4ebe53fb94b4fb823b557e4c91e73e157bfb29",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\974bff964e59c8554b2f9cf892c71e3ca35c5f09c08e09152896cda57bbf5289",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d1ce9da75dafa4187c856686b06d78a6b2eaafec1f9f3373b56001c90b711432",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\820f77e1adc37e347317b7685d4ed6ef75db04698d8d784d4a8905c20dd45403",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\578ad153ca656fbb7549358716d7151fd84d7755ac68b282eb03b037794deaac",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe0ae3a8d0cff9c211b7d8ac8be6a1f799f5b22a8c7da7ddce150efac72433cf",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5ed2c92cf3544d77c5207bd1753b1ce3d9ce21980e549a369a5f4b5d6888a730",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5b98180f688f3621fb06c0da98b09b499c5cbffce844961a11244591a26c0ac5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1aa17a693867a85c36a8e98b395cf9efc244c93cfb4b1372384e8576146c0c64",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d9fac1b24c5b90397e958f532b3892f16287427a505a92f55a800c7c57156d6a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8c2d081fc04f7f51b0407d0e26015d86ecefc0e104bb341845ae6ada95c59d50",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\18605b5d435bc524a3e71409a75514e71b196259436aef82b85d97074e9b8d51",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0913791473179d24169ae1d1243722c55422a89d56dfd3b191e5cbfe96bb349f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a1d834d8080d2203db3a7bcc0f9e6da6c48ddb797a4ca903c4a177f2d0d0ab29",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c7ddf9ee4fd19a4db0b49f9b10c7901979213b9e1b52ba57e623af2f3e2b7c90",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\382af2c725ee5e3e5653b0e2249077368c2623f7c42e381ccd6744008f513a43",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a4b03f0a8b1d50d565bf85024c0afcdc0ef040c628e9ccede3dabf8712d499cb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4007b4078b2219eb2ea1ad5119d97403a8a80148144a0904265d43cfb4625504",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1cc8c1f5fb49f0ba41ea0388b621425afbe38307a35a37e3a1bfdd4b4c174f23",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\e7369cffc2dd2af7177213a98d3cf46d5bcc99335175865f174793aaf6fa65be",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4e49f222db27fda1ca9f189ff53b8a1e751b530f1983e8de9abcca300cf62764",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ca57f7431112f4e66865a8df569f29b2d85b31a3f2e1d99deb60ba3c4ae57830",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3e6e3f8b10798fd78027341127571aa263ac5dd10d23cbb1d7790c1f47a556ef",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d37190a40e909425195ab8fcb1db81a2edb6000c4331e2c56afeccb5fb18a1c2"
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
 

