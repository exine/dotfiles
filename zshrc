#= ZSHRC
# Here's my zsh file. I'll guide you in what does what. Also,
# I'll document this for my own sake as well.
#= SHELL CONFIG
# It's wise to do it here, since our PATH depends on them.
# Make vim our default editor
export EDITOR=vim

# Set NPM config so we can install packages in our $HOME.
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

#= COMPILATION FLAGS
# Let's add some flags for compilation
export MAKEFLAGS="-j8" # Because we have 8 hardware threads
export CFLAGS="-march=native -mtune=native" # Because we aren't publishing our packages
export CXXFLAGS="-march=native -mtune=native" # As above


#= PATH CONFIG
# Let's set our PATH. Lower priority first. To override some binaries, just add new dir at bottom.
# We must do it here, since our includes will mess with them later on (for example rvm adds it's own entries).
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:$PATH" # Core OS paths
export PATH="/usr/lib/ccache/bin:$PATH" # Ccache will sit between compiler and compilations, so we don't have to recompile everything
export PATH="$NPM_PACKAGES/bin:$PATH" # Here we handle our NPM packages in $HOME.
export PATH="$HOME/.rvm/bin:$PATH" # For rvm scripting
#= INCLUDES
# Let's include everything here ASAP
[[ -s "$HOME/.antigen/antigen.zsh" ]] && source $HOME/.antigen/antigen.zsh # Antigen
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # RVM
#= ANTIGEN CONFIG
# oh-my-zsh will be used by everything, let's handle it here
antigen use oh-my-zsh
# Our bundles are as follows:
antigen bundles <<EOBUNDLES
	archlinux
	git
	github
	rvm
	rails
	mercurial
	node
	npm
EOBUNDLES
# And here we set a theme
antigen theme arrow
#= NO GLOBAL EXPRESSIONS LIST
# Here we don't expand glob regexp.
alias bower='noglob bower'

#= LET'S APPLY OUR BUNDLES
# By this one thing:
antigen apply
