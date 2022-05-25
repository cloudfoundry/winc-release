#!/usr/bin/env bash
set -eu

export GARDEN_WINDOWS_TARGET="garden-windows"

groot_path="$HOME/workspace/winc-release/src/code.cloudfoundry.org/groot-windows"
build_groot_task="$HOME/workspace/garden-windows-ci/tasks/build-groot/task.yml"

if [[ -f "${groot_path}/groot.exe" ]]; then
    echo "groot binary already exists at ${groot_path}, using that one."
else
  echo "Building groot via ${build_groot_task}..."
  fly --target "$GARDEN_WINDOWS_TARGET" e -p \
    --tag 2019 \
    --inputs-from "winc/winc-2019" \
    -i groot-windows="${groot_path}" \
    -c "${build_groot_task}" \
    -o groot-binary="${groot_path}"
fi


winc_path="$HOME/workspace/winc-release/src/code.cloudfoundry.org/winc"
build_winc_task="$HOME/workspace/garden-windows-ci/tasks/test-winc/task.yml"

export WINC_TEST_ROOTFS="docker:///cloudfoundry/windows2016fs:2019"
export WINC_TEST_PERF_CONCURRENT_CONTAINERS=20
export WINDOWS_VERSION=2019

echo "Running task ${build_winc_task}"
fly --target "$GARDEN_WINDOWS_TARGET" e -p \
  --tag 2019 \
  --include-ignored \
  -i winc="${winc_path}" \
  -i ci="${HOME}/workspace/garden-windows-ci" \
  -i groot-binary="${groot_path}" \
  -c "${build_winc_task}" \
  "$@"
