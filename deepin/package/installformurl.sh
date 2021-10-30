#!/bin/bash
set -x
echo $0
echo $1
url=http://cdn.download.yyyit.com/output/net.thunderbird_91.2.1_amd64.deb
rm tmp.deb
wget -O tmp.deb ${url}
sudo dpkg -i tmp.deb
