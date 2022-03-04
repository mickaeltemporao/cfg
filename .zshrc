## Aliases
alias -s txt=nvim
alias -s py=nvim
alias vim=nvim
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Add bin to PATH for custom scripts
PATH=$PATH:/home/$USER/.local/bin

## vim-gnupg
export GPG_TTY=$(tty)

# Set Custom R Library Folder to work with Nvim-R
export R_LIBS_USER=~/.local/share/r-libs

## pyenv
eval "$(pyenv init -)"

