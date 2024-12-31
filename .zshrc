# Aliases

alias cat="highlight -l -O ansi --force"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ipython="ipython --no-autoindent --matplotlib=qt6 --ipython-dir=$HOME/.config/ipython --profile=$USER"
alias noise="play -n -q synth 2:0:0 brownnoise synth pinknoise mix synth sine amod 0 10 &"
alias open="xdg-open"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias work="xrandr --output eDP-1 --mode 2560x1440 --auto --output DP-2 --mode 1920x1080 --rotate right --left-of eDP-1; xwallpaper --daemon --zoom ~/.local/share/wallpaper/wallpaper.jpg"
alias home="xrandr --output eDP-1 --mode 2560x1440 --output HDMI-1 --off; xwallpaper --daemon --zoom ~/.local/share/wallpaper/wallpaper.jpg | xrandr --auto"
alias dupe="xrandr --output eDP-1 --mode 1920x1080 --auto --output HDMI-1 --same-as eDP-1; xwallpaper --daemon --zoom ~/.local/share/wallpaper/wallpaper.jpg"

# Set Custom R Library Folder to work with Nvim-R
export R_LIBS_USER=~/.local/share/r-libs

# pyenv
eval "$(pyenv init -)"

# vi-mode
bindkey -v

# vim-gnupg
export GPG_TTY=$(tty)

# Key bindings
source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"
