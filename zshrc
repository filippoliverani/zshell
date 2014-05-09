ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zolarizedsh
ZSH_THEME="agnoster-light"
DEFAULT_USER="filippo"

plugins=(git vi-mode vagrant tmux)

bindkey -v

source $ZSH/oh-my-zsh.sh

unsetopt correct_all
unsetopt correct

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/ruby/bin
export PYTHONPATH=/usr/lib/python3.3/site-packages
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vim"

source $HOME/.zolarizedsh/aliases
source $HOME/.zolarizedsh/functions
