packageName=org.mozilla.firefox-esr
VERSION=91.0.1esr
currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source


cd ${currentPath}/tmp/source
wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/${VERSION}/linux-x86_64/zh-CN/firefox-${VERSION}.tar.bz2

tar xvf firefox-${VERSION}.tar.bz2
file_kb=$((`du --max-depth=0 firefox|awk '{print $1}'`))
echo ${file_kb}
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps

cp -r ${currentPath}/tmp/source/firefox ./opt/apps/org.mozilla.firefox-esr
# 包信息
cp -r ${currentPath}/deepin/package/org.mozilla.firefox-esr/DEBIAN ./
# 图标
mkdir -p usr/share/applications
cp -r ${currentPath}/deepin/package/org.mozilla.firefox-esr/Firefox-esr.desktop ./usr/share/applications/

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb

mv output/${packageName}_${VERSION}_amd64.deb /root/lsjun/${packageName}_${VERSION}_amd64.deb
cd /root/lsjun 
./mymail.py ${packageName}_${VERSION}_amd64.deb