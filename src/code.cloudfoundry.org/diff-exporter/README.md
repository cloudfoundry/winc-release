# diff-exporter

The `diff-exporter` extracts (exports) the diff layer given a running container ID and a bundle path (that contains the config.json). The layer is saved to the location provided by the `-outputFile` parameter. The output layer is of `tar.gz` mediatype and the filename is the `sha256` of its contents.

## Building

Make sure `GOPATH` is set. Then run:

```
go build
```

It generates a `diff-exporter.exe` in the current directory.

## Usage

```
diff-exporter.exe <-outputFile outputFile> <-containerId containerId> <-bundlePath bundlePath>
```

## Testing

#### Requirements

* [groot](https://github.com/cloudfoundry/groot-windows)
* [winc](https://github.com/cloudfoundry/winc)

To run the entire suite of tests, do `ginkgo -r .`

The tests require the following env variables to be set:

* `GROOT_BINARY`

* `GROOT_IMAGE_STORE`

* `WINC_BINARY`

* `WINC_TEST_ROOTFS`
