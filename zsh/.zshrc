export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=erhbg
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export REPO_DIR=$HOME/Repos

plugins=(
  docker
  docker-compose
  docker-machine
  git
  vim
)

source $ZSH/oh-my-zsh.sh

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source ~/.zshrc && clear"
alias dc="docker-compose"
alias dcr="docker-compose run"
alias dcu="docker-compose up"
alias dm="docker-machine"

function p {
  if [[ -d $REPO_DIR/$1 ]]; then
    cd $REPO_DIR/$1
  else
    echo "ERROR: $REPO_DIR/$1 does not exist"
    return 1
  fi
  clear
}
