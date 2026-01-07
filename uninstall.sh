#!/usr/bin/env bash
set -e

echo "→ Removing dotfile symlinks"

remove() {
  target="$1"

  if [ -L "$target" ]; then
    rm "$target"
    echo "✓ Removed $target"
  else
    echo "• Skipped $target (not a symlink)"
  fi
}

remove "$HOME/.zshrc"
remove "$HOME/.vimrc"
remove "$HOME/.tmux.conf"
remove "$HOME/.config/starship.toml"
remove "$HOME/.config/nvim"

echo "✓ Dotfiles removed"
