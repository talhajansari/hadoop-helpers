#!/bin/bash

echo "This script installs Hadoop on Ubuntu."
echo "The script is starting..."

echo "Installing required dependencies.."
#sudo apt-get upgrade
sudo apt-get update
sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
echo "export PATH=\"$HOME/.linuxbrew/bin:$PATH\"" >> ~/.bashrc
echo "export MANPATH=\"$HOME/.linuxbrew/share/man:$MANPATH\"" >> ~/.bashrc
echo "export INFOPATH=\"$HOME/.linuxbrew/share/info:$INFOPATH\"" >> ~/.bashrc
source ~/.bashrc

echo "Installing Hadoop using Linux Brew"
brew install hadoop
sudo ln -s ~/.linuxbrew/Cellar/ /usr/local/Cellar

export PATH="$HOME/.linuxbrew/Cellar/hadoop/2.5.1/libexec/bin:$HOME/.linuxbrew/Cellar/hadoop/2.5.1/libexec/sbin:$PATH"
echo "export PATH=\"$HOME/.linuxbrew/Cellar/hadoop/2.5.1/libexec/bin:$HOME/.linuxbrew/Cellar/hadoop/2.5.1/libexec/sbin:$PATH\"" >> ~/.bashrc
source ~/.bashrc

echo "Installing JAVA...(even if you already have it)"
sudo apt-get install default-jre
mv /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/hadoop-env.sh /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/hadoop-env.sh.backup
echo "Updating JAVA_HOME in hadoop-env.sh"
sed '25c\'"export JAVA_HOME=/usr/lib/jvm/default-java/jre/" /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/hadoop-env.sh.backup >> /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/hadoop-env.sh
echo "Updating JAVA_HOME in yarn-env.sh"
mv /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/yarn-env.sh /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/yarn-env.sh.backup
sed '23c\'"export JAVA_HOME=/usr/lib/jvm/default-java/jre/" /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/yarn-env.sh.backup >> /usr/local/Cellar/hadoop/2.5.1/libexec/etc/hadoop/yarn-env.sh

echo "."
echo "."
echo "."
echo "The script is complete. Hadoop has been installed."

