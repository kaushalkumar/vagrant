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
yum install -y mysql mysql-devel mysql-server
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start
mysql -u root -e "SHOW DATABASES";

# download starter content



service httpd restart
