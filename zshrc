#!/bin/zsh

LIB=/opt/homebrew/lib
OPT=/opt/homebrew/opt

export ZSHELL_HOME="$HOME/.zshell"
export ZPLUG_HOME="$OPT/zplug"
export ZSH_CACHE_DIR="$HOME/.zsh_cache"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000
export DEFAULT_USER=$(id -un)

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export SKIP_LINT_STAGED=true

source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/rake", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
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

if [ -e $OPT/fzf/shell/completion.zsh ]; then
  source $OPT/fzf/shell/key-bindings.zsh
  source $OPT/fzf/shell/completion.zsh
fi

LIBRESSL_HOME=$OPT/libressl

# RUBY_HOME=$OPT/ruby@3.3
# RUBY_GEMS_HOME=$LIB/ruby/gems/3.3.0

RUBY_HOME=$OPT/ruby@3.4
RUBY_GEMS_HOME=$LIB/ruby/gems/3.4.0

# NODE_HOME=$OPT/node@20
NODE_HOME=$OPT/node@22

POSTGRES_HOME=$OPT/postgresql@17

ES_HOME=/opt/elasticsearch

export PATH=$OPT/curl/bin:$OPT/openjdk/bin
export PATH=$PATH:$NODE_HOME/bin:$RUBY_HOME/bin:$RUBY_GEMS_HOME/bin:$POSTGRES_HOME/bin
export PATH=$PATH:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=$PATH:$OPT/python/libexec/bin
export PATH=$PATH:/opt/homebrew/bin:$PATH:/opt/homebrew/sbin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export DYLD_LIBRARY_PATH=$RUBY_HOME/lib:$OPT/jemalloc/lib
export LDFLAGS="-L$OPT/curl/lib -L$RUBY_HOME/lib -L$POSTGRES_HOME/lib"
export CPPFLAGS="-L$OPT/curl/include -I$RUBY_HOME/include -I$POSTGRES_HOME/include -I$OPT/openjdk/include"
export MALLOC_ARENA_MAX=2
export RUBYOPT="-W0 --yjit --yjit-exec-mem-size=32 --yjit-call-threshold=120"
export PKG_CONFIG_PATH=$OPT/curl/lib/pkgconfig:$RUBY_HOME/lib/pkgconfig:$POSTGRES_HOME/lib/pkgconfig:/opt/homebrew/opt/openssl@3/lib/pkgconfig
export PYTHONPATH
export GOPATH=$HOME/go
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vim"
export HOMEBREW_NO_ANALYTICS=1
export TERM="screen-256color"
export PGGSSENCMODE=disable
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/" --glob "!public/storage"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

source $ZSHELL_HOME/functions
source $ZSHELL_HOME/zsh_aliases

stty -ixon

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

ulimit -n 10240

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "/Users/filippo/.scm_breeze/scm_breeze.sh" ] && source "/Users/filippo/.scm_breeze/scm_breeze.sh"
source /Users/filippo/Library/Application\ Support/org.dystroy.broot/launcher/bash/br
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/filippo/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
#
