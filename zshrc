ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zolarizedsh
ZSH_THEME="pure"
DEFAULT_USER="filippo"

plugins=(brew git vi-mode vagrant tmux)

bindkey -v

source $ZSH/oh-my-zsh.sh

unset GREP_OPTIONS
unsetopt correct_all
unsetopt correct

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/ruby/bin:~/.composer/vendor/bin
PYTHONPATH+=(/usr/local/lib/python2.7/site-packages(N-/))
export PYTHONPATH
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vim"
export HOMEBREW_NO_ANALYTICS=1
export TERM="screen-256color"

source $HOME/.zolarizedsh/functions
source $HOME/.zolarizedsh/zsh_aliases

stty -ixon
