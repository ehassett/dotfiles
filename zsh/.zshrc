cd ~

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=erhbg
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export REPO_DIR=$HOME/Repos

eval $(keychain --agents ssh --attempts 3 --eval id_rsa)

plugins=(
  docker
  docker-compose
  docker-machine
  git
  vim
)

source $ZSH/oh-my-zsh.sh
source /usr/share/rvm/scripts/rvm

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source ~/.zshrc && clear"
alias mux="tmuxinator"
alias dc="docker-compose"
alias dcr="docker-compose run"
alias dcu="docker-compose up"
alias dm="docker-machine"
alias dmu="export DOCKER_HOST=tcp://0.0.0.0:2375"

# Projects function
compctl -K _p p

_p() {
  local word words completions
  read -cA words
  word="${words[2]}"

  completions="$(ls $REPO_DIR/)"

  reply=("${(ps:\n:)completions}")
}

function p {
  if [[ -d $REPO_DIR/$1 ]]; then
    cd $REPO_DIR/$1
  else
    echo "ERROR: $REPO_DIR/$1 does not exist"
    return 1
  fi
  clear
}
