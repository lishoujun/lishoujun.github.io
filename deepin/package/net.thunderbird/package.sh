set -x
packageName=net.thunderbird
shortname=thunderbird
VERSION=91.1.2
URL=https://download-installer.cdn.mozilla.net/pub/${shortname}/releases/${VERSION}/linux-x86_64/zh-CN/${shortname}-${VERSION}.tar.bz2

currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source
cd ${currentPath}/tmp/source
wget -nv ${URL}

tar xvf ${shortname}-${VERSION}.tar.bz2
installed_size=$((`du --max-depth=0 thunderbird|awk '{print $1}'`))
echo ${installed_size}
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps/${packageName}

cp -r ${currentPath}/tmp/source/${shortname} ./opt/apps/${packageName}/files
# 包信息
cp -r ${currentPath}/deepin/package/${packageName}/DEBIAN ./
sed -i "s/Installed-Size:.*/Installed-Size: ${installed_size}/" DEBIAN/control
sed -i "s/Version:.*/Version: ${VERSION}/" DEBIAN/control

# 图标
mkdir -p usr/share/applications
cp -r ${currentPath}/deepin/package/${packageName}/${packageName}.desktop ./usr/share/applications/
sed -i "s/Version=.*/Version=${VERSION}/" ./usr/share/applications/*

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb

cp ${currentPath}/deepin/package/mymail.py ./
python3 mymail.py ${packageName}_${VERSION}_amd64.deb