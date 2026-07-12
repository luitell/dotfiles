# ───────────────────────────────────────────────
# Prompt & directory jump
# ───────────────────────────────────────────────
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# ───────────────────────────────────────────────
# NVM (Node Version Manager)
# ───────────────────────────────────────────────
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.nvm}"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
fi

if [ -s "$NVM_DIR/bash_completion" ]; then
  source "$NVM_DIR/bash_completion"
fi

# ───────────────────────────────────────────────
# PATH setup (safe ordering)
# ───────────────────────────────────────────────
path=(
  /usr/local/go/bin
  /Applications/CMake.app/Contents/bin
  $HOME/.local/bin
  $HOME/go/bin
  $path
)

export PATH

# ───────────────────────────────────────────────
# envman (Android / Flutter etc)
# ───────────────────────────────────────────────
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# ───────────────────────────────────────────────
# LSD aliases
# ───────────────────────────────────────────────
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

alias tc='sesh connect $(sesh list | fzf)'

alias k='kubectl'

neofetch

# pnpm
export PNPM_HOME="/Users/porshe/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
