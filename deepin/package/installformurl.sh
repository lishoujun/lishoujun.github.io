#!/bin/bash
set -x
echo $0
echo $1
url=http://qiniu.yyyit.com/output/com.browser.softedge_95.0.1020.20-1_amd64.deb
rm tmp.deb
wget -O tmp.deb ${url}
sudo dpkg -i tmp.deb