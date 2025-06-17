# Completion Settings
autoload -U compinit; compinit

setopt auto_list               # Show completion candidates
setopt auto_menu               # Show completion menu on successive tab press
setopt list_packed             # Pack completion candidates
setopt list_types              # Show file types in completion
setopt auto_pushd              # Auto pushd on cd
setopt prompt_subst            # Enable prompt substitution
setopt notify                  # Report background job status immediately

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Key bindings
bindkey -v                     # vi mode
bindkey "^[[Z" reverse-menu-complete  # Shift-Tab for reverse completion