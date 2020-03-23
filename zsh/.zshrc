cd ~

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=erhbg
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export REPO_DIR=$HOME/Repos

eval $(keychain --agents ssh --attempts 3 --eval id_rsa)
eval `dircolors ~/.dir_colors/dircolors.256darksolarized`

plugins=(
  docker
  docker-compose
  docker-machine
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.rvm/scripts/rvm

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source ~/.zshrc && clear"
alias ud="sudo apt update && sudo apt upgrade -y"
alias mux="tmuxinator"
## Docker aliases
alias dc="docker-compose"
alias dcr="docker-compose run"
alias dcu="docker-compose up"
alias dm="docker-machine"
## Rails aliases
alias be="bundle exec"

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

# cmd function
function cmd {
  if grep -q microsoft /proc/version; then
    echo $1 | cmd.exe
  else
    echo "Cannot verify this as a WSL install, cmd will not work."
  fi
}
