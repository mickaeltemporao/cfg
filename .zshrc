# Key bindings
source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"

# Aliases
alias cat="highlight -l -O ansi --force"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias noise="play -n -q synth 2:0:0 brownnoise synth pinknoise mix synth sine amod 0 10 &"
# alias vifm="~/.local/bin/vifmrun"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias ipython="ipython --no-autoindent --matplotlib=qt6 --ipython-dir=$HOME/.config/ipython --profile=$USER"
alias home="xrandr --output eDP-1 --mode 2560x1440 --output HDMI-1 --off; xwallpaper --daemon --zoom ~/.local/share/wallpaper/wallpaper.jpg"
alias work="xrandr --output eDP-1 --mode 2560x1440 --output HDMI-1 --mode 1920x1080 --rotate right --left-of eDP-1; xwallpaper --daemon --zoom ~/.local/share/wallpaper/wallpaper.jpg"
alias open="xdg-open"


# CSV quicklook
csv () {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

# Extraction Function
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvJf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *.xz)        unxz $1        ;;
      *.exe)       cabextract $1  ;;
      *)           echo "\`$1': unrecognized file compression" ;;
    esac
  else
    echo "\`$1' is not a valid file"
  fi
}

# Set Custom R Library Folder to work with Nvim-R
export R_LIBS_USER=~/.local/share/r-libs

# pyenv
eval "$(pyenv init -)"

# vi-mode
bindkey -v

# vim-gnupg
export GPG_TTY=$(tty)

