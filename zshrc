#!/bin/zsh

export ZSHELL_HOME="$HOME/.zshell"
export ZPLUG_HOME=/usr/local/opt/zplug
export ZSH_CACHE_DIR="$HOME/.zsh_cache"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000
export DEFAULT_USER=$(id -un)

source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/rake", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "unixorn/autoupdate-antigen.zshplugin"
zplug "laurenkt/zsh-vimto"

zplug load

bindkey -v

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

 # Completion
unset GREP_OPTIONS
unsetopt correct_all
unsetopt correct
 setopt auto_menu
 setopt always_to_end
 setopt complete_in_word
 unsetopt flow_control
 unsetopt menu_complete
 zstyle ':completion:*:*:*:*:*' menu select
 zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
 zstyle ':completion::complete:*' use-cache 1
 zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
 zstyle ':completion:*' list-colors ''
 zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

PYTHONPATH+=(/usr/local/lib/python3.7/site-packages(N-/))

export PATH=/usr/local/opt/curl/bin
export PATH=$PATH:/usr/local/opt/node@12/bin
export PATH=$PATH:/usr/local/opt/openjdk/bin
export PATH=$PATH:/usr/local/opt/ruby@2.6/bin:/usr/local/lib/ruby/gems/2.6.0/bin
export PATH=$PATH:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=$PATH:/usr/local/opt/python/libexec/bin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include -I/usr/local/opt/openjdk/include"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DYLD_INSERT_LIBRARIES="/usr/local/opt/jemalloc/lib/libjemalloc.dylib"
export MALLOC_ARENA_MAX=2
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PYTHONPATH
export GOPATH=$HOME/go
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vim"
export HOMEBREW_NO_ANALYTICS=1
export TERM="screen-256color"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

source $ZSHELL_HOME/functions
source $ZSHELL_HOME/zsh_aliases

stty -ixon

eval "$(starship init zsh)"
