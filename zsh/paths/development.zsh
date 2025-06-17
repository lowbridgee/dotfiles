# Development Tools PATH Configuration

# Go
safe_path_add "/usr/local/go/bin"

# Racket
safe_path_add "/Applications/Racket v6.2/bin"

# Poetry
safe_path_add "${HOME}/workspace/vision/dbt/.poetry/bin"

# PHP Environment
safe_path_add "${HOME}/.phpenv/bin"
if command -v phpenv >/dev/null 2>&1; then
  eval "$(phpenv init -)"
fi

# PHP versions
safe_path_add "/opt/homebrew/opt/php@8.3/bin"
safe_path_add "/opt/homebrew/opt/php@8.3/sbin"
safe_path_add "/opt/homebrew/opt/php@8.2/bin"
safe_path_add "/opt/homebrew/opt/php@8.2/sbin"
safe_path_add "/opt/homebrew/opt/php@7.4/bin"
safe_path_add "/opt/homebrew/opt/php@7.4/sbin"
safe_path_add "/opt/homebrew/opt/php@7.3/bin"
safe_path_add "/opt/homebrew/opt/php@7.3/sbin"

# Python
safe_path_add "${HOME}/Library/Python/3.10/bin"

# NVM
export NVM_DIR="$HOME/dotfiles/nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"

# SDKMAN
if [[ -x "$(command -v brew)" ]]; then
  export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec 2>/dev/null
  [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi