#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/scripts/detect-os.sh"

echo "→ Installing required tools for $PLATFORM"

if [ "$PLATFORM" = "linux" ]; then
  if ! command -v apt >/dev/null; then
    echo "apt not found. Only Debian/Ubuntu are supported."
    exit 1
  fi

  sudo apt update
  sudo apt install -y \
    git \
    curl \
    tmux \
    neovim \
    fzf \
    ripgrep \
    fd-find \
    bat \
    eza \
    lazygit

elif [ "$PLATFORM" = "macos" ]; then
  if ! command -v brew >/dev/null; then
    echo "Homebrew is required: https://brew.sh"
    exit 1
  fi

  brew install \
    git \
    curl \
    tmux \
    neovim \
    fzf \
    ripgrep \
    fd \
    bat \
    eza \
    lazygit
fi

if ! command -v starship >/dev/null; then
  echo "→ Installing starship"
  curl -sS https://starship.rs/install.sh | sh
fi

echo "→ Installing fzf-tab"
mkdir -p ~/.zsh/plugins
if [ ! -d ~/.zsh/plugins/fzf-tab ]; then
  git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/plugins/fzf-tab
fi

echo "✓ All required tools installed"
