$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

ginkgo.exe -r -p --race --keep-going --randomize-suites
if ($LastExitCode -ne 0) {
  throw "tests failed"
}
