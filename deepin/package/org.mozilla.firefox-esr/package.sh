set -x
packageName=org.mozilla.firefox-esr
shortname=firefox
# VERSION=128.12.0esr
VERSION=140.3.1esr

# 判断版本号，135及以上用tar.xz，否则用tar.bz2
ver_major=${VERSION%%.*}
if [ "$ver_major" -ge 135 ]; then
    ARCHIVE_EXT="tar.xz"
else
    ARCHIVE_EXT="tar.bz2"
fi
URL=https://download-installer.cdn.mozilla.net/pub/${shortname}/releases/${VERSION}/linux-x86_64/zh-CN/${shortname}-${VERSION}.${ARCHIVE_EXT}

currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source
cd ${currentPath}/tmp/source
wget -nv ${URL}

# 解压
tar xf ${shortname}-${VERSION}.${ARCHIVE_EXT}
rm ${shortname}-${VERSION}.${ARCHIVE_EXT}
ls
installed_size=$((`du --max-depth=0 firefox|awk '{print $1}'`))
du --max-depth=0
echo ${installed_size}
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps/${packageName}

cp -r ${currentPath}/tmp/source/${shortname} ./opt/apps/${packageName}/files
# 包信息
cp -r ${currentPath}/deepin/package/${packageName}/DEBIAN ./
sed -i "s/Installed-Size:.*/Installed-Size: ${installed_size}/" DEBIAN/control
sed -i "s/Version:.*/Version: ${VERSION}/" DEBIAN/control

source ${currentPath}/deepin/package/org.mozilla.common/common.sh

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb

cp ${currentPath}/deepin/package/mymail.py ./
python3 mymail.py output/${packageName}_${VERSION}_amd64.deb
