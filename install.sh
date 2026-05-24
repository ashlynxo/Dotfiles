#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

say() { printf '\033[1;35m[ashlyn]\033[0m %s\n' "$*"; }
backup() {
  local target="$1"
  if [[ -e "$target" || -L "$target" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${target#$HOME/}")"
    mv "$target" "$BACKUP_DIR/${target#$HOME/}"
  fi
}
copy_config_dir() {
  local name="$1"
  local src="$REPO_DIR/.config/$name"
  local dst="$HOME/.config/$name"
  [[ -d "$src" ]] || return 0
  backup "$dst"
  mkdir -p "$(dirname "$dst")"
  rsync -a "$src/" "$dst/"
}
copy_local_bin() {
  local src="$REPO_DIR/.etc"
  local dst="$HOME/.local/bin"
  mkdir -p "$dst"
  rsync -a "$src/" "$dst/"
  chmod +x "$dst"/* 2>/dev/null || true
}

say "Installing Ashlyn dotfiles"
mkdir -p "$HOME/.config" "$HOME/.local/bin"

backup "$HOME/.zshenv"
ln -s "$REPO_DIR/.home/.zshenv" "$HOME/.zshenv"

for dir in awesome fastfetch neofetch picom ripgrep starship wezterm zsh; do
  copy_config_dir "$dir"
done

copy_local_bin
chmod +x "$HOME/.config/awesome/assets/autostart.sh" 2>/dev/null || true
ln -sfn "$REPO_DIR" "$HOME/.dotfiles"

if command -v zsh >/dev/null 2>&1 && [[ "${SHELL:-}" != *zsh ]]; then
  say "Zsh is installed. Change shell with: chsh -s $(command -v zsh)"
fi

say "Done. Backups saved to: $BACKUP_DIR"
say "Restart AwesomeWM with Mod4+Ctrl+r or open a new terminal."
