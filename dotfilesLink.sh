#!/bin/bash
# Integrated dotfiles setup script
set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

log_section() {
    echo -e "\n${BLUE}==== $1 ====${NC}"
}

# Backup existing files
backup_if_exists() {
    if [[ -e "$1" && ! -L "$1" ]]; then
        local backup_name="$1.backup.$(date +%Y%m%d_%H%M%S)"
        log_info "Backing up existing $1 to $backup_name"
        mv "$1" "$backup_name"
    fi
}

# Create symlinks safely
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [[ -f "$source" || -d "$source" ]]; then
        # Remove existing symlink if it points to the same source
        if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
            log_info "Symlink already exists: $target -> $source"
            return 0
        fi
        
        backup_if_exists "$target"
        ln -sf "$source" "$target"
        log_info "Linked $source -> $target"
    else
        log_warn "$source does not exist"
    fi
}

# Check dependencies
check_dependencies() {
    log_section "Checking Dependencies"
    
    local missing_deps=()
    
    # Check for Neovim
    if ! command -v nvim &> /dev/null; then
        missing_deps+=("neovim")
        log_warn "Neovim is not installed"
    else
        log_info "Neovim: $(nvim --version | head -n1)"
    fi
    
    # Check for optional but recommended tools
    local optional_tools=("rg" "fd" "node")
    for tool in "${optional_tools[@]}"; do
        if command -v "$tool" &> /dev/null; then
            log_info "$tool is installed"
        else
            log_warn "$tool is not installed (optional but recommended)"
        fi
    done
    
    # Report missing dependencies
    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        log_error "Missing required dependencies: ${missing_deps[*]}"
        log_info "Install with: brew install ${missing_deps[*]}"
        return 1
    fi
    
    return 0
}

# Setup Vim configuration
setup_vim() {
    log_section "Setting up Vim Configuration"
    
    # Create necessary directories
    mkdir -p ~/.vim
    
    # Define Vim-related files to link
    local vim_files=(.vim .vimrc)
    
    # Link Vim files
    for file in "${vim_files[@]}"; do
        if [[ -f ~/dotfiles/$file || -d ~/dotfiles/$file ]]; then
            create_symlink ~/dotfiles/$file ~/$file
        fi
    done
    
    # Link colors directory
    create_symlink ~/dotfiles/colors ~/.vim/colors
    
    # If .vimrc exists in vim/ directory, link it
    if [[ -f ~/dotfiles/vim/.vimrc ]]; then
        create_symlink ~/dotfiles/vim/.vimrc ~/.vimrc
    fi
}

# Setup Neovim configuration
setup_neovim() {
    log_section "Setting up Neovim Configuration"
    
    # Create config directory if it doesn't exist
    mkdir -p ~/.config
    
    # Check if Neovim config exists in dotfiles
    if [[ -d ~/dotfiles/nvim ]]; then
        create_symlink ~/dotfiles/nvim ~/.config/nvim
        
        # Create necessary Neovim directories
        mkdir -p ~/.local/share/nvim
        mkdir -p ~/.cache/nvim
        
        log_info "Neovim configuration linked successfully"
        log_info "Run 'nvim' to start Neovim and install plugins automatically"
    else
        log_warn "Neovim configuration not found in ~/dotfiles/nvim"
        log_info "Create Neovim config with: mkdir -p ~/dotfiles/nvim/lua/{config,plugins}"
    fi
}

# Setup shell configuration
setup_shell() {
    log_section "Setting up Shell Configuration"
    
    # Choose between old and new zshrc
    if [[ -f ~/dotfiles/.zshrc.new ]]; then
        log_info "Using new modular .zshrc configuration"
        create_symlink ~/dotfiles/.zshrc.new ~/.zshrc
    elif [[ -f ~/dotfiles/.zshrc ]]; then
        log_info "Using original .zshrc configuration"
        create_symlink ~/dotfiles/.zshrc ~/.zshrc
    else
        log_warn "No .zshrc found in dotfiles"
    fi
    
    # Link zsh configuration directory if it exists
    if [[ -d ~/dotfiles/zsh ]]; then
        create_symlink ~/dotfiles/zsh ~/.zsh
    fi
}

# Setup other configurations
setup_other() {
    log_section "Setting up Other Configurations"
    
    # Brewfile
    create_symlink ~/dotfiles/Brewfile ~/Brewfile
    
    # Git configuration (if exists)
    if [[ -f ~/dotfiles/.gitconfig ]]; then
        create_symlink ~/dotfiles/.gitconfig ~/.gitconfig
    fi
    
    # tmux configuration (if exists)
    if [[ -f ~/dotfiles/.tmux.conf ]]; then
        create_symlink ~/dotfiles/.tmux.conf ~/.tmux.conf
    fi
}

# Print post-setup instructions
print_instructions() {
    log_section "Setup Complete!"
    
    echo -e "\nNext steps:"
    echo "1. Run 'brew bundle' to install Homebrew packages"
    echo "2. Start Neovim with 'nvim' to install plugins"
    echo "3. Run ':checkhealth' in Neovim to verify setup"
    echo "4. Install LSP servers with ':Mason' in Neovim"
    
    if [[ ! -d ~/dotfiles/nvim ]]; then
        echo -e "\n${YELLOW}To add Neovim configuration:${NC}"
        echo "1. Create config structure: mkdir -p ~/dotfiles/nvim/lua/{config,plugins}"
        echo "2. Add configuration files"
        echo "3. Run this script again"
    fi
}

# Main setup function
main() {
    log_info "Starting dotfiles setup..."
    log_info "Dotfiles directory: ~/dotfiles"
    
    # Check if dotfiles directory exists
    if [[ ! -d ~/dotfiles ]]; then
        log_error "~/dotfiles directory not found!"
        exit 1
    fi
    
    # Setup configurations
    setup_vim
    setup_neovim
    setup_shell
    setup_other
    
    # Check dependencies (optional, continues even if some are missing)
    check_dependencies || true
    
    # Print instructions
    print_instructions
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --vim-only)
            log_info "Setting up Vim configuration only"
            setup_vim
            exit 0
            ;;
        --nvim-only)
            log_info "Setting up Neovim configuration only"
            setup_neovim
            exit 0
            ;;
        --check)
            log_info "Checking dependencies only"
            check_dependencies
            exit $?
            ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  --vim-only    Setup only Vim configuration"
            echo "  --nvim-only   Setup only Neovim configuration"
            echo "  --check       Check dependencies only"
            echo "  -h, --help    Show this help message"
            exit 0
            ;;
        *)
            log_error "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

# Run main function
main "$@"
