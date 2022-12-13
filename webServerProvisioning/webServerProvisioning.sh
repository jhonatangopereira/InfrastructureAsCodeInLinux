#!/bin/bash

echo -e "\033[01;32m\n > Script initialized.\n\033[00;00m"

# Updating and upgrading the system with apt-get
echo -e "\033[01;32mUpgrading the system...\n\033[00;00m" \
apt-get update && apt-get upgrade -y

# Installing apache2, mysql-server and unzip packages
echo -e "\033[01;32m\nInstalling apache2...\n\033[00;00m"
apt-get install apache2 -y
echo -e "\033[01;32m\nInstalling mysql-server...\n\033[00;00m"
apt-get install mysql-server-8.0 -y
echo -e "\033[01;32m\nInstalling unzip...\n\033[00;00m"
apt-get install unzip -y

# Downloading a web project
echo -e "\033[01;32m\nDownloading the code...\n\033[00;00m"
cd /tmp/
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Unziping and moving the web project to apache2 folder
echo -e "\033[01;32m\nUnziping and copying the code...\n\033[00;00m"
unzip ./main.zip
cp -R ./linux-site-dio-main/* /var/www/html/
rm -R ./linux-site-dio-main/

echo -e "\033[01;32m\n > Finished script! Everything is working now.\n\033[00;00m"
