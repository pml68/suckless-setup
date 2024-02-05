#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

YELLOW="\[$(tput setaf 3)\]"
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"

keyfunc() {
  if [ -z "${SSH_AGENT_PID}" ]; then
    ssh-agent -t 1h && eval $(ssh-agent -t 1h) && ssh-add ~/.ssh/id_ed25519
  fi
}

alias ls='echo "use eza"'
alias grep='grep --color=auto'
alias la='echo "use eza"'
alias eza='eza --icons'
alias c='clear'
alias pac='sudo pacman'
alias cls='c && eza'
alias cla='c && eza -a'
alias key=keyfunc
alias starter='pac -Syu && key && update'
alias ssdn='sudo shutdown -h now'
alias npm='echo "nuh-uh"'
alias http='python -m http.server 5173'
alias cat='echo "use bat"'
alias lazygit='key && lazygit'

parse_git_bg() {
  if [[ $(git status -s 2> /dev/null) ]]; then
    tput setaf 160
  else
    tput setaf 34
  fi
}

PS1="╭─${YELLOW}"
PS1+="\u${GREEN}"
PS1+="@${RED}"
PS1+="\h${BLUE} "
PS1+="\w${RESET}"
PS1+="\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"" 
PS1+="\$(parse_git_bg) "
PS1+=" (BRANCH) " 
PS1+="${RESET}\")\n" 
PS1+="╰─" 
PS1+="\\$ " 
PS1+="${RESET}"
export PS1

export EDITOR=nvim

neofetch

# pnpm
export PNPM_HOME="/home/umberto/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
