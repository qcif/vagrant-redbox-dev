#!/bin/bash
sudo yum install -y wget java-1.7.0-openjdk java-1.7.0-openjdk-devel unzip git ruby inotify-tools
if [ ! -f "/usr/bin/mvn" ]; then
  sudo curl -s https://bitbucket.org/mjensen/mvnvm/raw/master/mvn > mvn
  sudo mv mvn /usr/bin
  sudo chmod 0755 /usr/bin/mvn
fi

if [ ! -f "/usr/bin/docker-compose" ]; then
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo yum install -y epel-release
sudo yum install -y python-pip
sudo yum install -y gcc
sudo yum install -y python-devel
sudo pip install --upgrade pip
sudo pip install docker-compose
sudo pip install backports.ssl_match_hostname --upgrade
sudo pip install python-glanceclient
sudo yum upgrade -y python*
fi

if [ ! -f "/usr/bin/unison" ]; then
  # #If this line fails, it's probably because the version has updated check out http://ftp5.gwdg.de/pub/linux/archlinux/extra/os/x86_64/ and fix the url to get the new version
  # curl -o unison.tar.xz http://ftp5.gwdg.de/pub/linux/archlinux/extra/os/x86_64/unison-2.48.4-2-x86_64.pkg.tar.xz
  # sudo tar xf unison.tar.xz -C /
  yum install -y  ocaml ocaml-camlp4-devel ctags ctags-etags

  cd ~
  git clone "https://github.com/bcpierce00/unison.git"
  cd unison
  latesttag=$(git describe --tags)
  echo checking out ${latesttag}
  git checkout ${latesttag}
  make
  cp src/unison /bin/
fi

sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 12 --lts
npm install -g @angular/cli

# installing ntpd
sudo yum install -y ntp
sudo systemctl enable ntpd
sudo systemctl start ntpd
