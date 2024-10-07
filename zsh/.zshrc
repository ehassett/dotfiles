# Oh My Zsh!
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=""
plugins=(
  asdf
  aws
  gcloud
  git
  golang
  npm
  terraform
)
source $ZSH/oh-my-zsh.sh

# Exports
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export P_DIR="$HOME/Developer/Personal"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:/usr/local/bin/code:$HOME/.asdf/shims"

# Load Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Keychain
eval "$(keychain --agents ssh --attempts 3 --eval id_rsa)"

# Load Starship
eval "$(starship init zsh)"

# Load Assume
alias assume="source assume"

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source ~/.zshrc && clear"
alias ud="brew update && brew upgrade"
alias commit='git commit --date="$(date -u)"'

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
