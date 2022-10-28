#!/bin/bash
set -euo pipefail

echo "Getting upstream"
sudo git -C "/opt/drawio" pull
cp -v /opt/drawio/VERSION /opt/app/.sandstorm

echo "Gathering client files"
cd /opt/app/.sandstorm/client
cp -v /opt/drawio/src/main/webapp/favicon.ico .
cp -v /opt/drawio/src/main/webapp/open.html .
mkdir -p images
cp -rf /opt/drawio/src/main/webapp/images/* images/
mkdir -p img
cp -rf /opt/drawio/src/main/webapp/img/* img/
mkdir -p js
cp -rf /opt/drawio/src/main/webapp/js/* js/
mkdir -p math
cp -rf /opt/drawio/src/main/webapp/math/* math/
mkdir -p mxgraph
cp -rf /opt/drawio/src/main/webapp/mxgraph/* mxgraph/
mkdir -p plugins
cp -rf /opt/drawio/src/main/webapp/plugins/* plugins/
mkdir -p resources
cp -rf /opt/drawio/src/main/webapp/resources/* resources/
mkdir -p shapes
cp -rf /opt/drawio/src/main/webapp/shapes/* shapes/
mkdir -p stencils
cp -rf /opt/drawio/src/main/webapp/stencils/* stencils/
mkdir -p styles
cp -rf /opt/drawio/src/main/webapp/styles/* styles/
mkdir -p templates
cp -rf /opt/drawio/src/main/webapp/templates/* templates/

echo "Compressing assets"
find . -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.txt' -o -name '*.xml' | xargs gzip -f -k

echo "Creating file list"
find . -type f -printf "%p\n" | cut -c 3- >  /opt/app/.sandstorm/sandstorm-files.list

cd /opt/app/.sandstorm
make server

exit 0
