#!/bin/sh
set -e
# Run the reload script once. This will catch cases where files changed while
# this script wasn't running.
/reload "y" "${WATCH_DIR}" "..data"
# Run the reload script when is updated
inotifyd /reload ${WATCH_DIR}:y
