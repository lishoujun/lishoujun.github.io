#!/bin/bash
date
sudo apt update; sudo apt dist-upgrade; \
sudo apt install ffmpeg fish firefox   git gnome-tweaks htop preload     \
gedit-plugins  vlc vim openjdk-14-jdk openconnect python3 python3-pip qbittorrent vokoscreen -y;\
sudo apt install ubuntu-restricted-extras -y;
sudo apt install shadowsocks-libev

# sudo openconnect  vpn.xxx.com -u xiaoming --authgroup=RSA
# sudo vim /etc/shadowsocks-libev/config.json
sudo systemctl enable shadowsocks-libev-local@.service

curl https://sh.rustup.rs -sSf | sh
date
