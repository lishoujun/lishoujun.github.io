packageName=org.mozilla.firefox-esr
shortname=firefox
VERSION=91.1.0esr
URL=https://download-installer.cdn.mozilla.net/pub/${shortname}/releases/${VERSION}/linux-x86_64/zh-CN/${shortname}-${VERSION}.tar.bz2

currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source
cd ${currentPath}/tmp/source
wget ${URL}

tar xvf ${shortname}-${VERSION}.tar.bz2
installed_size=$((`du --max-depth=0 firefox|awk '{print $1}'`))
echo ${installed_size}
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps

cp -r ${currentPath}/tmp/source/${shortname} ./opt/apps/${packageName}
# 包信息
cp -r ${currentPath}/deepin/package/${packageName}/DEBIAN ./
sed -i "s/Installed-Size:.*/Installed-Size: ${installed_size}/" DEBIAN/control
sed -i "s/Version:.*/Version: ${VERSION}/" DEBIAN/control

# 图标
mkdir -p usr/share/applications
cp -r ${currentPath}/deepin/package/${packageName}/Firefox-esr.desktop ./usr/share/applications/
sed -i "s/Version=.*/Version=${VERSION}/" ./usr/share/applications/*

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb

cp ${currentPath}/deepin/package/mymail.py ./
chmod +x mymail.py
./mymail.py ${packageName}_${VERSION}_amd64.deb