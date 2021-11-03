#!/bin/bash
set -x
cd /tmp
mkdir -p debinstall
cd debinstall
rm -rf *.deb
echo $0
echo $1
url=http://cdn.download.yyyit.com/output/org.mozilla.firefox-esr_91.3.0esr_amd64.deb
wget -q -O tmp.deb ${url}
sudo dpkg -i tmp.deb
