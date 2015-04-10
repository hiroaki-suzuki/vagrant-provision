#!/usr/bin/env bash

. /vagrant/variables.sh

#mysql
cd /home/vagrant/tmp
wget http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
rpm -Uvh mysql-community-release-el6-5.noarch.rpm
yum -y install mysql-community-server
cp -p /etc/my.cnf /home/vagrant/bk/my.conf.org
echo "" >> /etc/my.cnf
echo "[client]" >> /etc/my.cnf
echo "default-character-set=utf8" >> /etc/my.cnf
echo "" >> /etc/my.cnf
echo "[mysqld]" >> /etc/my.cnf
echo "skip-character-set-client-handshake" >> /etc/my.cnf
echo "character-set-server = utf8" >> /etc/my.cnf
echo "collation-server = utf8_general_ci" >> /etc/my.cnf
echo "init-connect = SET NAMES utf8" >> /etc/my.cnf
echo "" >> /etc/my.cnf
echo "[mysqldump]" >> /etc/my.cnf
echo "default-character-set=utf8" >> /etc/my.cnf
echo "" >> /etc/my.cnf
echo "[mysql]" >> /etc/my.cnf
echo "default-character-set=utf8" >> /etc/my.cnf
service mysqld start
chkconfig mysqld on