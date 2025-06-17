# Base PATH Configuration
safe_path_add "/usr/local/bin"
safe_path_add "/usr/bin"

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi