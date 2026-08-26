# basic
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias la='ls -a'
alias ll='ls -l'
alias l='ll'

# configs
alias reload='source "$BASHRC_FILE"'
alias edit-bashrc='$EDITOR "$BASHRC_DIR" && reload'
alias edit-aliases='$EDITOR "$BASHRC_DIR/aliases.sh" && reload'
alias edit-bashrc-local='$EDITOR "$BASHRC_DIR/bashrc.local.sh" && reload'

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

# clipboard
if has-cmd wl-copy && has-cmd wl-copy; then
    alias cset='wl-copy'
    alias cget='wl-paste'
elif has-cmd xclip; then
    alias cset='xclip -selection clipboard'
    alias cget='xclip -selection clipboard -o'
else
    alias cset='echo Keep Yourself Safe'
    alias cget='echo Keep Yourself Safe'
fi

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
elif has-cmd batcat; then
    alias bat='batcat -pp'
    alias cat='batcat -pp'
fi

if has-cmd nvim; then
    alias n='command nvim'
    alias nn='command nvim .'
    alias n.='command nvim .'
    if has-cmd z; then
        zz() {
            z "$@"
            command nvim .
        }
    fi
fi

# slopmake
alias slopmake='cmake'

# simh
alias pdp11='simh-pdp11'

