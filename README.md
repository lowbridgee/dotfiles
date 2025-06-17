# dotfiles

Personal dotfiles for macOS development environment setup.

## New Modular Structure

The ZSH configuration has been refactored into a modular structure:

```
zsh/
├── config/
│   ├── exports.zsh     # Environment variables
│   ├── aliases.zsh     # Command aliases
│   ├── functions.zsh   # Custom functions
│   ├── prompt.zsh      # Prompt configuration
│   ├── completion.zsh  # Tab completion settings
│   └── history.zsh     # History configuration
├── paths/
│   ├── base.zsh        # Basic PATH setup
│   ├── development.zsh # Development tools
│   └── cloud.zsh       # Cloud service tools
└── local/
    └── .zshrc.local    # Machine-specific settings
```

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url> ~/dotfiles
   ```

2. Run the integrated setup script:
   ```bash
   cd ~/dotfiles
   ./dotfilesLink.sh
   ```
   
   The script will automatically:
   - Backup existing configuration files
   - Create necessary directories
   - Create symlinks to dotfiles
   - Use the new modular ZSH configuration if available

3. Install Homebrew packages:
   ```bash
   brew bundle
   ```

## Features

- **Integrated Setup**: Single script handles all installation steps
- **Modular Configuration**: Easy to maintain and customize ZSH settings
- **Safe PATH Management**: Prevents duplicate entries and validates paths
- **Backup Protection**: Automatically backs up existing configuration files
- **Local Customization**: Machine-specific settings via `.zshrc.local`
- **Error Handling**: Colored output and proper error management
- **Clean Architecture**: Removed unused Ansible and direnv configurations

## Migration

The script automatically detects and uses the new modular configuration (`.zshrc.new`) if available, otherwise falls back to the original `.zshrc`.