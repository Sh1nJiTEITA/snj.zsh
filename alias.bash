#
alias md=mkdir

alias x11config='sudo GIT_CONFIG_GLOBAL=$HOME/.gitconfig git --git-dir=${HOME}/dotfiles/x11 --work-tree=/etc/X11/xorg.conf.d'

# YAZI tui filemanager
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

alias update-zsh='source $HOME/.zshrc'

# BOOKMARK jumper (self-created)
alias jump=". jmp"

# Statistic cd
alias cd=z

# Resource control (way for killing stacked processes)
alias top=bpytop

# Git tui
alias lg=lazygit

# Standart Arch install
alias pac="sudo pacman"

# Aur install
alias aur="yay -S"

# Free CAD force wayland
alias freecad='QT_QPA_PLATFORM=xcb freecad'

alias wakeserver='wakeonlan 22:43:4D:05:07:11'
# alias sleepserver='ssh snjalpserver "sudo shutdown now"'
alias sleepserver='ssh snjalpserver "poweroff"'
alias backupserver='rsync -avz --progress -e "ssh -p 2222" snj@192.168.50.5:/home/snj /mnt/A/ServerBackup/'

function update-pac() {
    local count_to_search="${1:-100}"
    local count_to_save="${2:-30}"
    echo "Starting update for pacman mirrors..."
    echo "Servers to test: ${count_to_search}"
    echo "Servers to save: ${count_to_save}"
    sudo reflector --verbose -l "$count_to_search" -n "$count_to_save" -p http --sort rate --save /etc/pacman.d/mirrorlist
    sudo pacman -Sy
}

function encode-docs2() {
    local what="${1}"
    local to="${2}"
    gocryptfs "${what}" "${to}"
}

function decode-docs() {
    gocryptfs "/home/snj/docs/secret/raw" "/home/snj/docs/secret/mount"
}

function encode-docs() {
    fusermount -u "/home/snj/docs/secret/mount"
}

# function encode-docs() {
#     local what="${1}"
#     fusermount -u "${what}"
# }

alias umount-gdrive="fusermount3 -u ~/Data/Remote/"
alias mount-gdrive="rclone mount gdrive: ~/Data/Remote --vfs-cache-mode writes &"
alias sync-gdrive="rclone sync ~/Data/Books gdrive:Books --progress"

alias proxy-on='export http_proxy="http://127.0.0.1:2080" https_proxy="http://127.0.0.1:2080" HTTP_PROXY="http://127.0.0.1:2080" HTTPS_PROXY="http://127.0.0.1:2080"'
alias proxy-off='unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY'

# alias agy='sudo docker run -it --rm \
#   --net=host \
#   -e http_proxy="http://127.0.0.1:2080" \
#   -e https_proxy="http://127.0.0.1:2080" \
#   -e all_proxy="socks5://127.0.0.1:2080" \
#   -e HTTP_PROXY="http://127.0.0.1:2080" \
#   -e HTTPS_PROXY="http://127.0.0.1:2080" \
#   -e ALL_PROXY="socks5://127.0.0.1:2080" \
#   -v "$(pwd)":/workspace \
#   -v "$HOME/.gemini/antigravity-cli":/root/.gemini/antigravity-cli \
#   antigravity-box'
alias agy='sudo docker compose -f ~/mnt/docker/agy/docker-compose.yml run --rm agy'
alias cld='sudo docker compose -f ~/mnt/docker/cld/docker-compose.yml run --rm cld'

alias vi=nvim

alias pg-smartroad-v5='pgcli \
    $(cat ~/docs/sorb/documents/creds/smartroad_v5) \
    --init-command "set session default_transaction_read_only = on;" \
'

alias sz='sysz'

alias reload-monitors='xrandr --output DP-2 --primary --mode 2560x1440 --rate 180 --pos 0x0 \
       --output DP-0 --mode 1920x1080 --rate 144 --right-of DP-2 \
       --output HDMI-0 --off\
'


function dictate() {
  emulate -L zsh
  setopt local_options no_monitor no_notify
  local root=~/code/trash/whisper.cpp
  local model="$root/models/ggml-medium.bin"
  local wav=/tmp/dictate.wav
  local pid text

  [[ -f $model ]] || { print -u2 "model not found: $model"; return 1 }

  rm -f $wav
  pw-record --rate 16000 --channels 1 --format s16 "$wav" >/dev/null 2>&1 &
  pid=$!
  print -n "[rec] listening... press Enter to stop"
  read -r
  kill -INT $pid 2>/dev/null
  wait $pid 2>/dev/null

  [[ -s $wav ]] || { print "\r[err] empty recording\033[K"; return 1 }

  print -n "\r[...] transcribing\033[K"
  text=$("$root/build/bin/whisper-cli" -m "$model" -f "$wav" \
           -l ru -nt -np -t 8 2>/dev/null \
         | tr '\n' ' ' | sed 's/^ *//; s/ *$//')
  print "\r$text\033[K"
}






