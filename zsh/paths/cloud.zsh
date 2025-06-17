# Cloud Tools PATH Configuration

# Google Cloud SDK
if [[ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]]; then 
  source "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
fi

if [[ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]]; then 
  source "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

# Snowflake SnowSQL
safe_path_add "/Applications/SnowSQL.app/Contents/MacOS"