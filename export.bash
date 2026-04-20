export TERMINAL=kitty
export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export LC_TIME=ru_RU.UTF-8
export WINEPREFIX=~/data/wine/

export SNAPSHOTS_SYS="/.snapshots"
export SNAPSHOTS_HOME="$HOME/.snapshots"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# GO
export GOPATH=$HOME/code/go

# RUST
# export PATH=$PATH:$GOPATH/bin
# export PATH="$HOME/.cargo/bin:$PATH"

# VCPKG ======================================================
# export VCPKG_ROOT="$HOME/.local/share/vcpkg"
# export PATH="$VCPKG_ROOT:$PATH"

# wayland vars ===============================================
# export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# Vulkan (no idea what is it)
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export VK_LAYER_PATH=/usr/share/vulkan/explicit_layer.d:/usr/share/vulkan/implicit_layer.d

# LIBREOFFICE backend
# export GDK_BACKEND=wayland
