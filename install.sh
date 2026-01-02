#!/usr/bin/env bash

DOTFILES="$HOME/.dotfiles"

mkdir -p "$HOME"

ln -sf "$DOTFILES/zsh/.zschrc" "$HOME/.zshrc"
