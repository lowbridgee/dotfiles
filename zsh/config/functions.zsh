# Custom Functions

# cd command with automatic ls
function cd() {
  builtin cd $@ && ls;
}

# Show all history
function history-all() { 
  history -E 1 
}

# fzf history search
function fzf-history() {
  BUFFER=$(history -n 1 | fzf --exact --no-sort +m --tac -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort --query "$LBUFFER")
  CURSOR=$#BUFFER
}

# Safe path addition function
function safe_path_add() {
  if [[ -d "$1" && ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}