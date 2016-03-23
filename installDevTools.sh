#!/bin/bash
sudo yum install -y wget java-1.7.0-openjdk java-1.7.0-openjdk-devel unzip git ruby
if [ ! -f "/usr/bin/mvn" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  #wget "https://archive.apache.org/dist/maven/binaries/apache-maven-2.2.1-bin.zip"
  #unzip apache-maven-2.2.1-bin.zip
  #mv apache-maven-2.2.1/ /opt/
  #echo "export PATH=/opt/apache-maven-2.2.1/bin:$PATH" >> ~/.bashrc
  sudo curl -s https://bitbucket.org/mjensen/mvnvm/raw/master/mvn > mvn
  sudo mv mvn /usr/bin
  sudo chmod 0755 /usr/bin/mvn
fi

if [ ! -f "/usr/bin/unison" ]; then
  curl -o unison.tar.xz http://ftp5.gwdg.de/pub/linux/archlinux/extra/os/x86_64/unison-2.48.3-2-x86_64.pkg.tar.xz
  sudo tar xf unison.tar.xz -C /
fi
