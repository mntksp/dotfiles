# dotfiles

Personal macOS configuration: **zsh**, **Starship**, **Neovim** (lazy.nvim), and legacy **Vim**, tuned for a fast, keyboard-driven workflow.

## Contents

| Path | Purpose |
|------|---------|
| [`.zshrc`](.zshrc) | Zsh: aliases, git helper functions, fzf, zoxide, autosuggestions |
| [`starship.toml`](starship.toml) | Starship prompt: Gruvbox Dark, powerline segments |
| [`nvim/`](nvim) | Neovim config: lazy.nvim, LSP, Telescope, Harpoon, Treesitter |
| [`.vim/`](.vim) | Legacy Vim config: Tomorrow-Night, Pathogen, lightline |
| [`setup.sh`](setup.sh) | Symlinks the configs into place |

## Installation

```sh
git clone https://github.com/mntksp/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

`setup.sh` symlinks (`ln -sn`, existing targets are left untouched):

| Source | Target |
|--------|--------|
| `.vim` | `~/.vim` |
| `.vim/vimrc` | `~/.vimrc` |
| `.zshrc` | `~/.zshrc` |
| `starship.toml` | `~/.config/starship.toml` |
| `nvim` | `~/.config/nvim` |

### Prerequisites

```sh
brew install neovim tree-sitter-cli starship eza fzf fd zoxide bat tree ripgrep
brew install zsh-autosuggestions
```

- A [Nerd Font](https://www.nerdfonts.com/) is required for icons (eza, Starship, Neovim)
- `ripgrep` is needed for Telescope live grep
- Neovim 0.12+, `tree-sitter-cli` and a C compiler are required by nvim-treesitter (`main` branch)
- `kubectl` is aliased as `k`; install it if used

## Zsh

### Aliases

| Alias | Command |
|-------|---------|
| `vi` | `nvim` |
| `ls` / `ll` / `tls` | `eza` variants with git status and icons (`tls` = latest modified) |
| `k` | `kubectl` |
| `bup` | Reload `~/.zshrc` |
| `brup` | `brew update && upgrade --greedy && cleanup` |
| `ftcp` | Browse listening TCP connections with fzf |
| `zedit` | `zoxide edit` |
| `zshpro` | Open `.zshrc` in nvim |

### Git functions

| Function | Description |
|----------|-------------|
| `cshow` | Browse the commit graph with fzf; `Enter` opens the commit in `less` |
| `gbr` | Fuzzy checkout of a local or remote branch |
| `bgrep <pattern>` | `git grep` across all local and remote branches |

### fzf

Dark theme matching the Starship palette. Driven by `fd` (includes hidden files, excludes `.git`).

- `Ctrl+T`: insert a file path, previewed with `bat`
- `Alt+C`: `cd` into a directory, previewed with `tree`

### Other

- **zoxide**: frecency-based `cd` replacement (`cd` is the zoxide command)
- **zsh-autosuggestions**: ghost-text history suggestions
- `autocd` enabled; `Home`/`End` and `Shift+←/→` word navigation bound

## Prompt: Starship

Powerline-style segments using the **Gruvbox Dark** palette:

```
[ directory ][ git branch · status ][ language versions ][ docker/conda ][ time ]
```

- Directory truncated to 3 levels, common folders replaced with icons
- Git branch with ahead/behind and status indicators
- Language version shown only when a project file is detected (Node, Python, Rust, Go, etc.)
- Time (`HH:MM`) in the rightmost segment
- Success/error indicator on the prompt character; distinct Vim mode symbols

## Neovim

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which bootstraps itself on first launch. Versions are pinned in `lazy-lock.json`.

```
nvim/
├── init.lua
└── lua/
    ├── config/   # options, keybinds, lazy bootstrap
    └── plugins/  # one spec per plugin
```

### Plugins

| Plugin | Purpose |
|--------|---------|
| [tokyonight](https://github.com/folke/tokyonight.nvim) | Colorscheme |
| [lualine](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [which-key](https://github.com/folke/which-key.nvim) | Popup showing available keybinds |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file switching |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands |
| [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and indent |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason](https://github.com/mason-org/mason.nvim) | LSP and tool installation |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Completion and snippets |
| [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua) | Inline color previews |
| [nvim-osc52](https://github.com/ojroques/nvim-osc52) | Clipboard over SSH |

### LSP and tooling

Installed automatically via Mason:

- **Language servers**: Lua, Bash, Docker, Docker Compose, GitLab CI, Helm, Terraform, Vim, YAML, Markdown
- **Linters/formatters**: ansible-lint, hadolint, kube-linter, luacheck, markdownlint, mdformat, shellcheck, shellharden, shfmt, yamlfmt, yamllint, jq, gitleaks, gitlint

### Options

- Absolute and relative line numbers, no line wrap, cursorline, `scrolloff=10`
- 2-space indent, `expandtab`, smart indent
- Smart-case search
- Splits open below and right
- Mode hidden (shown in lualine)

### Keybindings

Leader is `Space`.

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>ff` / `fg` / `fb` / `fh` | Telescope: files / live grep / buffers / help |
| `<leader>a` | Harpoon: add file |
| `Ctrl+e` | Harpoon: quick menu |
| `<leader>d` | Toggle inline diagnostic messages |
| `<leader>cd` | Open netrw (`:Ex`) |
| `<leader>hl` | Toggle search highlight |
| `<leader>sv` / `sh` | Vertical / horizontal split |
| `Ctrl+h/j/k/l` | Move between windows |
| `Alt+←/→/↑/↓` | Resize window |
| `J` / `K` | Move line (or selection) down / up |
| `<` / `>` (visual) | Indent and keep selection |
| `j` / `k` | Wrap-aware movement |
| `n` / `N`, `Ctrl+d` / `Ctrl+u` | Search and half-page scroll, cursor centered |
| `Tab` / `Shift+Tab` | Completion: next / previous item |

## Vim (legacy)

- **Theme**: Tomorrow-Night
- **Plugins**: Pathogen (loader), lightline (status bar)
- 2-space tabs (`expandtab`), 90-column guide, mouse enabled
- Line numbers, syntax highlighting, smart indent
