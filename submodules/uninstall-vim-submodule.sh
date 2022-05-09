#!/bin/bash
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
		cd ~/dotfiles
		rm -rf ~/dotfiles/submodules/$plugin
		git submodule deinit -f -- submodules/$plugin    
		rm -rf ~/dotfiles/.git/modules/submodules/$plugin
		git rm -f submodules/$plugin
		cd ~/dotfiles && git rm "submodules/$plugin"
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
