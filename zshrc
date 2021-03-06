export EDITOR=/usr/bin/vim
export WINEARCH=win32

#enables undeserved sense of superiority
setopt DVORAK

#some helpful aliases
alias alsamixer="alsamixer -c 0"
alias vim="vim -p"
alias pstree="pstree --unicode --show-pids"
alias ls="ls --color"
alias gping="ping -c 3 -i .2 google.com"
alias l="ls -Al"
alias la="ls -A"
alias fox="firefox"
alias bird="thunderbird"
alias steam="steam-native"
alias pacman="pacaur"
alias youtube-album-dl="youtube-dl -x -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' --recode-video ogg"
function findsym() {
	find . -type f -exec grep -l $1 {} \;
}
function todo() {
	if [[ $1 ]]
	then
		echo $@ >> ~/todo.txt
	fi
}

stty -ixon # Ctrl+S won't lock up the terminal
function todo() {
	if [[ $1 ]]
	then
		echo $@ >> ~/in.txt
	fi
}
function showtodo() {
	cat ~/in.txt
}

# Colorize less output, including man pages
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

#Completion options, tab gives a menu, up or down matches prefix in history
zstyle ':completion:*' menu select

autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U colors && colors

autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N down-line-or-beginning-search
autoload -U colors && colors

HISTFILE=~/.zhistory

SAVEHIST=1000
HISTSIZE=1000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type ls and then ls again, only save the last one
setopt HIST_IGNORE_DUPS

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search




# Custom git status, probably vulnerable to https://github.com/njhartwell/pw3nage
__GIT_IN_TREE="0"
__GIT_BRANCH="master"
__GIT_COMM_AHEAD="0"
__GIT_COMM_BEHIND="0"
__GIT_DIRTY="0"
__GIT_REMOTE_EXISTS="1"
__GIT_PROMPT=""

update_git_status() {
	if $(git rev-parse --git-dir &>/dev/null)
	then
		__GIT_IN_TREE="1"
		__GIT_BRANCH=$(git branch --list | grep -e '^\*' | awk '{print $2;}')
		if git rev-list --left-right --count origin/$__GIT_BRANCH..$__GIT_BRANCH &>/dev/null
		then
			__GIT_REMOTE_EXISTS="1"
			__GIT_COMM_BEHIND=$(git rev-list --left-right --count origin/$__GIT_BRANCH..$__GIT_BRANCH | awk '{print $1;}')
			__GIT_COMM_AHEAD=$(git rev-list --left-right --count origin/$__GIT_BRANCH..$__GIT_BRANCH | awk '{print $2;}')
		else
			__GIT_REMOTE_EXISTS="0"
		fi
		if $(git status | grep -e \
			'^nothing to commit, working directory clean$' &>/dev/null)
		then
			__GIT_DIRTY="0"
		else
			__GIT_DIRTY="1"
		fi
	else
		__GIT_IN_TREE="0"
	fi

	#Update the git prompt based on what we found out
	if [[ $__GIT_IN_TREE = "1" ]]
	then
		if [[ $__GIT_DIRTY = "0" ]]
		then
			__GIT_PROMPT='%{%F{green}%}'
		else
			__GIT_PROMPT='%{%F{yellow}%}'
		fi
		__GIT_PROMPT=$__GIT_PROMPT'('$__GIT_BRANCH
		if [[ $__GIT_REMOTE_EXISTS = "1" ]]
		then
			__GIT_PROMPT=$__GIT_PROMPT' -'$__GIT_COMM_BEHIND'/+'$__GIT_COMM_AHEAD
		fi
		__GIT_PROMPT=$__GIT_PROMPT')%f'
	else
		__GIT_PROMPT=""
	fi
}

colorized_retcode() {
	echo '%(?.%F{green}.%F{red})%?%f'
}


autoload -Uz colors && colors


precmd() {
	
	RPROMPT=$(colorized_retcode)
	update_git_status
	PROMPT='%n@%m '$__GIT_PROMPT'
%~ '
	
	if [ $USER = "root" ]
	then
		PROMPT=$PROMPT'# '
	else
		PROMPT=$PROMPT'$ '
	fi
}
