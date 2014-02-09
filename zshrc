source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
	archlinux
	git
	github
	rvm
	rails
	mercurial
EOBUNDLES

export NPM_PACKAGES="$HOME/.npm-packages"
export EDITOR=vim
export PATH="$NPM_PACKAGES/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:$PATH"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias bower='noglob bower'

antigen apply

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
