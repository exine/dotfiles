#!/bin/zsh
#=
# A small script for updating homedir
# It must be included

auto_update_all() {
	save_cdir
	echo ">> Updating antigen"
	auto_update_antigen
	
	echo ">> Updating plugins"
	auto_update_plugins hg
	auto_update_plugins git
	restore_cdir
}

auto_update_antigen() {
	antigen selfupdate
	antigen update
}

auto_update_plugins() {
	[ ! -x "$HOME/Plugins/$1" ] && return 0
	for fld in $HOME/Plugins/$1/*; do
		cd $fld
		$1 pull -u
	done
}

save_cdir() {
	export __AU_CDIR=`pwd`
}

restore_cdir() {
	cd "$__AU_CDIR"
	unset __AU_CDIR
}
