#!/usr/bin/env bash

. /vagrant/variables.sh

# php
yum -y update --enablerepo=rpmforge,epel,remi,remi-php55

yum -y install --enablerepo=remi,remi-php55,epel php php-pear php-mbstring php-xml php-devel php-mysqlnd php-opcache php-pecl-apcu php-pecl-xdebug php-gd php-mcrypt php-phpunit-PHPUnit php-cli php-common phpMyAdmin
cp -p /etc/php.ini /home/vagrant/bk/php.ini
set -i -e "s/^;\?date.timezone.*$/date.timezone=\"Asia/Tokyo\"/g" /etc/php.ini
echo "" >> /etc/php.d/mbstring.ini
echo "[mbstring]" >> /etc/php.d/mbstring.ini
echo "mbstring.language = Japanese" >> /etc/php.d/mbstring.ini
echo "mbstring.internal_encoding = UTF-8" >> /etc/php.d/mbstring.ini
echo "mbstring.http_input = pass" >> /etc/php.d/mbstring.ini
echo "mbstring.http_output = pass" >> /etc/php.d/mbstring.ini
echo "mbstring.encoding_translation = Off" >> /etc/php.d/mbstring.ini
echo "mbstring.detect_order = UTF-8,SJIS,EUC-JP,JIS,ASCII" >> /etc/php.d/mbstring.ini
echo "mbstring.substitute_character = none" >> /etc/php.d/mbstring.ini
echo "mbstring.func_overload = 0" >> /etc/php.d/mbstring.ini
echo "mbstring.strict_detection = Off" >> /etc/php.d/mbstring.ini
echo ";mbstring.http_output_conv_mimetype=" >> /etc/php.d/mbstring.ini

echo "" >> /etc/php.d/xdebug.ini
echo "[xdebug]" >> /etc/php.d/xdebug.ini
echo "xdebug.remote_enable=1" >> /etc/php.d/xdebug.ini
echo "xdebug.remote_autostart=1" >> /etc/php.d/xdebug.ini
echo "xdebug.remote_host=\"192.168.33.1\"" >> /etc/php.d/xdebug.ini
echo "xdebug.remote_port=9000" >> /etc/php.d/xdebug.ini
echo "xdebug.profiler_enable=1" >> /etc/php.d/xdebug.ini
echo "xdebug.profiler_output_dir=\"/vagrant/tmp\"" >> /etc/php.d/xdebug.ini
echo "xdebug.max_nesting_level=1000" >> /etc/php.d/xdebug.ini
echo "xdebug.idekey = \"PHPSTORM\"" >> /etc/php.d/xdebug.ini

echo "<?php phpinfo() ?>" >> /vagrant/html/phpinfo.php