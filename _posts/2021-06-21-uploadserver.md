---
layout: post
title: Python 中快速启动一个文件上传服务器，及改进
date: 2021-06-21 16:41
category: 
author: 
tags: []
summary: 
---
开坑：  
- https://pypi.org/project/uploadserver/#description  
- https://github.com/Densaugeo/uploadserver  

因一些志愿者活动的需求，需要一个文件上传服务器，ftp其实是蛮好的，不过使用方不是很方便，搜索了一下，找到了一个python的文件上传&下载服务器库。  
TODO 目前的问题是不带鉴权，可能会出现文件篡改的漏洞，计划升级一下，加一个简易token。  