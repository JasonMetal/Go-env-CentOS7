#!/bin/bash
##Install Go Lang in CentOS 7 machines.
#Installing imp packages
sudo apt install wget unzip -y
##Donwloading Go Package
#wget -O /opt/go1.14.4.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.14.4.linux-amd64.tar.gz
#wget -O /opt/go1.17.8.linux-amd64.tar.gz https://go.dev/dl/go1.17.8.linux-amd64.tar.gz
#wget -O /opt/go1.18.linux-amd64.tar.gz https://go.dev/dl/go1.18.linux-amd64.tar.gz
wget -O /opt/go1.20.3.linux-amd64.tar.gz https://golang.google.cn/dl/go1.20.3.linux-amd64.tar.gz
##Extract packages to a location
tar -C /usr/local -xzf /opt/go1.20.3.linux-amd64.tar.gz

sleep 2s

sleep 2s

sleep 2s

##Export Variable path
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
source /etc/profile
##Installation completed.
clear
echo "GoLang has been installed succesfully"
sleep 2s
clear
echo "You must need to logout and login again to complete the Installation"
echo "#####################################################################"
echo "Installation path is /usr/local/go"
echo "GG GL HF"
echo "###show go env!######################################################"
go env
