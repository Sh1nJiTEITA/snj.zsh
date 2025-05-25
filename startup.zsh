# oh-my-zsh ================================

# Enabling some oh-my-zsh plugins
plugins=(git vi-mode)

# ZSH path? 
export ZSH="$HOME/.oh-my-zsh"

# Eval oh-my-zsh
source $ZSH/oh-my-zsh.sh

# oh-my-posh ==============================
# Adding oh-my-posh binaries to path
export PATH=$PATH:/home/snj/.local/bin

# Loading oh-my-posh theme
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/tiwahu.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/hul10.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/clean-detailed.omp.json)"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/snj.omp.yaml)"


# ZOXIDE ==============================
eval "$(zoxide init zsh)"


# nvm startup
# source /usr/share/nvm/init-nvm.sh
