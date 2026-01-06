# Don’t save duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS

# Append to history file instead of overwriting
setopt APPEND_HISTORY

# Share history between sessions
setopt SHARE_HISTORY

# History file location
HISTFILE="$HOME/.zsh_history"

# Number of commands to keep in memory
HISTSIZE=10000

# Number of commands to save on disk
SAVEHIST=10000

# Auto-complete
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

if command -v carapace >/dev/null 2>&1; then
  source <(carapace _carapace zsh)
fi
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Enable colors for commands like ls
autoload -Uz colors
colors

# ---------- Aliases ----------

alias ll='eza -lah'
alias tree='eza --tree'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ---------- Tools ----------

# fzf
if command -v brew >/dev/null 2>&1; then
  # macOS (Homebrew)
  FZF_BASE="$(brew --prefix)/opt/fzf"
elif [ -d "$HOME/.fzf" ]; then
  # Manual install (Linux / Windows)
  FZF_BASE="$HOME/.fzf"
else
  FZF_BASE=""
fi

if [ -n "$FZF_BASE" ]; then
  [ -f "$FZF_BASE/shell/key-bindings.zsh" ] && source "$FZF_BASE/shell/key-bindings.zsh"
  [ -f "$FZF_BASE/shell/completion.zsh" ] && source "$FZF_BASE/shell/completion.zsh"
fi

bindkey '^R' fzf-history-widget 2>/dev/null

export FZF_DEFAULT_OPTS="
--height=80%
--layout=reverse
--border
--info=inline
--preview 'bat --style=numbers --color=always --line-range :300 {}'
--preview-window=right:60%
"

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
else
  export FZF_DEFAULT_COMMAND='find . -type f'
fi

# fzf-tab
if [ -f "$HOME/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh" ]; then
  source "$HOME/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"
fi
zstyle ':fzf-tab:*' fzf-flags \
  --height=80% \
  --layout=reverse \
  --border
zstyle ':fzf-tab:complete:*:*' fzf-preview '
  local target="$realpath"
  if [ -f "$target" ]; then
    bat --style=numbers --color=always --line-range :200 "$target"
  elif [ -d "$target" ]; then
    eza -lah --color=always "$target"
  fi
'

# Git
gf() {
  git status --short |
    fzf --ansi \
        --multi \
        --prompt="git add > " \
        --preview '
          file=$(echo {} | sed "s/^[ MARC?]* //")
          git diff --color=always -- "$file"
        ' \
        --preview-window=right:60% |
    sed "s/^[ MARC?]* //" |
    xargs -r git add
}

glog() {
  git log --oneline --decorate --color=always |
    fzf --ansi \
        --preview 'git show --color=always {1}' \
        --preview-window=right:70%
}

gbr() {
  git branch --all --color=always |
    grep -v HEAD |
    sed 's/^..//' |
    fzf --ansi \
        --preview 'git log --oneline --color=always {} | head -50' \
        --preview-window=right:70% |
    xargs git checkout
}

gstash() {
  git stash list |
    fzf --preview 'git stash show -p --color=always {1}' \
        --preview-window=right:70%
}

gco() {
  git branch --all |
    grep -v HEAD |
    sed 's/^..//' |
    fzf --preview 'git log --oneline --color=always {} | head -50' \
        --preview-window=right:60% |
    xargs git checkout
}

gclean() {
  git branch --merged |
    grep -v '\*' |
    fzf --multi |
    xargs git branch -d
}

# Others
eval "$(starship init zsh)"
export PATH="$PATH:/opt/nvim-linux-arm64/bin"
export PATH="/usr/local/go/bin:$PATH"

