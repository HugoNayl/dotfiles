#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "→ Installing dotfiles (symlinks only)"

mkdir -p "$HOME/.config"

ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

ln -sf "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"

ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

ln -sf "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

ln -sfn "$DOTFILES/nvim" "$HOME/.config/nvim"

echo "✓ Dotfiles installed"
