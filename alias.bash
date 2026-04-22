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

function encode-docs() {
    gocryptfs "/home/snj/Data/Docs/Docs.raw/" "/home/snj/Data/Docs/Docs.mount/"
}

function decode-docs2() {
    local what="${1}"
    fusermount -u "/home/snj/Data/Docs/Docs.mount/"
}

function decode-docs() {
    local what="${1}"
    fusermount -u "${what}"
}

alias umount-gdrive="fusermount3 -u ~/Data/Remote/"
alias mount-gdrive="rclone mount gdrive: ~/Data/Remote --vfs-cache-mode writes &"
alias sync-gdrive="rclone sync ~/Data/Books gdrive:Books --progress"
