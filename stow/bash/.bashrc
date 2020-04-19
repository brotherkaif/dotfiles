#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|
#==================================

#MOTD
echo "╺┳╸┏━╸┏━┓┏┳┓╻┏┓╻┏━┓╻  "
echo " ┃ ┣╸ ┣┳┛┃┃┃┃┃┗┫┣━┫┃  "
echo " ╹ ┗━╸╹┗╸╹ ╹╹╹ ╹╹ ╹┗━╸"

#XDG BASE DIRECTORY CONFIG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

#XDG OVERRIDES
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
alias tmux='tmux -f ~/.config/tmux/tmux.conf'
alias irssi='irssi --config="$XDG_CONFIG_HOME"/irssi/config --home="$HOME"/irssi'

#VIM KEYS
set -o vi

#NVM SETUP
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#PROMPT
##get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

##get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

##export prompt
export PS1="\[\e[36m\][\[\e[m\]\[\e[36m\]\W\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[33m\]\`parse_git_branch\`\[\e[m\]\[\e[31m\]\n >\[\e[m\] "

#appimage aliases
if [ $( echo "$OSTYPE" | grep 'linux-gnu' ) ] ; then
	alias nvim-i='~/.apps/nvim/nvim.appimage'
	alias crt-i='~/.apps/crt/crt.appimage'
fi

