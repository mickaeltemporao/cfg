export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="qutebrowser"
export PATH="$HOME/.poetry/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME/passwords"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Ads Ruby Gems to $PATH
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

set -o vi

