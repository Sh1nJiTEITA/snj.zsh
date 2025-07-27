#
alias md=mkdir

# YAZI tui filemanager 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# BOOKMARK jumper (self-created)
alias jump=". jmp"

# Statistic cd
alias cd=z

# Resource control (way for killing stacked processes)
alias top=bpytop

# Git tui
alias lg=lazygit

# Standart Arch install
alias pac="sudo pacman -S"

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
