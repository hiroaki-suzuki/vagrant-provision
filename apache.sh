#!/usr/bin/env bash

. /vagrant/variables.sh

yum -y install httpd

cp -p /etc/httpd/conf/httpd.conf /home/vagrant/bk/httpd.conf.org

# 設定書き換え
sed -i -e "s/^KeepAlive Off$/KeepAlive On/g" /etc/httpd/conf/httpd.conf
sed -i -e "s/^ServerAdmin.*$/ServerAdmin ${mail}/g" /etc/httpd/conf/httpd.conf
sed -i -e "s/^#ServerName.*$/ServerName ${host}/g" /etc/httpd/conf/httpd.conf
sed -i -e "s/^ServerTokens.*$/ServerTokens Prod/g" /etc/httpd/conf/httpd.conf
sed -i -e "/^<Directory \"\/var\/www\/html/a \    EnableMMAP = Off\n    EnableSendfile Off" /etc/httpd/conf/httpd.conf

# バーチャルホスト設定
touch /etc/httpd/conf.d/vhosts.conf
echo "<VirtualHost *:80>" >> /etc/httpd/conf.d/vhosts.conf
echo "    DocumentRoot ${docroot}" >> /etc/httpd/conf.d/vhosts.conf
echo "</VirtualHost>" >> /etc/httpd/conf.d/vhosts.conf

rm -rf /var/www/html
mkdir ${docroot}
ln -fs ${docroot} /var/www/html

service httpd start
chkconfig httpd on