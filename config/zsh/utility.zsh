# Utility functions

config-pick() {
  local file current_dir="$PWD"
  cd "${XDG_CONFIG_HOME:-$HOME/.config}" || return
  file="$(fd --type f --hidden --exclude .git . 2>/dev/null | fzf --prompt='config ❯ ')" || { cd "$current_dir"; return; }
  "$EDITOR" "$file"
  cd "$current_dir" || return
}

mkcd() { mkdir -p "$1" && cd "$1"; }
extract() {
  [[ -f "$1" ]] || { echo "extract: file not found: $1"; return 1; }
  case "$1" in
    *.tar.bz2) tar xjf "$1" ;; *.tar.gz) tar xzf "$1" ;; *.tar.xz) tar xJf "$1" ;;
    *.bz2) bunzip2 "$1" ;; *.rar) unrar x "$1" ;; *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;; *.tbz2) tar xjf "$1" ;; *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;; *.Z) uncompress "$1" ;; *.7z) 7z x "$1" ;;
    *) echo "extract: unsupported archive: $1"; return 1 ;;
  esac
}

sudo-command-line() {
  [[ -z "$BUFFER" ]] && BUFFER="$(fc -ln -1)"
  if [[ "$BUFFER" == sudo\ * ]]; then
    BUFFER="${BUFFER#sudo }"
  else
    BUFFER="sudo $BUFFER"
  fi
  CURSOR=${#BUFFER}
}
zle -N sudo-command-line

toppy() {
  history | awk '{CMD[$2]++;count++;} END {for (a in CMD) print CMD[a], CMD[a]/count*100 "%", a}' | sort -nr | head -n 20
}

# Better cd: list after changing directory if eza/ls exists.
cd() {
  builtin cd "$@" || return
  command -v eza >/dev/null 2>&1 && eza --icons=auto --group-directories-first || command ls --color=auto -F
}
