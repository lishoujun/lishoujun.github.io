#!/bin/bash
date
sudo su -c "echo  'fastestmirror=true' >> /etc/dnf/dnf.conf"
sudo su -c "echo  'deltarpm=true' >> /etc/dnf/dnf.conf"

dnf update dnf
dnf copr enable librehat/shadowsocks -y
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# to centos
# dnf install 'dnf-command(copr)'
# dnf copr enable librehat/shadowsocks  -y

dnf update -y
dnf install ffmpeg fish firefox git gnome-tweaks htop liveusb-creator qbittorrent vim vlc vsftpd shadowsocks-libev openconnect -y
# sudo openconnect  vpn.xxx.com -u xiaoming --authgroup=RSA
systemctl enable shadowsocks-libev-local.service

pip3 install -U pip
pip3 install -U urllib3
date
