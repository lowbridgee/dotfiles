# Aliases
alias history='history -E'
alias clean_branch='git branch --merged|grep -v -E "\*|master"|xargs -n1 -I{} git branch -d {}'
alias find='gfind'

# ghq + fzf
alias cr='cd $(ghq list -p | fzf --reverse)'