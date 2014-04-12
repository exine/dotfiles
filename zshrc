#= ZSHRC
# Here's my zsh file. I'll guide you in what does what. Also,
# I'll document this for my own sake as well.
#
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

#= SHELL CONFIG
# Make vim our default editor
export EDITOR=gvim

# Set NPM config so we can install packages in our $HOME.
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

#= PATH CONFIG
# Let's set our PATH. Lower priority first. To override some binaries, just add new dir at bottom.
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:$PATH" # Core OS path. We don't need any /bin, because it's symlink to /usr/bin on arch.
export PATH="/usr/lib/ccache/bin:$PATH" # Ccache will sit between compiler and compilations, so we don't have to recompile everything
export PATH="$HOME/.rvm/bin:$PATH" # For rvm scripting
export PATH="$NPM_PACKAGED/bin:$PATH" # Here we handle our NPM packages in $HOME.

#= COMPILATION FLAGS
# Let's add some flags for compilation
export MAKEFLAGS="-j8" # Because we have 8 hardware threads
export CFLAGS="-march=native -mtune=native" # Because we aren't publishing our packages
export CXXFLAGS="-march=native -mtune=native" # As above

#= NO GLOBAL EXPRESSIONS LIST
# Here we don't expand glob regexp.
alias bower='noglob bower'

#= INCLUDE RVM
# We must include it here so it won't override anything when we apply our bundle

#= LET'S APPLY OUR BUNDLES
# By this one thing:
antigen apply
