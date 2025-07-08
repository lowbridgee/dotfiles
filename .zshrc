#!/usr/bin/env zsh
# Modular ZSH Configuration

# Base directory
ZSH_CONFIG_DIR="${HOME}/dotfiles/zsh"

# Load configuration modules in order
config_modules=(
  "exports"
  "functions" 
  "completion"
  "history"
  "aliases"
  "prompt"
)

for module in "${config_modules[@]}"; do
  config_file="${ZSH_CONFIG_DIR}/config/${module}.zsh"
  if [[ -r "$config_file" ]]; then
    source "$config_file"
  else
    echo "Warning: Could not load $config_file"
  fi
done

# Load PATH configurations
path_modules=(
  "base"
  "development"
  "cloud"
)

for module in "${path_modules[@]}"; do
  path_file="${ZSH_CONFIG_DIR}/paths/${module}.zsh"
  if [[ -r "$path_file" ]]; then
    source "$path_file"
  else
    echo "Warning: Could not load $path_file"
  fi
done

# Load local configuration if exists
local_config="${ZSH_CONFIG_DIR}/local/.zshrc.local"
[[ -r "$local_config" ]] && source "$local_config"
export NVM_DIR="$HOME/dotfiles/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
