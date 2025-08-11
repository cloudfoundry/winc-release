package main

import (
	"errors"
	"flag"
	"fmt"
	"io"
	"os"

	"code.cloudfoundry.org/diff-exporter/layer"
)

type Exporter interface {
	Export() (io.ReadCloser, error)
}

func main() {
	outputFile, containerId, bundlePath, err := parseFlags()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error parsing flags: %s\n", err.Error())
		fmt.Fprintf(os.Stderr, "USAGE: diff-exporter.exe <-outputFile outputFile> <-containerId containerId> <-bundlePath bundlePath>\n")
		os.Exit(1)
	}

	exporter := layer.New(containerId, bundlePath)

	if err := writeTgzFile(exporter, outputFile); err != nil {
		fmt.Fprintf(os.Stderr, "Error writing tar.gz file: %s", err.Error())
		os.Exit(1)
	}
}

func writeTgzFile(exporter Exporter, outputFile string) error {
	tgzStream, err := exporter.Export()
	if err != nil {
		return fmt.Errorf("Error exporting layer: %s", err.Error())
	}
	defer tgzStream.Close()

	outFd, err := os.Create(outputFile)
	if err != nil {
		return fmt.Errorf("Error creating output file: %s", err.Error())
	}
	defer outFd.Close()

	_, err = io.Copy(outFd, tgzStream)
	if err != nil {
		return fmt.Errorf("Error copying tar stream: %s", err.Error())
	}

	return nil
}

func parseFlags() (string, string, string, error) {
	outputFile := flag.String("outputFile", "", "File to save exported layer")
	containerId := flag.String("containerId", "", "Container ID to use")
	bundlePath := flag.String("bundlePath", "", "Path to the root of the bundle directory to use")
	flag.Parse()

	if *outputFile == "" {
		return "", "", "", errors.New("must provide output file to save exported layer")
	}
	if *containerId == "" {
		return "", "", "", errors.New("must provide container id to export layer from")
	}
	if *bundlePath == "" {
		return "", "", "", errors.New("must provide bundle path for container")
	}

	return *outputFile, *containerId, *bundlePath, nil
}
