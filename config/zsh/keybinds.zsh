# Keybindings
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Ctrl+O opens a config-file picker.
bindkey -s '^o' 'config-pick^M'

# Ctrl+B toggles sudo at command start.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
zle -N sudo-command-line
bindkey '^B' sudo-command-line
