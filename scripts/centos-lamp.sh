#!/bin/bash

# Update centos with any patches
yum update -y --exclude=kernel

# Apache
yum install -y nano git unzip screen
yum install -y httpd http-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop
rm -rf /var/www/html/
ln -s /vagrant /var/www/html
service httpd start

# php
yum install -y php php-cli php-common php-devel php-mysql

# mysql
yum install -y mysql mysql-devel mariadb-server
chkconfig --add mysql
chkconfig mysql on
service mysql start
mysql -u root -e "SHOW DATABASES";

# download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/kaushalkumar/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/kaushalkumar/vagrant/master/files/info.php

service httpd restart
