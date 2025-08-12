#!/bin/bash

set -eu
set -o pipefail

THIS_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CI="${THIS_FILE_DIR}/../../wg-app-platform-runtime-ci"
. "$CI/shared/helpers/release-note-helpers.bash"
. "$CI/shared/helpers/git-helpers.bash"
REPO_NAME=$(git_get_remote_name)
REPO_PATH="${THIS_FILE_DIR}/../"
unset THIS_FILE_DIR

START_REF="${1}" # ex: "v0.0.7"
END_REF="${2}" # ex: "v0.0.8"

get_non_bot_commits "${START_REF}" "${END_REF}"
echo ""

submodules=( 
  "cert-injector"
  "certsplitter"
  "diff-exporter"
  "groot-windows"
  "nstar"
  "winc"
  )

for s in "${submodules[@]}"; do
  display_go_mod_diff "${START_REF}" "${END_REF}" "src/code.cloudfoundry.org/${s}/go.mod" "${s}"
echo ""
done

display_blob_change_info "${START_REF}" "${END_REF}" config/blobs.yml
