#!/usr/bin/env bash
set -euv

sudo apt-get update
sudo apt-get install -y git vim build-essential libssl-dev

# rbenv, ruby-build
git clone --depth 1 https://github.com/rbenv/rbenv.git ~/.rbenv
git clone --depth 1 https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# install ruby
export RUBY_VERSION="1.8.7-p374"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

# install rails 1.0.0
echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
gem install rake --version='0.7.3'
gem install rails --version='2.0.1'
rbenv rehash
