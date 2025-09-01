export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME/passwords"


# Adds Pyenv to $PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Ads Ruby Gems to $PATH
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

# Set Custom R Library Folder to work with Nvim-R
export R_LIBS_USER=~/.local/share/r-libs

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"

# vim-gnupg
export GPG_TTY=$(tty)

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# set -o vi
# .NET
export PATH="$PATH:/home/mt/.dotnet/tools"

