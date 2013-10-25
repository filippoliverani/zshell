ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zolarizedsh
DEFAULT_USER="filippo"

plugins=(git vi-mode vagrant)

bindkey -v

source $ZSH/oh-my-zsh.sh
. /usr/share/zsh/site-contrib/powerline.zsh

unsetopt correct_all
unsetopt correct

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/ruby/bin
export PYTHONPATH=/usr/lib/python3.3/site-packages
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export TERM=xterm-16color

source $HOME/.zolarizedsh/aliases
