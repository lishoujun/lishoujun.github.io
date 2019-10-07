#!/bin/bash
sudo su -c "echo  'fastestmirror=true' >> /etc/dnf/dnf.conf"
sudo su -c 'dnf copr enable librehat/shadowsocks -y'
sudo dnf update -y
sudo dnf install ffmpeg fish firefox git gnome-tweaks htop liveusb-creator qbittorrent vim vlc vsftpd shadowsocks-libev -y
