export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="erhbg"
export TERM=xterm-256color

plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source .zshrc && clear"
alias dc="docker-compose"
alias dcr="docker-compose run"
alias dcu="docker-compose up"
alias dm="docker-machine"
