# Prompt
if command -v starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
  eval "$(starship init zsh)"
else
  PROMPT='%F{magenta}Ashlyn%f %F{blue}%~%f %# '
fi
