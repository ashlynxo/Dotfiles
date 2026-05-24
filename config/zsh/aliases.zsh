# Ashlyn aliases — modern CLI defaults with safe fallbacks

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -p'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,node_modules}'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ports='ss -tulanp'
alias please='sudo $(fc -ln -1)'
alias reload='exec zsh'
alias zshconfig='$EDITOR $ZDOTDIR/.zshrc'
alias dots='cd ~/.dotfiles 2>/dev/null || cd ~/.config'

# Modern replacements
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons=auto --group-directories-first --color=auto'
  alias l='eza -lah --icons=auto --group-directories-first --git'
  alias la='eza -a --icons=auto --group-directories-first'
  alias ll='eza -lh --icons=auto --group-directories-first --git'
  alias lt='eza --tree --icons=auto --level=2'
else
  alias ls='ls --color=auto --group-directories-first'
  alias l='ls -lah'
  alias la='ls -A'
  alias ll='ls -lh'
fi

command -v bat >/dev/null 2>&1 && alias cat='bat --paging=never --plain'
command -v rg >/dev/null 2>&1 && alias search='rg --hidden --glob "!.git"'
command -v fd >/dev/null 2>&1 && alias find='fd'
command -v btop >/dev/null 2>&1 && alias top='btop'
command -v yazi >/dev/null 2>&1 && alias fm='yazi'
command -v fastfetch >/dev/null 2>&1 && alias fetch='fastfetch --config ~/.config/fastfetch/config.jsonc'

# Package managers
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacss='pacman -Ss'
alias paruup='paru -Syu --devel'
alias aptup='sudo apt update && sudo apt full-upgrade'
alias aptin='sudo apt install'
alias aptss='apt search'

# Archives
alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias zipr='zip -r'
alias unzipd='unzip'

# Git essentials
alias g='git'
alias gs='git status --short --branch'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull --rebase --autostash'
alias gf='git fetch --all --prune --jobs=10'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --decorate --graph --all'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gswc='git switch -c'
alias gstash='git stash push -u'
alias gunstash='git stash pop'
alias groot='cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"'

# Developer shortcuts
alias serve='python -m http.server'
alias weather='curl wttr.in'
alias ip='ip --color=auto'
alias myip='curl -s https://ipinfo.io/ip; echo'
