#!/bin/bash
set -x
cd /tmp
mkdir -p debinstall
cd debinstall
rm -rf *.deb
echo $0
echo $1
url=http://cdn.download.yyyit.com/output/com.browser.softedge_95.0.1020.40-1_amd64.deb
wget -O tmp.deb ${url}
sudo dpkg -i tmp.deb
