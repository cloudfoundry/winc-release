package main_test

import (
	"bytes"
	"io"
	"io/ioutil"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gbytes"
	"github.com/onsi/gomega/gexec"
)

var _ = Describe("Nstar", func() {
	BeforeEach(func() {
		rand.Seed(int64(GinkgoParallelNode()))
	})

	Context("when provided a path to extract to", func() {
		var (
			pid                 string
			username            string
			path                string
			expectedDestination string
			nstarCmd            *exec.Cmd
			stdin               io.Reader
			extractArgsLog      string
			extractStdinLog     string
		)

		BeforeEach(func() {
			tempDir, err := ioutil.TempDir("", "tar-log")
			Expect(err).ToNot(HaveOccurred())

			extractArgsLog = filepath.Join(tempDir, "args-log")
			extractStdinLog = filepath.Join(tempDir, "stdin-log")

			pid = strconv.Itoa(rand.Int())
			path = filepath.Join("c:\\", "hello")
			expectedDestination = ""
			stdin = bytes.NewBuffer([]byte("hello"))
			username = "some-username"
		})

		JustBeforeEach(func() {
			nstarCmd = exec.Command(nstarBin, tarBin, pid, username, path)
			nstarCmd.Stdin = stdin
			nstarCmd.Env = []string{"ARGS_LOG=" + extractArgsLog, "STDIN_LOG=" + extractStdinLog}
			session, err := gexec.Start(nstarCmd, GinkgoWriter, GinkgoWriter)
			Expect(err).ToNot(HaveOccurred())
			Eventually(session).Should(gexec.Exit(0))
		})

		AfterEach(func() {
			Expect(os.RemoveAll(filepath.Dir(extractArgsLog))).To(Succeed())
			Expect(os.RemoveAll(filepath.Join("c:\\", "proc", pid))).To(Succeed())
		})

		It("hooks up its stdin to tar's stdin", func() {
			stdinContents, err := ioutil.ReadFile(extractStdinLog)
			Expect(err).ToNot(HaveOccurred())

			Expect(string(stdinContents)).To(Equal("hello"))
		})

		Context("when the path is absolute", func() {
			BeforeEach(func() {
				path = filepath.Join("c:\\", "some", "absolute", "path")
				expectedDestination = filepath.Join("c:\\", "proc", pid, "root", "some", "absolute", "path")
			})

			It("calls tar with the correct arguments", func() {
				Expect(readArgs(extractArgsLog)).To(Equal([]string{
					"-xf",
					"-",
					"-C",
					expectedDestination,
				}))
			})

			It("creates the destination directory", func() {
				Expect(expectedDestination).To(BeADirectory())
			})
		})

		Context("when the path is relative", func() {
			BeforeEach(func() {
				path = filepath.Join("some", "relative", "path")
				expectedDestination = filepath.Join("c:\\", "proc", pid, "root", "Users", username, "some", "relative", "path")
			})

			It("calls tar with the correct arguments", func() {
				Expect(readArgs(extractArgsLog)).To(Equal([]string{
					"-xf",
					"-",
					"-C",
					expectedDestination,
				}))
			})

			It("creates the destination directory relative to the user's home directory", func() {
				Expect(expectedDestination).To(BeADirectory())
			})
		})
	})

	Context("when provided a path to stream out", func() {
		var (
			tempDir             string
			pid                 string
			username            string
			path                string
			compressPath        string
			expectedDestination string
			nstarCmd            *exec.Cmd
			stdout              *gbytes.Buffer
			compressArgsLog     string
			compressStdoutLog   string
		)

		BeforeEach(func() {
			var err error
			tempDir, err = ioutil.TempDir("", "tar-log")
			Expect(err).ToNot(HaveOccurred())

			compressArgsLog = filepath.Join(tempDir, "args-log")
			compressStdoutLog = "tar-stdout"

			pid = strconv.Itoa(rand.Int())
			path = filepath.Join("c:\\", "hello")
			username = "some-username"
			compressPath = "some-file"
		})

		JustBeforeEach(func() {
			stdout = gbytes.NewBuffer()
			nstarCmd = exec.Command(nstarBin, tarBin, pid, username, path, compressPath)
			// nstarCmd.Stdout = stdout
			nstarCmd.Env = []string{"ARGS_LOG=" + compressArgsLog, "STDOUT_LOG=" + compressStdoutLog}
			session, err := gexec.Start(nstarCmd, stdout, GinkgoWriter)
			Expect(err).ToNot(HaveOccurred())
			Eventually(session).Should(gexec.Exit(0))
		})

		AfterEach(func() {
			Expect(os.RemoveAll(filepath.Dir(compressArgsLog))).To(Succeed())
			Expect(os.RemoveAll(filepath.Join("c:\\", "proc", pid))).To(Succeed())
		})

		It("hooks up its stdout to tar's stdout", func() {
			Expect(stdout).To(gbytes.Say("tar-stdout"))
		})

		Context("when the path is absolute", func() {
			BeforeEach(func() {
				path = filepath.Join("c:\\", "some", "absolute", "path")
				expectedDestination = filepath.Join("c:\\", "proc", pid, "root", "some", "absolute", "path")
			})

			It("calls tar with the correct arguments", func() {
				Expect(readArgs(compressArgsLog)).To(Equal([]string{
					"-cf",
					"-",
					"-C",
					expectedDestination,
					compressPath,
				}))
			})

			It("creates the destination directory", func() {
				Expect(expectedDestination).To(BeADirectory())
			})
		})

		Context("when the path is relative", func() {
			BeforeEach(func() {
				path = filepath.Join("some", "relative", "path")
				expectedDestination = filepath.Join("c:\\", "proc", pid, "root", "Users", username, "some", "relative", "path")
			})

			It("calls tar with the correct arguments", func() {
				Expect(readArgs(compressArgsLog)).To(Equal([]string{
					"-cf",
					"-",
					"-C",
					expectedDestination,
					compressPath,
				}))
			})

			It("creates the destination directory relative to the user's home directory", func() {
				Expect(expectedDestination).To(BeADirectory())
			})
		})

	})

	Context("when not enough arguments are provided", func() {
		It("exits with an error", func() {
			stdout := gbytes.NewBuffer()
			cmd := exec.Command(nstarBin, "1", "2", "3")
			session, err := gexec.Start(cmd, stdout, GinkgoWriter)
			Expect(err).ToNot(HaveOccurred())
			Eventually(session).Should(gexec.Exit(1))
			Expect(stdout).To(gbytes.Say("Incorrect number of args. Usage: nstar tarBin pid username pid <compressPath>"))
		})
	})

	Context("when tar fails", func() {
		It("exits with an error", func() {
			stdout := gbytes.NewBuffer()
			cmd := exec.Command(nstarBin, tarBin, "IGNORED", "IGNORED", "CAUSE-TAR-TO-FAIL")
			session, err := gexec.Start(cmd, stdout, GinkgoWriter)
			Expect(err).ToNot(HaveOccurred())
			Eventually(session).Should(gexec.Exit(1))
			Expect(stdout).To(gbytes.Say("tar extract failed: tar error"))
		})
	})
})

func readArgs(argsFilePath string) []string {
	Eventually(argsFilePath).Should(BeAnExistingFile())
	pluginArgsBytes, err := ioutil.ReadFile(argsFilePath)
	Expect(err).ToNot(HaveOccurred())
	return strings.Split(string(pluginArgsBytes), " ")
}
