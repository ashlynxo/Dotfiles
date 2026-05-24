# Zsh behaviour
umask 022
zmodload zsh/zle
zmodload zsh/complist

autoload -Uz colors compinit bashcompinit
colors

# Completion cache
mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%F{blue}[%d]%f'
zstyle ':completion:*:git-checkout:*' sort false

# fzf-tab previews when installed
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons=auto $realpath 2>/dev/null || ls -1 --color=always $realpath'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff --color=always $word 2>/dev/null'

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
mkdir -p "${HISTFILE:h}"

setopt AUTOCD AUTO_MENU AUTO_PARAM_SLASH COMPLETE_IN_WORD ALWAYS_TO_END NOTIFY INTERACTIVE_COMMENTS NO_BEEP
setopt APPEND_HISTORY SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS HIST_VERIFY
unsetopt FLOW_CONTROL NOMATCH CORRECT EQUALS BEEP

# emacs-style editing by default; switch to `bindkey -v` in local.zsh if wanted.
bindkey -e

# zoxide smart cd
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
