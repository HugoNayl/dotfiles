# 🛠 Dotfiles

Minimal, opinionated dotfiles for a **clean terminal-based workflow**.

This repository provides configuration for:
- **wezterm**
- **zsh**
- **starship**
- **tmux**
- **neovim**
- common CLI tools

The goal is **consistency across machines** (macOS & Linux & windows+wsl), with **robustness and low ressource needs**.

---

## 🖥 Supported platforms

- **macOS** (via Homebrew)
- **Linux** (Debian / Ubuntu via `apt`)
- **Windows+apt** (Debian / Ubuntu via `apt`)

---

## 📦 Dependencies

These tools are expected to be installed:

### Required
- `git` (>= 2.30)
- `curl` (>= 7.70)
- `tmux` (>= 3.2)
- `neovim` (>= 0.9.0)
- `fzf` (>= 0.35.0)
- `ripgrep` (>= 13.0)
- `fd` (>= 8.0)
- `bat` (>= 0.22.0)
- `eza` (>= 0.18.0)
- `lazygit` (>= 0.40.0)
- `starship` (>= 1.15.0)
- `fzf-tab` (commit fac1451)

---

## 🚀 Installation

### 1. Clone the repository

```bash
git clone https://github.com/yourname/dotfiles.git
cd dotfiles
```
### 2. (install dependencies)

```bash
chmod +x ./install-deps.sh
chmod +x ./scripts/detect-os.sh
./install-deps.sh
```
### 2. (install symlinks)

```bash
chmod +x ./install.sh
./install.sh
```

### 2. (install plugins)

```bash
tmux
```
Press Ctrl-a + I


```bash
nvim
```
Then in nvim

```bash
:Lazy
```

---

## Uninstall

```bash
chmod +x ./uninstall.sh
./uninstall.sh
```

