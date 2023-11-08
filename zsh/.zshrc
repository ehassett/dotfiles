export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=ehassett
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export REPO_DIR=$HOME/Developer/Code
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
