#!/bin/bash
gitsubrm() {
    git rm "$1"
    rm -rf ".git/modules/$1"
    git config -f ".git/config" --remove-section "submodule.$1" 2> /dev/null
    git commit -m "Remove submodule $1"
}

uninstall_submodule () {
	echo -e "[UNINSTALL VIM SUBMODULE]"
	echo "Enter module path (e.g. 'tpope/vim-suround):"
	read resp
	arrResp=(${resp//\// })
	plugaddress=$resp
	author=${arrResp[0]}
	plugin=${arrResp[1]}

	echo "Would you like to uninstall the following? (y/n)"
	echo "plugin: $plugin"
	echo "author: $author"

	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ]
	then
		echo "Removing submodule..."
		gitsubrm submodules/$plugin	
		echo "...done!"
		echo "Removing symlink..."
		rm ~/dotfiles/vim/.vim/pack/plugins/start/$plugin
		echo "...done!"
		cd ~/dotfiles
		echo "Bootstrapping..."
		./bootstrap.sh
		echo "...done!"
		echo "VIM RESTART REQUIRED"
	else
		echo "VIM SUBMODULE INSTALLATION SKIPPED"
	fi
}

uninstall_submodule
