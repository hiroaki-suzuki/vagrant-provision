#!/usr/bin/env bash

chmod ugo+x /vagrant/variables.sh
. /vagrant/variables.sh

# ディレクトリ
if [ ! -d "/home/vagrant/bk" ]; then
	mkdir /home/vagrant/bk
fi

if [ ! -d "/home/vagrant/work" ]; then
	mkdir /home/vagrant/work
fi

if [ ! -d "/home/vagrant/tmp" ]; then
	mkdir /home/vagrant/tmp
fi

chown -R vagrant:vagrant /home/vagrant

# host設定
cp -p /etc/hosts /home/vagrant/bk/hosts.org
echo "${ip} ${host}" >> /etc/hosts

# yum repo 追加
yum -y install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sed -i -e "s/enabled \?= \?1/enabled = 0/g" /etc/yum.repos.d/rpmforge.repo
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sed -i -e "s/enabled \?= \?1/enabled = 0/g" /etc/yum.repos.d/epel.repo
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sed -i -e "s/enabled \?= \?1/enabled = 0/g" /etc/yum.repos.d/remi.repo

# yum update
yum -y update --enablerepo=rpmforge,epel,remi

# man
yum -y install man

# Vim
yum -y install vim
cp -p /etc/vimrc /home/vagrant/bk/vimrc.org
echo "set noswapfile" >> /etc/vimrc
echo "set noswapfile" >> /etc/vimrc
echo "set ruler" >> /etc/vimrc
echo "set cmdheight=2" >> /etc/vimrc
echo "set laststatus=2" >> /etc/vimrc
echo "set list" >> /etc/vimrc
echo "set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<" >> /etc/vimrc
echo "set number" >> /etc/vimrc
echo "set showmatch" >> /etc/vimrc
echo "set autoindent" >> /etc/vimrc
echo "set smartindent" >> /etc/vimrc
echo "set tabstop=4" >> /etc/vimrc
echo "set shiftwidth=4" >> /etc/vimrc
echo "set smarttab" >> /etc/vimrc
echo "set expandtab" >> /etc/vimrc
echo "syntax on" >> /etc/vimrc
echo "colorscheme koehler" >> /etc/vimrc
echo "highlight LineNr ctermfg=darkyellow" >> /etc/vimrc
echo "" >> /etc/vimrc
echo "\"全角スペースをハイライト表示" >> /etc/vimrc
echo "function! ZenkakuSpace()" >> /etc/vimrc
echo "    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta" >> /etc/vimrc
echo "endfunction" >> /etc/vimrc
echo "" >> /etc/vimrc
echo "if has('syntax')" >> /etc/vimrc
echo "    augroup ZenkakuSpace" >> /etc/vimrc
echo "        autocmd!" >> /etc/vimrc
echo "        autocmd ColorScheme       * call ZenkakuSpace()" >> /etc/vimrc
echo "        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/" >> /etc/vimrc
echo "    augroup END" >> /etc/vimrc
echo "    call ZenkakuSpace()" >> /etc/vimrc
echo "endif" >> /etc/vimrc