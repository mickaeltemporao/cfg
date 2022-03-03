export EDITOR='nvim'
export VISUAL='nvim'
export TERMINAL='kitty'
export BROWSER='qutebrowser'
export PATH="$HOME/.poetry/bin:$PATH"

eval "$(pyenv init --path)"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

