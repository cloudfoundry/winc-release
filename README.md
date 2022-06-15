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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\70a0f5ac1a294898f6765d2984ba5f6d1d33638020ea2c11af9fb4867f3027d6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0ca5fa622a7a322352f3bbf51fcb406440879d6742382b44f4bc1a25d48c1074",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f57c5461728fae089b65fdaa8844105c0efe2e62921d58d589ecb4c65df74bb0",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b03eb358055dcda956aa7332f7a3a57c150e2fdc94ab4c80b73824377d5e5120",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\06a4cec494b200dc359979d2a20eb428a157341adc4202add27a56838aa22951",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6204ccf918034b328a8a79858bed0c32847178af9bde647a963b5d3366e48327",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bb82d34807181adc72b1c398e28a73e5973794b34a6040aa8edee4a28184aec5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2c5ce5c5fe4543b213fc8bba380901170d3a50bcdb3431c6f617c6ebfb37d1aa",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\64cb3d6b8313ac8d3c54a2e376d7e7a2ce493dbfe0e2ec1ef2270f63ec07015e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\be8dde0cc6d7e0d1afd5e213fd17ab6be334332c0b9ab587ce3385ea68f6b76b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1a579b5d2a2783f4652f61d65cb1b7aa63496c3d12da25d737f2d4d810a6650e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bac240e3ea106ea4e6ea8087e3f61451468c6c267e9ff53c845df99f24e05d53",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\357c278a23aab666349937eddbebd195d5e596e40f45ba42cd5f95f334dc6610",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fe0c2a5e91bcfcd1bf6d677e95b6aa8d1b07e1c9092a8694b154d80dc5ed7543",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\68f1725b99bd352e91fa003891ed9bbfc7785d30c15f05e0fab1e60295b1b825",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1eed322f4e8a5521edd8cfbd2cb910c8f378f4d9054c475ac6ce7c21c242e869",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\170b1829ee8ea99055acdcaae432f4d39d76b3ec36ded85a2a3dab3cc100af15",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\62006e12d3addec98224de589edb70164beb437c60cc6de46f161b97a036ea4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\95bdc99a57f34d198637407fda6830d52b146b3954821d71ce500448638c6368",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5de530c4e3280c687451b7c5442e23e0550701723122a7e00809e9e40896bd4f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\135ba7f3881e282f34b8d1ff0af05a870068a759541d254b6e1e3b217dbc55fe",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5845e054dfe29371fec47673da8891fcd8ee2dd5c919c35b1e5fb7dcef664501",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\52e78fc6f3be8b875ac40fb5aa7a375d13e10dc3aecaa8ad71340a8f087e6c71",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8b5b90ad772ac6d431cc349ad3d7227177f221dfce047b5fd57eb715e47b7a9a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c240d0c63ad13e5944bf81873672ede2b85ca55f924898b53fcdaef8434eb2ba",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d4f0d683af3a6f5a7581fc3ad4c72e8ade6ecca94a42279684886d9536a84f5c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4ef905066787f2587d7abf4f4dc4e54eab6fffaea64b4698af72cc2c10482fae",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2383046bebe2ab71bceb813b372cf7354d77f53f70f901d8dfb3801a274cfe07",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\63a7f3999dbce261a521e4c39ce27991e7adb73eb97c6880eede745fc1791052",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6819822a4936baefa5b63c95c7e04cb6fd77f7ddb7f590aa91b4d10ade92a78d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2194459f44a28ee2e9124a736c7815ee35f77ff12612dd1cf87d21b7a347297f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a29ec3aaeb8c261aa514a525f4827588182b9a8a3cfe09460809b658c4e10c6d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d6fdd6832d95a5f537e0e7d87f2613ea9741ad9c20438b9d5a2697a883c4cd96"
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
 

