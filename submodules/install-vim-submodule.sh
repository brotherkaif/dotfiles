#!/bin/bash
gitsubadd() {
	git submodule add https://github.com/$1
	git add .
    git commit -m "chore(submodules): added $2"
}

install_submodule () {
	echo -e "[INSTALL VIM SUBMODULE]"
	echo "Enter module path (e.g. 'tpope/vim-suround):"
	read resp
	arrResp=(${resp//\// })
	plugaddress=$resp
	author=${arrResp[0]}
	plugin=${arrResp[1]}

	echo "Would you like to install the following? (y/n)"
	echo "plugin: $plugin"
	echo "author: $author"

	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ]
	then
		echo "Adding submodule..."
		cd ~/dotfiles/submodules
		gitsubadd $plugaddress submodules/$plugin
		echo "...done!"
		echo "Symlinking submodule..."
		cd ~/dotfiles/vim/.vim/pack/plugins/start/ 
		ln -s ../../../../../submodules/$plugin $plugin
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

install_submodule
