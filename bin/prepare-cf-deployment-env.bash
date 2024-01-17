#!/bin/bash

set -eu
set -o pipefail

bosh create-release --tarball ../prepared-env/winc-release.tgz --timestamp-version

