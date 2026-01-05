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


# Enable colors for commands like ls
autoload -Uz colors
colors

# ---------- Aliases ----------

alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

eval "$(starship init zsh)"
export PATH="$PATH:/opt/nvim-linux-arm64/bin"
export PATH="/usr/local/go/bin:$PATH"
