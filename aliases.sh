# git stuff
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gdc='git diff --cached'

# zapup
alias zapupd='zapup sync -j24'

# dpcpp
alias dpcpp='icpx -fsycl'

# other
v() {
    local file; file="$(mktemp)"
    $EDITOR "$file"
    eval "$(< "$file")"
}
