#!/bin/bash
set -euo pipefail

git -C "/opt/drawio" pull

cd /opt/app/client

exit 0
