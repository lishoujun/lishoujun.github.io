packageName=net.thunderbird
version=78.10.2-20210513204504
currentPath=`pwd`

echo ${currentPath}
rm -rf ${currentPath}/tmp/${packageName}
# cd ../../../
pwd
mkdir -p tmp/${packageName}
mkdir -p tmp/output
cd tmp/${packageName}

mkdir -p opt/apps

# 二进制
cp -r /home/lishoujun/Documents/deb/thunderbird ./opt/apps/net.thunderbird
# 包信息
cp -r /home/lishoujun/codes/lishoujun.github.io/deepin/package/net.thunderbird/DEBIAN ./
# 图标
mkdir -p usr/share/applications
cp -r /home/lishoujun/codes/lishoujun.github.io/deepin/package/net.thunderbird/Thunderbird.desktop ./usr/share/applications/

cd ${currentPath}/tmp
dpkg-deb -bv ${packageName} output/${packageName}_${version}_amd64.deb
