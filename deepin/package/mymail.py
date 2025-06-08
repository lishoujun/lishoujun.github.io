#!/usr/bin/python3
import os
import smtplib
import sys
from email.header import Header
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import qiniu.config
from qiniu import Auth, BucketManager, etag, put_file

package_name = sys.argv[1]

# 从环境变量中获取 Access Key 、 Secret Key 和 bucket_name（要上传的空间）
access_key = os.getenv('access_key')
secret_key = os.getenv('secret_key')
bucket_name = os.getenv('bucket_name', 'yyyit-forhk')
# 鉴权
myauth = Auth(access_key, secret_key)


def delete_file(myauth: Auth, bucket_name: str, key: str):
    # 初始化BucketManager
    bucket = BucketManager(myauth)
    # 删除bucket_name 中的文件 key
    ret, info = bucket.delete(bucket_name, key)
    print(info)
    print(ret)


def upload_file(myauth: Auth, bucket_name: str, key: str):
    # 生成上传 Token，可以指定过期时间等
    token = myauth.upload_token(bucket_name, key, 600)
    # 要上传文件的本地路径
    localfile = './' + key
    ret, info = put_file(token, key, localfile, version='v2')
    print(info)
    assert ret['key'] == key
    assert ret['hash'] == etag(localfile)


def delete_then_upload(myauth: Auth, bucket_name: str, key: str):
    # 因为可能文件之前存在过，所以提前删除一下。
    delete_file(myauth, bucket_name, key)
    upload_file(myauth, bucket_name, key)

delete_then_upload(myauth, bucket_name, package_name)

# 第三方 SMTP 服务
mail_host = "smtp.189.cn"  # 设置服务器
mail_user = os.getenv('mail_user')  # 用户名
mail_pass = os.getenv('mail_pass')  # 口令


sender = f'{mail_user}@189.cn'
receivers = [os.getenv('receivers')]  # 接收邮件，可设置为你的QQ邮箱或者其他邮箱

message = MIMEMultipart()
message['From'] = Header("mozilla 构建", 'utf-8')
message['To'] = Header("李守俊", 'utf-8')
subject = f'deepin 软件包 {package_name} '
message['Subject'] = Header(subject, 'utf-8')

content = 'http://hkcdn.download.yyyit.com/' + package_name
content = f'你好，这是最新的{package_name}包 请查收\n\n {content} \n\n祝好！\n李笑石'
print(content)
# 邮件正文内容
message.attach(MIMEText(content, 'plain', 'utf-8'))


try:
    smtpObj = smtplib.SMTP_SSL(mail_host, 465)
    print('开始登录')
    smtpObj.login(mail_user, mail_pass)
    smtpObj.sendmail(sender, receivers, message.as_string())
    print("邮件发送成功")
except smtplib.SMTPException as e:
    print("Error: 无法发送邮件")
    print(e)
