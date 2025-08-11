package integration_test

import (
	"os"

	"os/exec"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	specs "github.com/opencontainers/runtime-spec/specs-go"
)

var _ = Describe("diff_exporter", func() {
	Context("when called with the correct arguments", func() {
		var (
			bundlePath  string
			containerId string
			bundleSpec  specs.Spec
			outputDir   string
			outputFile  string
			err         error
		)

		BeforeEach(func() {
			bundlePath, err = os.MkdirTemp("", "winccontainer")
			Expect(err).To(Succeed())

			containerId = filepath.Base(bundlePath)

			bundleSpec = helpers.GenerateRuntimeSpec(helpers.CreateVolume(rootfsURI, containerId))

			helpers.CreateContainer(bundleSpec, bundlePath, containerId)
			helpers.StartContainer(containerId)

			var args = []string{"powershell.exe", "new-item", "C:\\hello.txt"}

			_, _, err := helpers.ExecInContainer(containerId, args, false)
			Expect(err).To(Succeed())

			helpers.DeleteContainer(containerId)

			outputDir, err = os.MkdirTemp("", "diffoutput")
			Expect(err).To(Succeed())

			outputFile = filepath.Join(outputDir, "some-output-file.tgz")
		})

		AfterEach(func() {
			err = os.RemoveAll(bundlePath)
			Expect(err).To(Succeed())

			err = os.RemoveAll(outputDir)
			Expect(err).To(Succeed())

			helpers.DeleteVolume(containerId)
		})

		It("outputs a tarfile containing the result of running a command in the container", func() {
			_, _, err = helpers.Execute(exec.Command(diffBin, "-outputFile", outputFile, "-containerId", containerId, "-bundlePath", bundlePath))
			Expect(err).ToNot(HaveOccurred())

			Expect(helpers.IsGzFile(outputFile)).To(BeTrue())

			stdOut, _, err := helpers.Execute(exec.Command("tar", "tf", outputFile))
			Expect(err).ToNot(HaveOccurred())
			Expect(stdOut.String()).To(ContainSubstring("Files/hello.txt"))
		})
	})

	Context("when missing outputFile", func() {
		It("errors", func() {
			_, stdErr, err := helpers.Execute(exec.Command(diffBin, "-containerId", "some-container-id", "-bundlePath", "some-bundle-path"))
			Expect(err).To(HaveOccurred())
			Expect(stdErr.String()).To(ContainSubstring("must provide output file"))
		})
	})

	Context("when missing containerId", func() {
		It("errors", func() {
			_, stdErr, err := helpers.Execute(exec.Command(diffBin, "-outputFile", "some-output-file", "-bundlePath", "some-bundle-path"))
			Expect(err).To(HaveOccurred())
			Expect(stdErr.String()).To(ContainSubstring("must provide container id"))
		})
	})

	Context("when missing bundlePath", func() {
		It("errors", func() {
			_, stdErr, err := helpers.Execute(exec.Command(diffBin, "-outputFile", "some-output-file", "-containerId", "some-container-id"))
			Expect(err).To(HaveOccurred())
			Expect(stdErr.String()).To(ContainSubstring("must provide bundle path"))
		})
	})
})
