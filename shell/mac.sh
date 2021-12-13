#!/bin/bash
# brew install some software.

# tuna mirror help
# https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/
# update firest
brew update

git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
brew install yed postman wechat miniconda android-platform-tools
brew install go
