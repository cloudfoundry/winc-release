package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
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
	var destination string
	if filepath.IsAbs(path) {
		containerPath := strings.TrimPrefix(path, filepath.VolumeName(path))
		destination = filepath.Join("c:\\", "proc", pid, "root", containerPath)
	} else {
		destination = filepath.Join("c:\\", "proc", pid, "root", "Users", username, path)
	}

	if err := os.MkdirAll(destination, 0755); err != nil {
		fmt.Printf("failed to create %s: %s\n", destination, err)
		os.Exit(1)
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
	cmd := exec.Command(tarBin, "-cf", "-", "-C", path, compressPath)
	cmd.Stdout = os.Stdout
	err := cmd.Run()
	if err != nil {
		fmt.Print("tar compress failed")
		os.Exit(1)
	}
}
