#!/bin/bash
set -x
echo $0
echo $1
url=http://down.yyyit.com/output/org.mozilla.firefox-esr_91.2.0esr_amd64.deb
rm tmp.deb
wget -O tmp.deb ${url}
sudo dpkg -i tmp.deb