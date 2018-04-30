#!/bin/sh
#ubuntu setup

##########
###設定###
##########
cd
#リポジトリ変更
sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
sudo apt update
sudo apt -y upgrade

#.bashrc等
git clone https://github.com/ecokinoko/linux-files
mv ~/linux-files/* ~/

source .bashrc
source .profile

#デスクトップ to desktop
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
#no guest
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
#時刻ずれ
sudo timedatectl set-local-rtc true
#poweroffに時間をかけない
sudo sed -i 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=10s/g' /etc/systemd/system.conf

##########
###apps###
##########

#基本
sudo apt install -y vim git build-essential gparted unity-tweak-tool compizconfig-settings-manager


#chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#atom
sudo add-apt-repository ppa:webupd8team/atom
#paper
sudo add-apt-repository ppa:snwh/pulp

sudo apt-get update
sudo apt-get install -y google-chrome-stable atom paper-icon-theme

mkdir ~/.vim↲
cd ~/.vim↲
mkdir colors↲
↲
git clone https://github.com/tomasr/molokai↲
mv molokai/colors/molokai.vim ~/.vim/colors/↲



