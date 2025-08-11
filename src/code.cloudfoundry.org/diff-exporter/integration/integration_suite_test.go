package integration_test

import (
	"os"
	"strconv"
	"testing"

	testhelpers "code.cloudfoundry.org/diff-exporter/integration/helpers"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
)

var (
	wincBin         string
	grootBin        string
	grootImageStore string
	rootfsURI       string
	helpers         *testhelpers.Helpers
	debug           bool
	//failed          bool
	diffBin string
)

func TestIntegration(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Integration Suite")
}

var _ = BeforeSuite(func() {
	var (
		present bool
		err     error
	)
	rootfsURI, present = os.LookupEnv("WINC_TEST_ROOTFS")
	Expect(present).To(BeTrue(), "WINC_TEST_ROOTFS not set")

	grootBin, present = os.LookupEnv("GROOT_BINARY")
	Expect(present).To(BeTrue(), "GROOT_BINARY not set")

	grootImageStore, present = os.LookupEnv("GROOT_IMAGE_STORE")
	Expect(present).To(BeTrue(), "GROOT_IMAGE_STORE not set")

	debug, _ = strconv.ParseBool(os.Getenv("DEBUG"))

	wincBin, present = os.LookupEnv("WINC_BINARY")
	Expect(present).To(BeTrue(), "WINC_BINARY not set")

	helpers = testhelpers.NewHelpers(wincBin, grootBin, grootImageStore, "", debug)

	diffBin, err = gexec.Build("code.cloudfoundry.org/diff-exporter")
	Expect(err).ToNot(HaveOccurred())
})

var _ = AfterSuite(func() {
	gexec.CleanupBuildArtifacts()
})
