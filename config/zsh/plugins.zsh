# Zinit plugin loader
# Keeps the config fast while still auto-installing plugins on first run.

ZINIT_HOME="${ZINIT_HOME:-${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git}"
if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
  print -P "%F{14}Installing zinit for Ashlyn...%f"
  command mkdir -p "${ZINIT_HOME:h}"
  command git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" || return
fi
source "$ZINIT_HOME/zinit.zsh"

# Completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Interactive plugins
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search
zinit ice wait lucid
zinit light Aloxaf/fzf-tab
zinit ice wait lucid
zinit light hlissner/zsh-autopair

# Optional CLIs installed from GitHub releases if distro packages are unavailable.
zinit ice wait lucid from'gh-r' as'command' mv'fzf* -> fzf'
zinit light junegunn/fzf
