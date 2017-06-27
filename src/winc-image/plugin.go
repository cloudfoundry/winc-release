package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
)

func main() {
	dockerCmd := "(docker inspect cloudfoundry/cfwindowsfs | ConvertFrom-Json).GraphDriver.Data.Dir"
	rootfsPath, err := exec.Command("powershell.exe", dockerCmd).CombinedOutput()
	if err != nil {
		os.Exit(1)
	}

	escapedRootfsPath := strings.Replace(strings.TrimSpace(string(rootfsPath)), `\`, `\\`, -1)
	fmt.Printf(`{"Rootfs":"%s"}`, escapedRootfsPath)
}
