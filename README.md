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
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1da457ef55da699fe8a63657637c3f536f52f1cc0c856d9e51f25ec4d1af98b7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\243c83bbdc7668804e295e9f6931258cf5b639332335ff2ced01c9957a36d42e",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c30dd8dd8d6b0550b1d562c02343bdc572413e6fc4c9dd837eedbcc761194568",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7afef0c889a768322176fef66c95a617c6b10d6df28ccce67afe87d68f886348",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\46d99fbeefb411cfec17f3bb40445e686d5c1477369a219a0aab9fa35db3887f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\3d73d24ef821966d9bdedab72bb65ac279b14612e87600b63d767f91c8b19d4c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8e72285d42bd8a607f38bd7d148ae88eaece9a985814ec5c186a3deaecffac23",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\93a2702a66f34f2389b07a877e08b63db432148a962e7edbe600d7495cceda80",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fb1c90bc6a90f549b1d8b14172a654ac77b360a4ef4b047f9283545642270a4b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\70548db49512edbbca3922964c7ee4d25d5ec975f2b37f1e6342540fab6aa242",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cba3323b27f15df82d28e4a43ef4198486bb0e83a4b257c05a9ba8bf0a329024",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8bf7235834db69361dee12ffb266f7325b255c791b351535ef79a04b72b574ed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\340ad9f7ed5893f0a6caadbd22db69e431fc336e173e1422e88eea609e2d5672",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\09c472ae6695e7f576c81afb0b894bb80cb0e40bf8e0cd2eca19175ac57b6204",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8e3d43c588166c74959c36c1ae1ecbcc26f53fc5853fc93df7524fb356073d53",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\de33c2105aeeefc5f12a4c6fcb2af92dcc795c20aa49683eaff4da9c35459272",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\6d593ba7d0f862710df6d824a87f949916154ebc5705b2c8dae1980073bee261",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8fb14345d712021c6ffc41bada5615aef26f5832aae899ad72c39af5a43a64ed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d430518311c7569889630e298a5467a81bad82e52f3d16b82ec4fb4abf4f6c66",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\a5c36071af744f4557a6120bdea162497bb5a80bf5dba3aae9593735ec18ed49",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1117e7041cdf9e97bea9c7595891b53bc8d7ace79b85cd4a6bcbe3906380ba8d",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\33cef70b5e8a190f509cf5deddf6ce94314d71365fca7ee960499bb8340e0a34",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ab26966c9fa2ed39440f2ecd8250fed7a19e9fd1e8fe1d8114d70814fd26c8af",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\86dfe47bf12c3302e71c52bbf08af05bab4bfa14cfe5d9fb1a57deef6212509b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\1391693ae1bf4bd0231a99afd40a21f7d504f850b741bdb679bde9657125bb13",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\41466dc6d605475801644401b750f2f5445173f2d01913fd8e1322b251242bed",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4d756f6c83c31edc0732e1064d4e73c838fefd2a31a11d4ffb73dfc4c89b6be5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\bf69e0af6e202701ad9d52ffa088bff97776c8e7c680a1219673246be312cde1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\d086ca2ab890be70bf5dd6491ca4ff2d1fc15f753e7efdadc18b3110de0d7ae3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\759930290ae2b0ccea81519056214d9361ed8f89d59b9b2d84e63515713d1635",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\c1f16711b884dffdab5b30118f98af537444d2a025d6b25709468db8fa4371c5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\990672bfd84e556bf80b0a91fae9000b5f3a6944ac04e1550f0cca378e41e47d",
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
 

