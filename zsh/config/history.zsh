# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt bang_hist          # Enable ! history expansion
setopt extended_history   # Save timestamps
setopt hist_ignore_dups   # Ignore consecutive duplicates
setopt share_history      # Share history between sessions
setopt hist_reduce_blanks # Remove extra blanks

# History search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# fzf history integration
zle -N fzf-history
bindkey '^r' fzf-history