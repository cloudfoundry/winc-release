# winc BOSH release

----
A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

## Getting started

Clone it:

```bash
git clone https://github.com/cloudfoundry-incubator/winc-release
cd winc-release
git submodule update --init --recursive
```

### Running

```bash
cd winc-release # if you're not already there
bosh create-release && bosh upload-release && bosh -d {{DEPLOYMENT_NAME}} deploy
```
