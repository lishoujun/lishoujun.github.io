packageName=com.baidu.baidunetdisk
VERSION=3.5.0
currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source


cd ${currentPath}/tmp/source
wget https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/${VERSION}/baidunetdisk_${VERSION}_amd64.deb

# 以下todo
tar xvf thunderbird-${VERSION}.tar.bz2
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

curl http://45.63.0.205:60001/upload -F "file_1=@output/${packageName}_${VERSION}_amd64.deb" -v