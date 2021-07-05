#!/bin/bash
# brew install some software.

# tuna mirror help
# https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/
# update firest
brew update
## openconnect for vpn
brew install openconnect
# how to use: sudo openconnect vpn.xxx.com
git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
brew install quicksilver yed postman wechat miniconda brave-browser android-platform-tools
