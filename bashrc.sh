# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# basic configuration
BASHRC_DIR="$HOME/configuration/bashrc/"
BASHRC_FILE="$BASHRC_DIR/bashrc.sh"
source "$BASHRC_DIR/funcs.sh"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

source-if-exists "$BASHRC_DIR/bashrc.local.sh"

# shell options
shopt -s globstar

# system path
source-if-exists "$BASHRC_DIR/xdg-dirs.sh"
source-if-exists "$BASHRC_DIR/apps-cfg.sh"

# fancy custom command not found handler
source-if-exists "$BASHRC_DIR/cmd-not-found.sh"

# aliases
source-if-exists "$BASHRC_DIR/aliases.sh"

add-path "$HOME/.cargo/bin"
add-path "$HOME/.local/bin"
add-path "$HOME/flutter/bin"
add-path "$HOME/scripts/bin"
add-path "$HOME/.gem/ruby/3.4.0/bin"

export HISTFILE="$XDG_STATE_HOME/bash/history"

export CARGO_HOME="$HOME/.local/share/cargo"
add-path "$CARGO_HOME/bin/"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
add-path-front "$PYENV_ROOT/bin"

export ZAPUP_SHIMS="$XDG_DATA_HOME/zapup/shims"
add-path-front "$ZAPUP_SHIMS"

add-path-front "$ANDROID_HOME/platform-tools"

# toolchains
add-path-front "/opt/cross/x86_64-linux-musl/bin/"
add-path-front "/opt/cross/aarch64-linux-musl/bin/"

export PATH

win-reboot() {
    sudo grub-editenv /boot/grub/grubenv set boot_timeout=1
    sudo grub-reboot 'osprober-efi-6CD8-590C'
    sudo reboot
}

export CC="ccache cc"
export CXX="ccache c++"

# apps
has-cmd starship && eval "$(starship init bash)"
has-cmd zoxide   && eval "$(zoxide init bash)"

if has-cmd pyenv; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
