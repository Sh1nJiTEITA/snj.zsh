export TERMINAL=kitty
export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export LC_TIME=ru_RU.UTF-8



# bun completions ========================================== 
[ -s "/home/snj/.bun/_bun" ] && source "/home/snj/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# GO 
export GOPATH=$HOME/Code/go
export GOPATH2=$HOME/Code/go/inputrecord/

# RUST
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"

# PYTHON ====================================================
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"



# VCPKG ======================================================
export VCPKG_ROOT="$HOME/.local/share/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"


# wayland vars ===============================================
export XDG_RUNTIME_DIR="/run/user/$(id -u)"


# CUDA =======================================================
export PATH=/usr/local/cuda/bin:$PATH
export CUDADIR=/usr/local/cuda
export LD_LIBRARY_PATH=$CUDADIR/lib64:$LD_LIBRARY_PATH
export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda/

# Vulkan (no idea what is it) 
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export VK_LAYER_PATH=/usr/share/vulkan/explicit_layer.d:/usr/share/vulkan/implicit_layer.d

# LIBREOFFICE backend
export GDK_BACKEND=wayland