#radio aliases
alias somafm-reggae='clear && echo http://somafm.com/ && toilet -f slant -F border:metal reggae && mplayer http://ice5.somafm.com/reggae-256-mp3'
alias somafm-groovesalad='clear && echo http://somafm.com/ && toilet -f slant -F border:metal groovesalad && mplayer http://ice5.somafm.com/groovesalad-256-mp3'
alias somafm-gsclassic='clear && echo http://somafm.com/ && toilet -f slant -F border:metal gsclassic && mplayer http://ice6.somafm.com/gsclassic-128-mp3'
alias somafm-deepspaceone='clear && echo http://somafm.com/ && toilet -f slant -F border:metal deepspaceone && mplayer http://ice2.somafm.com/deepspaceone-128-mp3'
alias somafm-spacestation='clear && echo http://somafm.com/ && toilet -f slant -F border:metal spacestation && mplayer http://ice4.somafm.com/spacestation-128-mp3'
alias somafm-defcon='clear && echo http://somafm.com/ && toilet -f slant -F border:metal defcon && mplayer http://ice6.somafm.com/defcon-256-mp3'
alias somafm-thetrip='clear && echo http://somafm.com/ && toilet -f slant -F border:metal thetrip && mplayer http://ice2.somafm.com/thetrip-128-mp3'
alias somafm-7soul='clear && echo http://somafm.com/ && toilet -f slant -F border:metal 7soul && mplayer http://ice5.somafm.com/7soul-128-mp3'
alias somafm-seventies='clear && echo http://somafm.com/ && toilet -f slant -F border:metal seventies && mplayer http://ice5.somafm.com/seventies-128-mp3'
alias somafm-u80s='clear && echo http://somafm.com/ && toilet -f slant -F border:metal u80s && mplayer http://ice5.somafm.com/u80s-128-mp3'
alias somafm-secretagent='clear && echo http://somafm.com/ && toilet -f slant -F border:metal secretagent && mplayer http://ice4.somafm.com/secretagent-128-mp3'
alias somafm-lush='clear && echo http://somafm.com/ && toilet -f slant -F border:metal lush && mplayer http://ice4.somafm.com/lush-128-mp3'
alias somafm-thistle='clear && echo http://somafm.com/ && toilet -f slant -F border:metal thistle && mplayer http://ice4.somafm.com/thistle-128-mp3'
alias somafm-fluid='clear && echo http://somafm.com/ && toilet -f slant -F border:metal fluid && mplayer http://ice4.somafm.com/fluid-128-mp3'
alias somafm-poptron='clear && echo http://somafm.com/ && toilet -f slant -F border:metal poptron && mplayer http://ice5.somafm.com/poptron-128-mp3'
alias somafm-dronezone='clear && echo http://somafm.com/ && toilet -f slant -F border:metal dronezone && mplayer http://ice2.somafm.com/dronezone-256-mp3'
alias somafm-beatblender='clear && echo http://somafm.com/ && toilet -f slant -F border:metal beatblender && mplayer http://ice2.somafm.com/beatblender-128-mp3'
alias somafm-bootliquor='clear && echo http://somafm.com/ && toilet -f slant -F border:metal bootliquor && mplayer http://ice2.somafm.com/bootliquor-128-mp3'
alias somafm-illstreet='clear && echo http://somafm.com/ && toilet -f slant -F border:metal illstreet && mplayer http://ice6.somafm.com/illstreet-128-mp3'
alias somafm-bagel='clear && echo http://somafm.com/ && toilet -f slant -F border:metal bagel && mplayer http://ice6.somafm.com/bagel-128-mp3'
alias somafm-indiepop='clear && echo http://somafm.com/ && toilet -f slant -F border:metal indiepop && mplayer http://ice4.somafm.com/indiepop-128-mp3'
alias somafm-digitalis='clear && echo http://somafm.com/ && toilet -f slant -F border:metal digitalis && mplayer http://ice4.somafm.com/digitalis-128-mp3'
alias somafm-folkfwd='clear && echo http://somafm.com/ && toilet -f slant -F border:metal folkfwd && mplayer http://ice4.somafm.com/folkfwd-128-mp3'
alias somafm-cliqhop='clear && echo http://somafm.com/ && toilet -f slant -F border:metal cliqhop && mplayer http://ice5.somafm.com/cliqhop-256-mp3'
alias somafm-dubstep='clear && echo http://somafm.com/ && toilet -f slant -F border:metal dubstep && mplayer http://ice2.somafm.com/dubstep-128-mp3'
alias somafm-suburbsofgoa='clear && echo http://somafm.com/ && toilet -f slant -F border:metal suburbsofgoa && mplayer http://ice2.somafm.com/suburbsofgoa-128-mp3'
alias somafm-missioncontrol='clear && echo http://somafm.com/ && toilet -f slant -F border:metal missioncontrol && mplayer http://ice5.somafm.com/missioncontrol-128-mp3'
alias somafm-sf1033='clear && echo http://somafm.com/ && toilet -f slant -F border:metal sf1033 && mplayer http://ice6.somafm.com/sf1033-128-mp3'
alias somafm-sonicuniverse='clear && echo http://somafm.com/ && toilet -f slant -F border:metal sonicuniverse && mplayer http://ice6.somafm.com/sonicuniverse-256-mp3'
alias somafm-metal='clear && echo http://somafm.com/ && toilet -f slant -F border:metal metal && mplayer http://ice2.somafm.com/metal-128-mp3'
alias somafm-covers='clear && echo http://somafm.com/ && toilet -f slant -F border:metal covers && mplayer http://ice5.somafm.com/covers-128-mp3'
alias somafm-specials='clear && echo http://somafm.com/ && toilet -f slant -F border:metal specials && mplayer http://ice4.somafm.com/specials-128-mp3'
alias somafm-live='clear && echo http://somafm.com/ && toilet -f slant -F border:metal live && mplayer http://ice6.somafm.com/live-128-mp3'
alias somafm-xmasinfrisko='clear && echo http://somafm.com/ && toilet -f slant -F border:metal xmasinfrisko && mplayer http://ice6.somafm.com/xmasinfrisko-128-mp3'
alias somafm-christmas='clear && echo http://somafm.com/ && toilet -f slant -F border:metal christmas && mplayer http://ice6.somafm.com/christmas-256-mp3'
alias somafm-xmasrocks='clear && echo http://somafm.com/ && toilet -f slant -F border:metal xmasrocks && mplayer http://ice4.somafm.com/xmasrocks-128-mp3'
alias somafm-jollysoul='clear && echo http://somafm.com/ && toilet -f slant -F border:metal jollysoul && mplayer http://ice2.somafm.com/jollysoul-128-mp3'

#git aliases
alias gst='git status'
