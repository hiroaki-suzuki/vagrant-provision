#!/usr/bin/env bash

. /vagrant/variables.sh

#　日本語環境設定
yum -y groupinstall "Japanese Support"

cp -p /etc/sysconfig/i18n /home/vagrant/bk/i18n.org
sed -i -e "s/LANG=.*$/LANG=\"ja_JP.UTF-8\"/g" /etc/sysconfig/i18n

#　時刻設定
cp -p /etc/sysconfig/clock /home/vagrant/bk/clock.org
sed -i -e "s/.*/ZONE=\"Asia\/Tokyo\"/g" /etc/sysconfig/clock

cp -p /etc/localtime /home/vagrant/bk/localtime.org
cp -p  /usr/share/zoneinfo/Japan /etc/localtime

# NTP
yum -y install ntp
cp -p /etc/ntp.conf /home/vagrant/bk/ntp.conf.org
sed -i -e "s/server 0.*$/server -4 ntp.nict.jp/g" /etc/ntp.conf
sed -i -e "s/server 1.*$/server -4 ntp1.jst.mfeed.ad.jp/g" /etc/ntp.conf
sed -i -e "s/server 2.*$/server -4 ntp2.jst.mfeed.ad.jp/g" /etc/ntp.conf
sed -i -e "s/server 3.*$/server -4 ntp3.jst.mfeed.ad.jp/g" /etc/ntp.conf

service ntpd start
chkconfig ntpd on
