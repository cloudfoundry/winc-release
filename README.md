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
    "ociVersion":  "1.1.0-rc.2",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5892adeb079bea92d7f9d4426fb9c9ac0aa1a289562fcd8efec5bea24b4684e6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\faff06fdfa5be54d3f9c3ebcdaff62ad23d18578f454e7fd21d1983f51666b5d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\5716fa20c759843425300dfb2a7dc8060aec20594d29f004d82adda59189a44b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\0ce883537cfd892ff95048b67d77228a9838d74accaa158b1a2c3a030c2d6522",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b9715206121c7cc0d697fca572459aa81f0c8e5ba0fd4581b3b568590197e93f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\767a210cfad517b7e3d582566ff9e563533cc17b657a721842f0b05dea6c292c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\76a0d103fbd8ed684c60d527e533b63c497933ac12d9f82414eca9a28de7406d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\620a704947fea30709b1355cb510da3ad71ca78a3270796a7e66c6d6da8341db",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\af706e76175469672236289a10a1fc99196ee7e4e35ceb3d9fc49e3e4ad8e50f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\50ce871f7c77f063cd4a6a7323c3a7d295ecb166db45566c3ae7e7dc210ec06d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\577e94e428e41ae7846356bf0dbf7535039d54bea2399c4ac7e2df3197d6ee94",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3c84a084b266c47f16719371752ba006e2fd5ca2ab271e1e461cf7c11b25b04a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f3b5b87218b5f6ca262251a9f6072fce4e383bb4091e6c239ee9355278b1248f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ca4245d898f1e9a3bc34b40adc19253e6d2dcf69585c436dd68b15ebe9db0a85",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\064cedc4596560477343bfe8e57cf8299a4065cfee2c21af4d7130b38001bede",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\eb2a8a9787e22fc63724d96eb3f8de332816fb522eaaebe4d979578aac60c905",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\9fe12e38da876bfbcc382b1627275ac5010804b9f6725d127a9486c02d2ad9f6",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b94cb2e8ff4ff72bf43adb513abbb41fff4f7db46970ccd868896ed1c454df21",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ab03c73a468743b21e7a061241fba4b5ba20ec4970f6a511103c2d5ace2c91be",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6e0160b580eac5c51ea5bbaf93f72f73f5133e346d6481b6ae4d1b9dd2b5e38a",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\abc43285b174dce6c9e7a6216f89e6120f054c8df59abb2b7b1cb8efbd473acc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4b324ddb1860a8d4899df2e214530193a33eb131452a9bfd030dd98462cfe380",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\98096138bafba2de4041f7f8c1b1a7105a752375a95541b6b71bce47cca26425",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\10ad387b415b8c08e9f37064ed22904cd23ec830998dad7427d206a803ce5cdb",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f09ed7d11a6acdd3092d2dcd583507f248de699a23519e5dcbb93611d1768f65",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a2657a5131905d0185c92b5192a9e24aecfbf7aa39806ca3de87ae962fc9e101",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b2cf04d6d3bf61d290ace2864409e8856703d801084f99d147a6e29f9aa1a7ba",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\aa4b3d84b1e614b2d730f57605d2a70375b4673500b27027fad2ea27f06553f8",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ffea53f5bf048db4175b71567a7ad954d544a75a50f842ed0f6e6154ff51ea27",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\db296291ea5f5937700bc49d2bc3f8b3eeccc4c2b4619b5487f07dc3f3a79996",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6c8d2275e0ddd3050398dd7edbb5dffd3d0f534c0b67a98911c7d10a4e0cea83",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a4320a53ae222d8e93e06c76604361dbd0443fd9fa5b3bca95afe88271e7ae9b",
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
 

