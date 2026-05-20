# dotfiles

Personal macOS iTerm2 configuration — zsh, Starship prompt, Vim, and a set of CLI tools tuned for a fast, visual workflow. Adjust as needed.

## Contents

| File | Purpose |
|------|---------|
| `.zshrc` | Zsh config — aliases, fzf, zoxide, autosuggestions |
| `starship.toml` | Starship prompt — Gruvbox Dark, segmented powerline style |
| `.vim/vimrc` | Vim config — Tomorrow-Night theme, Pathogen, lightline |

## Prompt — Starship

Powerline-style segments using the **Gruvbox Dark** palette:

```
[ directory ][ git branch · status ][ language versions ][ docker/conda ][ time ]
```

- Directory truncated to 3 levels, common folders replaced with icons
- Git branch with ahead/behind and status indicators
- Language version shown only when a project file is detected (Node, Python, Rust, Go, etc.)
- Time (`HH:MM`) in the rightmost segment
- Success/error indicator on the prompt character; distinct Vim mode symbols

## Shell — Zsh

### fzf

Dark theme matching the Starship palette. Key bindings:

- `Ctrl+T` — fuzzy insert a file path; preview with `bat`
- `Alt+C` — fuzzy `cd` into a directory; preview with `tree`
- Driven by `fd` (respects `.gitignore`, includes hidden files, excludes `.git`)

### Other tools

- **zoxide** — smarter `cd` with frecency tracking, aliased as `cd`
- **zsh-autosuggestions** — ghost-text history suggestions

## Vim

- **Theme** — Tomorrow-Night
- **Plugins** — Pathogen (plugin loader), lightline (status bar)
- **Tab size** — 2 spaces, expandtab
- **Column guide** — 90 characters
- Relative line numbers, syntax highlighting, smart indent

## Prerequisites

```sh
brew install starship eza fzf fd zoxide bat tree
brew install zsh-autosuggestions
```

Vim plugins are managed with Pathogen and included as submodules under `.vim/bundle/`.

## Installation

```sh
git clone https://github.com/helbow/dotfiles.git ~/dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vim/vimrc ~/.vimrc
```
