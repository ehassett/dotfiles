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
  git
  node
  npm
  nvm
  rvm
  terraform
)

# Load oh-my-zsh and rvm
source $ZSH/oh-my-zsh.sh
source $HOME/.rvm/scripts/rvm

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source ~/.zshrc && clear"
alias ud="sudo apt update && sudo apt upgrade -y"
alias mux="tmuxinator"
## Terraform aliases
alias tf="terraform"
alias tfa="terraform apply"
## WSL aliases
alias pwsh="pwsh.exe"

# p(rojects) function
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

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
