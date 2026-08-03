# oh-my-zsh ================================

# Enabling some oh-my-zsh plugins
plugins=(git vi-mode colored-man-pages zoxide zsh-autosuggestions zsh-syntax-highlighting)

# ZSH path?
export ZSH="$HOME/.oh-my-zsh"

# Eval oh-my-zsh
source $ZSH/oh-my-zsh.sh

# oh-my-posh ==============================
# Adding oh-my-posh binaries to path
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.oh-my-posh"

load_omp_theme() {
    CURRENT_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)

    if [ "$CURRENT_SCHEME" = "'prefer-dark'" ]; then
        eval "$(oh-my-posh init zsh --config ~/.config/omp/snj.omp_rosepine.yaml)"
    else
        eval "$(oh-my-posh init zsh --config ~/.config/omp/snj.omp_rosepine_dawn.yaml)"
    fi
}

load_omp_theme

TRAPUSR1() {
    load_omp_theme
    zle && zle reset-prompt
}
