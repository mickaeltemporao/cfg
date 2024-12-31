PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;125;1m\]\u\[\e[0m\]@\[\e[38;5;31m\]\h\[\e[0m\] \[\e[38;5;119;1m\]\w\[\e[0m\] \[\e[38;5;199;53m\]${PS1_CMD1}\n\[\e[0m\]\$ '

alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'
alias cat=bat
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

# pyenv
eval "$(pyenv init -)"

# vim-gnupg
export GPG_TTY=$(tty)

# Key bindings
source "/usr/share/fzf/key-bindings.bash"
source "/usr/share/fzf/completion.bash"

