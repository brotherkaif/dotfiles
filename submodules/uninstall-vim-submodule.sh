#!/bin/bash
gitsubremove() {
	git rm "submodules/$1"
	rm -rf ".git/modules/submodules/$1"
	git config -f ".git/config" --remove-section "submodule.submodules/$1" 2> /dev/null
	rm ~/dotfiles/vim/.vim/pack/plugins/start/$1
	git add .
	git commit -m "chore(submodules): removed $1"
}

uninstall_submodule() {
	echo -e "[UNINSTALL VIM SUBMODULE]"
	echo "Enter module path (e.g. 'tpope/vim-fugitive):"
	read resp
	arrResp=(${resp//\// })
	plugaddress=$resp
	author=${arrResp[0]}
	plugin=${arrResp[1]}

	echo "plugin: $plugin"
	echo "author: $author"
	echo "Would you like to uninstall the submodule? (y/n)"

	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ]
	then
		echo "Removing submodule..."
		cd ~/dotfiles
		gitsubremove $plugin	
		echo "...done!"

		cd ~/dotfiles

		echo "Bootstrapping..."
		./bootstrap.sh
		echo "...done!"

		echo "VIM RESTART REQUIRED"
	else
		echo "VIM SUBMODULE UNINSTALLATION SKIPPED"
	fi
}

uninstall_submodule
