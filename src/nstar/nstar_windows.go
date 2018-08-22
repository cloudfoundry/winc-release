package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	acl "github.com/hectane/go-acl"
	"golang.org/x/sys/windows"
)

func main() {
	switch len(os.Args) {
	case 5:
		streamIn(os.Args[1], os.Args[2], os.Args[3], os.Args[4])
	case 6:
		streamOut(os.Args[1], os.Args[2], os.Args[3], os.Args[4], os.Args[5])
	default:
		fmt.Println("Incorrect number of args. Usage: nstar tarBin pid username pid <compressPath>")
		os.Exit(1)
	}
}

func streamIn(tarBin, pid, username, path string) {
	destination := sanitizeDestination(pid, username, path)

	exists, err := fileExists(destination)
	if err != nil {
		fmt.Printf("failed to find file exists %s: %s\n", destination, err.Error())
		os.Exit(1)
	}

	if !exists {
		if err := os.MkdirAll(destination, 0755); err != nil {
			fmt.Printf("failed to create %s: %s\n", destination, err)
			os.Exit(1)
		}
		if err = acl.Apply(
			destination,
			false, //overwrite
			false, //inherit
			acl.GrantName(windows.GENERIC_ALL, `BUILTIN\Users`),
		); err != nil {
			fmt.Printf("failed to apply ACL: %s\n", err.Error())
			os.Exit(1)
		}
	}

	cmd := exec.Command(tarBin, "-xf", "-", "-C", destination)
	cmd.Stdin = os.Stdin
	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Printf("tar extract failed: %s\n", output)
		os.Exit(1)
	}
}

func streamOut(tarBin, pid, username, path, compressPath string) {
	destination := sanitizeDestination(pid, username, path)
	if err := os.MkdirAll(destination, 0755); err != nil {
		fmt.Printf("failed to create %s: %s\n", destination, err)
		os.Exit(1)
	}
	cmd := exec.Command(tarBin, "-cf", "-", "-C", destination, compressPath)
	cmd.Stdout = os.Stdout
	err := cmd.Run()
	if err != nil {
		fmt.Print("tar compress failed")
		os.Exit(1)
	}
}

func sanitizeDestination(pid, username, path string) string {
	var destination string
	path = filepath.Clean(path)
	if filepath.IsAbs(path) || strings.HasPrefix(path, "\\") {
		containerPath := strings.TrimPrefix(path, filepath.VolumeName(path))
		destination = filepath.Join("c:\\", "proc", pid, "root", containerPath)
	} else {
		destination = filepath.Join("c:\\", "proc", pid, "root", "Users", username, path)
	}
	return destination
}

func fileExists(path string) (bool, error) {
	_, err := os.Stat(path)

	if os.IsNotExist(err) {
		return false, nil
	}

	if err != nil {
		return false, err
	}

	return true, nil
}
