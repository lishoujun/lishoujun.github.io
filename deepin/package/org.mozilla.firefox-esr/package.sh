packageName=org.mozilla.firefox-esr
VERSION=91.0.1esr
URL=https://download-installer.cdn.mozilla.net/pub/firefox/releases/${VERSION}/linux-x86_64/zh-CN/firefox-${VERSION}.tar.bz2

currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source
cd ${currentPath}/tmp/source
wget ${URL}

tar xvf firefox-${VERSION}.tar.bz2
installed_size=$((`du --max-depth=0 firefox|awk '{print $1}'`))
echo ${installed_size}
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps

cp -r ${currentPath}/tmp/source/firefox ./opt/apps/${packageName}
# 包信息
cp -r ${currentPath}/deepin/package/${packageName}/DEBIAN ./
sed -i "s/Installed-Size:.*/Installed-Size: ${installed_size}/" control
sed -i "s/Version:.*/Version: ${VERSION}/" control

# 图标
mkdir -p usr/share/applications
cp -r ${currentPath}/deepin/package/${packageName}/Firefox-esr.desktop ./usr/share/applications/

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb

mv output/${packageName}_${VERSION}_amd64.deb /root/lsjun/${packageName}_${VERSION}_amd64.deb
cd /root/lsjun 
./mymail.py ${packageName}_${VERSION}_amd64.deb