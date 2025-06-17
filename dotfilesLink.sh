#!/bin/bash
# Integrated dotfiles setup script

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Backup existing files
backup_if_exists() {
  if [[ -f "$1" && ! -L "$1" ]]; then
    log_info "Backing up existing $1 to $1.backup"
    mv "$1" "$1.backup"
  fi
}

# Create symlinks safely
create_symlink() {
  local source="$1"
  local target="$2"
  
  if [[ -f "$source" || -d "$source" ]]; then
    backup_if_exists "$target"
    ln -sf "$source" "$target"
    log_info "Linked $source -> $target"
  else
    log_warn "$source does not exist"
  fi
}

# Main setup function
main() {
    log_info "Starting dotfiles setup..."
    
    # Create necessary directories
    mkdir -p ~/.vim
    
    # Define files to link (from old setup.sh)
    DOT_FILES=(.vim .vimrc)
    
    # Link dot files
    for file in "${DOT_FILES[@]}"; do
        if [[ -f ~/dotfiles/$file || -d ~/dotfiles/$file ]]; then
            create_symlink ~/dotfiles/$file ~/$file
        fi
    done
    
    # Link additional configuration files
    create_symlink ~/dotfiles/.vimrc ~/.vimrc
    create_symlink ~/dotfiles/colors ~/.vim/colors
    create_symlink ~/dotfiles/Brewfile ~/Brewfile
    
    # Choose between old and new zshrc
    if [[ -f ~/dotfiles/.zshrc.new ]]; then
        log_info "Using new modular .zshrc configuration"
        create_symlink ~/dotfiles/.zshrc.new ~/.zshrc
    else
        log_info "Using original .zshrc configuration"
        create_symlink ~/dotfiles/.zshrc ~/.zshrc
    fi
    
    log_info "Dotfiles setup completed successfully!"
    log_info "Run 'brew bundle' to install Homebrew packages"
}

# Run main function
main "$@"
