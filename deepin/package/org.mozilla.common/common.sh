#!/bin/bash
# 一些在Mozilla系列软件中通用的代码段
echo 'common shell start'

# 图标
mkdir -p usr/share/applications
cp -r ${currentPath}/deepin/package/${packageName}/${packageName}.desktop ./usr/share/applications/
sed -i "s/Version=.*/Version=${VERSION}/" ./usr/share/applications/*

# 发行版策略
mkdir -p ./opt/apps/${packageName}/files/distribution/
cp ${currentPath}/deepin/package/${packageName}/policies.json ./opt/apps/${packageName}/files/distribution/
echo 'common shell end'