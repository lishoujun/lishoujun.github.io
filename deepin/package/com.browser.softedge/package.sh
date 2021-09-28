rm DEBIAN/postinst DEBIAN/postrm DEBIAN/prerm
sed -i 's/microsoft-edge-beta/com.browser.softedge/' DEBIAN/control

rm etc -rf
ln -snf /opt/apps/com.browser.softedge/files/microsoft/msedge-beta/microsoft-edge-beta usr/bin/microsoft-edge-beta
mkdir opt/com.browser.softedge/files -p
mv usr/share/* opt/com.browser.softedge/files/ 
rmdir usr/share
mv opt/microsoft/ opt/com.browser.softedge/files/

mkdir opt/com.browser.softedge/entries
cp opt/com.browser.softedge/files/applications opt/com.browser.softedge/entries/ -r
mv opt/com.browser.softedge/entries/applications/microsoft-edge-beta.desktop opt/com.browser.softedge/entries/applications/com.browser.softedge.desktop
mkdir -p opt/apps
mv opt/com.browser.softedge opt/apps


imgsize=16
mkdir -p opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps
cp opt/apps/com.browser.softedge/files/microsoft/msedge-beta/product_logo_${imgsize}_beta.png opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps/com.browser.softedge.png

imgsize=24
mkdir -p opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps
cp opt/apps/com.browser.softedge/files/microsoft/msedge-beta/product_logo_${imgsize}_beta.png opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps/com.browser.softedge.png

imgsize=32
mkdir -p opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps
cp opt/apps/com.browser.softedge/files/microsoft/msedge-beta/product_logo_${imgsize}_beta.png opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps/com.browser.softedge.png

imgsize=64
mkdir -p opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps
cp opt/apps/com.browser.softedge/files/microsoft/msedge-beta/product_logo_${imgsize}_beta.png opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps/com.browser.softedge.png

imgsize=128
mkdir -p opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps
cp opt/apps/com.browser.softedge/files/microsoft/msedge-beta/product_logo_${imgsize}_beta.png opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps/com.browser.softedge.png

imgsize=256
mkdir -p opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps
cp opt/apps/com.browser.softedge/files/microsoft/msedge-beta/product_logo_${imgsize}_beta.png opt/apps/com.browser.softedge/entries/icons/hicolor/${imgsize}x${imgsize}/apps/com.browser.softedge.png

mkdir -p opt/apps/com.browser.softedge/entries/icons/hicolor/scalable/apps
cp opt/apps/com.browser.softedge/files/microsoft/msedge-beta/product_logo_${imgsize}_beta.png opt/apps/com.browser.softedge/entries/icons/hicolor/scalable/apps/com.browser.softedge.png

VERSION=94.0.992.31-1
packageName=com.browser.softedge
cat > info <<EOF 
{
    "appid": "com.browser.softedge", 
    "version": "${VERSION}", 
    "arch": [
        "amd64"
    ], 
    "name": "Microsoft Edge (beta)", 
    "permissions": {
        "account": false, 
        "notification": true, 
        "trayicon": false, 
        "audio_record": false, 
        "bluetooth": false, 
        "clipboard": true, 
        "autostart": false, 
        "camera": false, 
        "installed_apps": false
    }
}
EOF
mv info opt/apps/com.browser.softedge/

cd ..
dpkg-deb -bv ${packageName} ${packageName}_${VERSION}_amd64.deb
