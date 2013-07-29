# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'r:|[._-/]=** r:|=**'
zstyle :compinstall filename '/home/exine/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Ruby dev aliases
alias -s rb=vim
alias -s txt=vim
alias -s erb=vim

# ArchLinux trick
alias "pacman=sudo pacman"

# Prompt setup
autoload -U promptinit
promptinit
prompt redhat

# RVM setup
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Add rvm as a function
