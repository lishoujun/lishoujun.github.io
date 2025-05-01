#!/bin/bash
set -x
cd /tmp
mkdir -p debinstall
cd debinstall
rm -rf *.deb
echo $0
echo $1
url=http://cdn.download.yyyit.com/output/net.thunderbird_128.10.0esr_amd64.deb


wget -O tmp.deb ${url}
sudo dpkg -i tmp.deb
