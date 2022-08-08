#!/bin/bash
# brew install some software.

# tuna mirror help
# https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/
# update first
brew update

git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
# 常用软件  
brew install yed postman wechat miniconda android-platform-tools
# 安装 go 运行环境
brew install go 
# 安装greadlink
brew install coreutils

curl https://sh.rustup.rs -sSf | sh
