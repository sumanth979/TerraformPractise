#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><h1>Hello.. Congrats for your first successful terraforms deployment To AWS</h1></html>" > index.html