#!/bin/bash
date
sudo su -c "echo  'fastestmirror=true' >> /etc/dnf/dnf.conf"
sudo su -c "echo  'deltarpm=true' >> /etc/dnf/dnf.conf"

dnf update dnf
dnf copr enable librehat/shadowsocks -y
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

dnf update -y
dnf install ffmpeg fish firefox git gnome-tweaks htop liveusb-creator qbittorrent vim vlc vsftpd shadowsocks-libev -y
systemctl enable shadowsocks-libev-local.service

pip3 install -U pip
pip3 install -U urllib3
date
