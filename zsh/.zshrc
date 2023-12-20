export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=ehassett
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export P_DIR="$HOME/Developer/Personal"
export AE_DIR="$HOME/Developer/Auction Edge"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin/code"
export AWS_VAULT_KEYCHAIN_NAME=login

plugins=(
  git
)

# Load oh-my-zsh, brew, keychain, and assume
source $ZSH/oh-my-zsh.sh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(keychain --agents ssh --attempts 3 --eval id_rsa)"
alias assume="source assume"

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source ~/.zshrc && clear"
alias ud="brew update && brew upgrade"
alias mux="tmuxinator"
alias tf="terraform"

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

# p(ersonal) projects function
## Type `p <project>` to cd into a personal project dir
compctl -K _p p

_p() {
  local word words completions
  read -cA words
  word="${words[2]}"

  completions="$(ls $P_DIR/)"

  reply=("${(ps:\n:)completions}")
}

function p {
  if [[ -d $P_DIR/$1 ]]; then
    cd $P_DIR/$1
  else
    echo "ERROR: $P_DIR/$1 does not exist"
    return 1
  fi
  clear
}

# a(uction)e(dge) projects function
## Type `ae <project>` to cd into an Auciton Edge project dir
compctl -K _ae ae

_ae() {
  local word words completions
  read -cA words
  word="${words[2]}"

  completions="$(ls $AE_DIR/)"

  reply=("${(ps:\n:)completions}")
}

function ae {
  if [[ -d $AE_DIR/$1 ]]; then
    cd $AE_DIR/$1
  else
    echo "ERROR: $AE_DIR/$1 does not exist"
    return 1
  fi
  clear
}