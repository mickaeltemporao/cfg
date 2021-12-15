export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export BROWSER='qutebrowser'
export EDITOR='nvim'
export TERMINAL='kitty'
export VISUAL='nvim'

eval "$(pyenv init --path)"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

