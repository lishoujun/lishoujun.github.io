packageName=net.thunderbird
VERSION=78.13.0
currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source


cd ${currentPath}/tmp/source
wget https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/${VERSION}/linux-x86_64/zh-CN/thunderbird-${VERSION}.tar.bz2

tar xvf thunderbird-${VERSION}.tar.bz2
file_kb=$((`du --max-depth=0 thunderbird|awk '{print $1}'`))
echo ${file_kb}
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps

cp -r ${currentPath}/tmp/source/thunderbird ./opt/apps/net.thunderbird
# 包信息
cp -r ${currentPath}/deepin/package/net.thunderbird/DEBIAN ./
# 图标
mkdir -p usr/share/applications
cp -r ${currentPath}/deepin/package/net.thunderbird/Thunderbird.desktop ./usr/share/applications/

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb

# curl http://45.63.0.205:60001/upload -F "file_1=@output/${packageName}_${VERSION}_amd64.deb" -v
mv output/${packageName}_${VERSION}_amd64.deb /root/lsjun/${packageName}_${VERSION}_amd64.deb
cd /root/lsjun 
./mymail.py ${packageName}_${VERSION}_amd64.deb