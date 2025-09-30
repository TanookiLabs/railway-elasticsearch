#!/bin/sh

# Exit the script as soon as any command fails
set -euo pipefail

# chown the mount to allow the elasticsearch user read and write access
sudo chown -R 1000 /esdata

# Set _JAVA_OPTIONS to disable container support for ALL Java processes
# This affects JvmOptionsParser and other early Java processes
export _JAVA_OPTIONS="-XX:-UseContainerSupport"

# exec the original process that the image would have started
exec /bin/tini -- /usr/local/bin/docker-entrypoint.sh eswrapper