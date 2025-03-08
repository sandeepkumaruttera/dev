#!/bin/bash
dnf install nginx -y 
systemctl enable nginx
systemctl start nginx
cd /usr/share/nginx/html
echo "<h1>this is nginx-1</h1>" > index.html