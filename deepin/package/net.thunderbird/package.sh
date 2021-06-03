packageName=net.thunderbird
VERSION=78.11.0
currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source
cd tmp/source
cp ~/Downloads/thunderbird-${VERSION}.tar.bz2 ./
tar xvf thunderbird-${VERSION}.tar.bz2
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps

# 二进制
# wget https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/${VERSION}/linux-x86_64/zh-CN/thunderbird-${VERSION}.tar.bz2

cp -r ${currentPath}/tmp/source/thunderbird ./opt/apps/net.thunderbird
# 包信息
cp -r ${currentPath}/deepin/package/net.thunderbird/DEBIAN ./
# 图标
mkdir -p usr/share/applications
cp -r ${currentPath}/deepin/package/net.thunderbird/Thunderbird.desktop ./usr/share/applications/

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb
