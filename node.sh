#!/usr/bin/env bash

. /vagrant/variables.sh

# npm
sudo yum install -y --enablerepo=epel npm

# nodejs
sudo yum install -y --enablerepo=epel nodejs

# less
sudo npm install -g less
mkdir /vagrant/less

# Grunt
sudo npm install -g grunt-cli
echo "{" >> /vagrant/package.json
echo "  \"name\": \"vagrant\"," >> /vagrant/package.json
echo "  \"version\": \"0.0.0\"," >> /vagrant/package.json
echo "  \"description\": \"\"," >> /vagrant/package.json
echo "  \"main\": \"index.js\"," >> /vagrant/package.json
echo "  \"scripts\": {" >> /vagrant/package.json
echo "    \"test\": \"echo \"Error: no test specified\" && exit 1\"" >> /vagrant/package.json
echo "  }," >> /vagrant/package.json
echo "  \"author\": \"\"," >> /vagrant/package.json
echo "  \"license\": \"BSD\"," >> /vagrant/package.json
echo "}" >> /vagrant/package.json

sudo npm install grunt-contrib-less --save-dev
sudo npm install grunt-contrib-cssmin --save-dev
sudo npm install grunt-contrib-csslint --save-dev
sudo npm install grunt-contrib-uglify --save-dev
sudo npm install grunt-contrib-jshint --save-dev
sudo npm install grunt-contrib-watch --save-dev
