export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=erhbg
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export REPO_DIR=$HOME/Repos
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:/home/linuxbrew/.linuxbrew/bin"

eval $(keychain --agents ssh --attempts 3 --eval id_rsa)
eval `dircolors ~/.dir_colors/dircolors.256darksolarized`

plugins=(
  docker
  docker-compose
  git
  golang
  terraform
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

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
## Docker aliases
alias dc="docker-compose"
alias dcu="docker-compose up"

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

# tf_prompt_info function
## Outputs the current Terraform workspace if .terraform exists
function tf_prompt_info {
  if [[ -d ./.terraform ]]; then
    echo "tf:($(terraform workspace show))"
  else
    echo ""
  fi
}

# prompt_info function
## Wrapper function for zsh prompt info
function prompt_info {
  if [[ -z $1 ]]; then
    echo "%{\e[0;36m%}$2"
  elif [[ -z $2 ]]; then
    echo "%{\e[0;36m%}$1"
  else
    echo "%{\e[0;36m%}$1%{\e[1;91m%}|%{\e[0;36m%}$2"
  fi
}

# Add tfvm to PATH
export PATH="$PATH:$HOME/.tfvm/bin"
