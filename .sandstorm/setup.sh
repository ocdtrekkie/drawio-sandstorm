#!/bin/bash

# When you change this file, you must take manual action. Read this doc:
# - https://docs.sandstorm.io/en/latest/vagrant-spk/customizing/#setupsh

set -euo pipefail

sudo apt-get install -y g++ pkg-config git make

sudo mkdir -p -m 777 /opt/drawio
git -C "/opt/drawio" pull || git clone https://github.com/jgraph/drawio /opt/drawio

sudo mkdir -p -m 777 /opt/capnp
cd /opt/capnp
curl -O https://capnproto.org/capnproto-c++-0.10.2.tar.gz
tar zxf capnproto-c++-0.10.2.tar.gz
cd capnproto-c++-0.10.2
./configure
make -j6 check
sudo make install

exit 0
