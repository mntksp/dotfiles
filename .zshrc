setopt autocd

# Keybindings for navigation
bindkey "^[[H" beginning-of-line     # fn+left or Home
bindkey "^[[F" end-of-line           # fn+right or End
bindkey "^[[1;2D" backward-word      # shift+left
bindkey "^[[1;2C" forward-word       # shift+right

alias bup="source ~/.zshrc"
alias brup="brew update && brew upgrade --greedy && brew cleanup"
alias ftcp="lsof -i -n -P | grep TCP | fzf"
alias ls="eza -1 --git --icons=always"
alias ll="eza -lah --git --icons=always"
alias tls="eza -lah --git --icons=always --sort modified | head"
alias vi="nvim" 
alias zedit="zoxide edit"
alias zshpro="vi ~/gitrep/dotfiles/.zshrc"

# fzf
export FZF_DEFAULT_COMMAND="fd --type f --color=never --hidden --exclude '.git'"
export FZF_DEFAULT_OPTS='
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#121212,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="sharp" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color always {}'"

export FZF_ALT_C_COMMAND="fd --type d . --color=never --hidden --exclude '.git'"
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# application aliases
alias k="kubectl"

# set up brew env variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# Starship prompt (load at the end)
eval "$(starship init zsh)"

# set up zoxide with alias
eval "$(zoxide init --cmd cd zsh)"

# Autosuggestions based on history
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# set up zsh completion
autoload -U compinit; compinit

# set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
