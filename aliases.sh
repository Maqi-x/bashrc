# basic
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias la='ls -a'
alias ll='ls -l'
alias l='ll'

# configs
alias reload='source "$BASHRC_FILE"'
alias edit-bashrc='$EDITOR "$BASHRC_FILE" && reload'
alias edit-aliases='$EDITOR "$BASHRC_DIR/aliases.sh" && reload'
alias edit-bashrc-local='$EDITOR "$BASHRC_DIR/bashrc.local.sh" && reload'
alias edit-bashrc-adv='$EDITOR "$BASHRC_DIR" && reload'

alias edit-inputrc='$EDITOR ~/.inputrc && bind -f ~/.inputrc'

alias edit-nvim-cfg='$EDITOR "$HOME/.config/nvim/"'
alias edit-nvim-syntax='$EDITOR "$HOME/.config/nvim/syntax/"'
alias edit-nvim-snippets='$EDITOR "$HOME/.config/nvim/snippets"'

# git stuff
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gdc='git diff --cached'
alias gca='git commit --amend'

# zapup
if has-cmd zapup; then
    alias zapupd='zapup sync -j24'
fi

# dpcpp
if has-cmd icpx; then
    alias dpcpp='icpx -fsycl'
fi

# other
if has-cmd zeditor && ! has-cmd zed; then
    alias zed='zeditor'
fi
if has-cmd bat; then
    alias cat='bat -pp'
fi
if has-cmd nvim; then
    alias n='nvim'
    alias nn='nvim .'
    alias n.='nvim .'
fi

# slopmake
alias slopmake='cmake'

v() {
    local file; file="$(mktemp)"
    $EDITOR "$file"
    eval "$(< "$file")"
}
