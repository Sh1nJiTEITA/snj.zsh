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
alias pac=sudo pacman -S

# Aur install
alias aur=yay -S

# Free CAD force wayland
alias freecad='QT_QPA_PLATFORM=xcb freecad'
