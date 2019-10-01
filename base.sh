#!/bin/sh
set -e

printf "sudo password: "
read password

# OS更新
echo "$password" | sudo -S apt-get update
echo "$password" | sudo -S apt-get upgrade

# ホームの中のディレクトリを英語へ
LANG=C xdg-user-dirs-gtk-update

# git導入
echo "$password" | sudo -S apt-get install git

# node導入
echo "$password" | sudo -S apt-get install -y nodejs npm
echo "$password" | sudo -S npm cache clean
echo "$password" | sudo -S npm install n -g
echo "$password" | sudo -S n stable
echo "$password" | sudo -S ln -sf /usr/local/bin/node /usr/bin/node
node -v
npm -v
echo "$password" | sudo -S apt-get purge -y nodejs npm

# ログインシェルの変更
echo "$password" | sudo -S apt-get install zsh
chsh -s /bin/zsh

# vimの導入
echo "$password" | sudo -S apt-get install vim

# python導入
echo "$password" | sudo -S apt install -y build-essential
echo "$password" | sudo -S apt install -y libsm6
echo "$password" | sudo -S apt install -y libxrender1
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.bashrc
pyenv install -l | grep anaconda
pyenv install anaconda3-5.1.0
pyenv rehash
pyenv global anaconda3-5.1.0
echo 'export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin/:$PATH"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin/:$PATH"' >> ~/.zshrc
