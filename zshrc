export EDITOR=/usr/bin/vim
export WINEARCH=win32

#enables undeserved sense of superiority
setopt DVORAK

#some helpful aliases
alias alsamixer="alsamixer -c 1"
alias nvida-settings="optirun -b none nvidia-settings -c :8"
alias vim="vim -p"
alias dolphin-emu="cd ~/.dolphin-emu/Wii && primusrun dolphin-emu"
alias pstree="pstree --unicode --show-pids"
alias ls="ls --color"
alias gping="ping -c 3 -i .2 google.com"
alias l="ls -Al"
alias fox="firefox"
alias bird="thunderbird"

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


# Some functions, jump to :79 to get to the interesting stuff
git_branch_name() {
	git branch --list | grep -e '^\*' | awk '{print $2}'
}

git_ahead() {
	git rev-list --left-right --count master..origin/master \
		| head -n1 | awk '{print $1;}'
}

git_behind() {
	git rev-list --left-right --count master..origin/master \
		| head -n1 | awk '{print $2;}'
}

build_git_prompt() {

	STAT=$(git rev-parse --git-dir 2>/dev/null)

	if [[ -n $STAT ]]
	then
		local GIT_PROMPT='%{%F{green}%}('$(git_branch_name)' -'$(git_behind)'/+'$(git_ahead)')%f'
		echo $GIT_PROMPT
	fi

}

autoload -Uz colors && colors


RPROMPT='%(?.%F{green}.%F{red})%?%f'
precmd() {
	

	PROMPT='%n@%m '$(build_git_prompt)'
%~ '
	
	if [ $USER = "root" ]
	then
		PROMPT=$PROMPT'# '
	else
		PROMPT=$PROMPT'$ '
	fi
}
