# Environment
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-code --wait}"
export TERMINAL="${TERMINAL:-wezterm}"
export BROWSER="${BROWSER:-firefox}"
export PAGER="${PAGER:-less}"
export MANPAGER="sh -c 'col -bx | bat -l man -p 2>/dev/null || cat'"
export GPG_TTY="$(tty 2>/dev/null)"
export SUDO_PROMPT="Ashlyn password: "
export LESS='-R --use-color -Dd+r$Du+b'
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --cycle --info=inline --prompt='❯ '"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# Wayland-friendly defaults when a compositor/session exports WAYLAND_DISPLAY.
if [[ -n "$WAYLAND_DISPLAY" ]]; then
  export MOZ_ENABLE_WAYLAND=1
  export QT_QPA_PLATFORM="wayland;xcb"
  export SDL_VIDEODRIVER=wayland
  export CLUTTER_BACKEND=wayland
fi

# Local private overrides are never committed.
[[ -r "$ZDOTDIR/local.zsh" ]] && source "$ZDOTDIR/local.zsh"
