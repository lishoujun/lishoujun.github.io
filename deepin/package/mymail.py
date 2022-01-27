#!/usr/bin/python3

import smtplib
import sys
import os
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.header import Header

from qiniu import Auth, put_file, etag
import qiniu.config

package_name = sys.argv[1]

# 需要填写你的 Access Key 和 Secret Key
access_key = os.getenv('access_key')
secret_key = os.getenv('secret_key')
# 构建鉴权对象
q = Auth(access_key, secret_key)
# 要上传的空间
bucket_name = 'yyyit-hd'
# 上传后保存的文件名
key = package_name
# 生成上传 Token，可以指定过期时间等
token = q.upload_token(bucket_name, key, 3600)
# 要上传文件的本地路径
localfile = './' + package_name
ret, info = put_file(token, key, localfile, version='v2')
print(info)
assert ret['key'] == key
assert ret['hash'] == etag(localfile)

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

content = 'http://cdn.download.yyyit.com/' + package_name
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
