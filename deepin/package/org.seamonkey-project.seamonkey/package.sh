set -x
packageName=org.seamonkey-project.seamonkey
shortname=seamonkey
VERSION=2.53.10.2
URL=https://download-installer.cdn.mozilla.net/pub/${shortname}/releases/${VERSION}/linux-x86_64/zh-CN/${shortname}-${VERSION}.zh-CN.linux-x86_64.tar.bz2

currentPath=`pwd`
echo ${currentPath}

rm -rf ${currentPath}/tmp/*

mkdir -p tmp/${packageName}
mkdir -p tmp/output
mkdir -p tmp/source
cd ${currentPath}/tmp/source
wget -nv ${URL}

tar xvf ${shortname}-${VERSION}.zh-CN.linux-x86_64.tar.bz2
rm ${shortname}-${VERSION}.zh-CN.linux-x86_64.tar.bz2
ls
installed_size=$((`du --max-depth=0 seamonkey|awk '{print $1}'`))
echo ${installed_size}
cd ${currentPath}/tmp/${packageName}

mkdir -p opt/apps/${packageName}

cp -r ${currentPath}/tmp/source/${shortname} ./opt/apps/${packageName}/files
# 包信息
cp -r ${currentPath}/deepin/package/${packageName}/DEBIAN ./
sed -i "s/Installed-Size:.*/Installed-Size: ${installed_size}/" DEBIAN/control
sed -i "s/Version:.*/Version: ${VERSION}/" DEBIAN/control

# 图标
# mkdir -p usr/share/applications
mkdir -p ./opt/apps/${packageName}/entries/applications
cp -r ${currentPath}/deepin/package/${packageName}/${packageName}.desktop ./opt/apps/${packageName}/entries/applications
sed -i "s/Version=.*/Version=${VERSION}/" ./opt/apps/${packageName}/entries/applications/*

cd ${currentPath}/tmp
du ${packageName}
dpkg-deb -bv ${packageName} output/${packageName}_${VERSION}_amd64.deb

cp ${currentPath}/deepin/package/mymail.py ./
python3 mymail.py output/${packageName}_${VERSION}_amd64.deb