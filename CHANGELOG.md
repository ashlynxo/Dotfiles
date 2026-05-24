# Changelog

## 2026 Refresh — Ashlyn Dotfiles

### Identity
- Renamed public-facing identity to **Ashlyn**.
- Updated AwesomeWM welcome widget to show `Welcome Ashlyn`.
- Added `DOTFILES_USER=Ashlyn` and `USER_NAME=Ashlyn` environment variables.

### Shell
- Added `.config/zsh/.zshrc` and `.config/zsh/.zshenv`.
- Rebuilt aliases with modern CLI fallbacks.
- Swapped `exa` usage to `eza`.
- Added support for `fastfetch`, `zoxide`, `fd`, `ripgrep`, `btop`, `yazi`, and `lazygit`.
- Simplified Starship initialization.

### Desktop
- Kept AwesomeWM but refreshed colors and font defaults.
- Fixed `theme.fg_nromal` typo.
- Updated Picom config with GLX, blur, shadows, fading, and rounded corners.
- Modernized WezTerm config with WebGPU, fallback fonts, panes, transparency, and keybinds.
- Hardened AwesomeWM autostart script.

### Install
- Added safe `install.sh` with per-folder backups.
- Added package lists for Arch and Debian/Kali.
- Added `.gitignore` for private overrides.
