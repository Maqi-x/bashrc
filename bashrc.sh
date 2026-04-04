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

# system path
source-if-exists "$BASHRC_DIR/xdg-dirs.sh"
source-if-exists "$BASHRC_DIR/apps-cfg.sh"

add-path "$HOME/.cargo/bin"
add-path "$HOME/.local/bin"
add-path "$HOME/flutter/bin"
add-path "$HOME/scripts/bin"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
add-path-front "$PYENV_ROOT/bin"

export PATH

# basic aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias la='ls -a'
alias ll='ls -l'
alias l='ll'

alias reload='source "$BASHRC_FILE"'
alias edit-bashrc='$EDITOR "$BASHRC_FILE" && reload'
alias edit-bashrc-local='$EDITOR "$BASHRC_DIR/bashrc.local.sh" && reload'
alias edit-bashrc-adv='$EDITOR "$BASHRC_DIR" && reload'
alias edit-nvim-cfg='$EDITOR "$HOME/.config/nvim/init.lua"'
alias vencord='sh -c "$(curl -sS https://vencord.dev/install.sh)"'

win-reboot() {
    sudo grub-editenv /boot/grub/grubenv set boot_timeout=1
    sudo grub-reboot 'osprober-efi-6CD8-590C'
    sudo reboot
}

# apps
has-cmd starship && eval "$(starship init bash)"
has-cmd zoxide   && eval "$(zoxide init bash)"

if has-cmd pyenv; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
