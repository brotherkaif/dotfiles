#!/bin/bash
echo "┌───────────────────────────┐"
echo "│▛▀▖▞▀▖▞▀▖▀▛▘▞▀▖▀▛▘▛▀▖▞▀▖▛▀▖│"
echo "│▙▄▘▌ ▌▌ ▌ ▌ ▚▄  ▌ ▙▄▘▙▄▌▙▄▘│"
echo "│▌ ▌▌ ▌▌ ▌ ▌ ▖ ▌ ▌ ▌▚ ▌ ▌▌  │"
echo "│▀▀ ▝▀ ▝▀  ▘ ▝▀  ▘ ▘ ▘▘ ▘▘  │"
echo "└───────────────────────────┘"

# USAGE: $1=application (string), $2=cleanup (command)
execute_cleanup () {
	local application="$1"
	echo "CLEANUP: $application"
	$cleanup
}

# USAGE: $1=application (string), $2=paths (array)
symlink_dotfiles () {
	# assign args to local vars
	local application="$1"
	# shift all arguments to the left (original $1 & $2 gets lost)
	shift

	# bundle remaining args into array
	paths=("$@")

	echo "SYMLINKING: $application"
	for path in ${paths[@]}; do
		local directory=$HOME/$path
		local target=/$(realpath --relative-to=/ $PWD/$application/$path)
		echo ">> $path"
		ln -sf $target $directory
	done
}

# USAGE: call function
sync_submodules() {
	echo "SYNCING SUBMODULES"
	git submodule deinit --all -f
	git submodule init
	git submodule update
}

# USAGE: call function
setup_bash() {
	local application="bash"

	local cleanup=$(
		rm -rf $HOME/.bash* &&
		rm -rf $HOME/.inputrc
	)

	local paths=(
		".bash_profile"
		".bashrc"
		".inputrc"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_devdocs() {
	local application="devdocs"

	local cleanup=$(
		rm -rf $XDG_CONFIG_HOME/customisation/devdocs &&
		mkdir -p $XDG_CONFIG_HOME/customisation/devdocs
	)

	local paths=(
		".config/customisation/devdocs/devdocs.json"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_git() {
	local application="git"

	local cleanup=$(
		rm -rf $HOME/.gitconfig &&
		rm -rf $XDG_CONFIG_HOME/git &&
		mkdir -p $XDG_CONFIG_HOME/git
	)

	local paths=(
		".config/git/git-commit-template.txt"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_lazygit() {
	local application="lazygit"

	local cleanup=$(
		rm -rf $XDG_CONFIG_HOME/lazygit &&
		mkdir -p $XDG_CONFIG_HOME/lazygit
	)

	local paths=(
		".config/lazygit/config.yml"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_monero() {
	local application="monero"

	local cleanup=$(
		rm -rf $HOME/.bitmonero &&
		mkdir -p $HOME/.bitmonero
	)

	local paths=(
		".bitmonero/bitmonero.conf"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_newsboat() {
	local application="newsboat"

	local cleanup=$(
		rm -rf $XDG_CONFIG_HOME/newsboat &&
		mkdir -p $XDG_CONFIG_HOME/newsboat
	)

	local paths=(
		".config/newsboat/config"
		".config/newsboat/urls"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_lynx() {
	local application="lynx"

	local cleanup=$(
		rm -rf $HOME/.lynx*
	)

	local paths=(
		".lynx_bookmarks.html"
		".lynxrc"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_nvim() {
	local application="nvim"

	local cleanup=$(
		rm -rf $XDG_CONFIG_HOME/nvim &&
		rm -rf $XDG_DATA_HOME/nvim &&
		mkdir -p $XDG_DATA_HOME/nvim &&
		mkdir -p $XDG_CONFIG_HOME/nvim/lua &&
		mkdir -p $XDG_CONFIG_HOME/nvim/plugin
	)

	local paths=(
		".config/nvim/init.lua"
		".config/nvim/lua/pack.lua"
		".config/nvim/plugin/nvim-treesitter.lua"
		# ".config/nvim/lua/user/keymaps.lua"
		# ".config/nvim/lua/user/options.lua"
		# ".config/nvim/lua/user/configs/cmp.lua"
		# ".config/nvim/lua/user/configs/formatter.lua"
		# ".config/nvim/lua/user/configs/gitsigns.lua"
		# ".config/nvim/lua/user/configs/hop.lua"
		# ".config/nvim/lua/user/configs/lualine.lua"
		# ".config/nvim/lua/user/configs/nvim_comment.lua"
		# ".config/nvim/lua/user/configs/telescope.lua"
		# ".config/nvim/lua/user/configs/toggleterm.lua"
		# ".config/nvim/lua/user/configs/twilight.lua"
		# ".config/nvim/lua/user/configs/which-key.lua"
		# ".config/nvim/lua/user/configs/zen-mode.lua"
		# ".config/nvim/lua/user/configs/lsp/handlers.lua"
		# ".config/nvim/lua/user/configs/lsp/init.lua"
		# ".config/nvim/lua/user/configs/lsp/null-ls.lua"
		# ".config/nvim/lua/user/configs/lsp/nvim-lsp-installer.lua"
		# ".config/nvim/lua/user/configs/lsp/settings/jsonls.lua"
		# ".config/nvim/lua/user/configs/lsp/settings/sumneko_lua.lua"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_scripts() {
	local application="scripts"

	local cleanup=$(
		rm -rf $HOME/bin &&
		mkdir -p $HOME/bin
	)

	local paths=(
		"bin/scratch.sh"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_shell() {
	local application="shell"

	local cleanup=$(
		rm -rf $HOME/.shell*
	)

	local paths=(
		".shell_aliases"
		".shell_common"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_tmux() {
	local application="tmux"

	local cleanup=$(
		rm -rf $HOME/.tmux*
	)

	local paths=(
		".tmux.conf"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_vim() {
	local application="vim"

	local cleanup=$(
		rm -rf $HOME/.vim
	)

	local paths=(
		".vim"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_vim() {
	local application="vim"

	local cleanup=$(
		rm -rf $HOME/.vim
	)

	local paths=(
		".vim"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_zsh() {
	local application="zsh"

	local cleanup=$(
		rm -rf $HOME/.zsh*
	)

	local paths=(
		".zshrc"
	)

	execute_cleanup $application $cleanup
	symlink_dotfiles $application "${paths[@]}"
}

setup_bash
setup_devdocs
setup_git
setup_lazygit
setup_newsboat
setup_lynx
setup_nvim
setup_scripts
setup_shell
setup_tmux
setup_vim
setup_zsh

# display_message SYNCING
sync_submodules
