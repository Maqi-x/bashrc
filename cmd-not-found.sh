try-eal() {
    if [[ "$1" =~ ^[0-9[:space:]+*/%^()-]+$ ]]; then
        local result; result=$(echo "$1" | bc 2>/dev/null)
        if [ -n "$result" ]; then
            echo -e "$1 = \033[1m$result\033[0m"
            return 0
        fi
    fi
    return 1
}

suggestion_script='
import sys, difflib
cmd=sys.argv[1]
cmds=[l.strip() for l in sys.stdin]
m=difflib.get_close_matches(cmd, cmds, n=1, cutoff=0.7)
print(m[0] if m else "")
'

get-suggestion() {
    compgen -c | sort -u | python3 -c "$suggestion_script" "$1"
}

print-msg() {
    echo -e "\033[1;31merror:\033[0m command '$1' not found" >&2
}

print-suggestion() {
    echo -e "\033[1;36mnote: \033[0m did you mean: $1?" >&2
}

search-repo() {
    local pkgs
    if has-cmd pkgfile; then
        pkgs=$(pkgfile -q "$1" 2>/dev/null | sort -u)
    fi
    if [[ -n "$pkgs" ]]; then
        echo -e "\033[1;32mpacmn:\033[0m packages matching '$1': \033[1m$(echo "$pkgs" | xargs)\033[0m" >&2
        return 0
    fi
    return 1
}

search-aur() {
    local pkgs
    if has-cmd yay; then
        pkgs=$(yay -Ssq "$1" 2>/dev/null | grep -xE "${1}(-bin|-git|-svn)?" | sort -u)
    fi

    if [[ -n "$pkgs" ]]; then
        echo -e "\033[1;35maur:  \033[0m packages matching '$1': \033[1m$(echo "$pkgs" | xargs)\033[0m" >&2
    fi
}

command_not_found_handle() {
    if has-cmd bc && try-eval "$*"; then
        return
    fi

    local suggestion
    suggestion=$(get-suggestion "$1")

    print-msg "$1"
    if [[ -n $suggestion ]]; then
        print-suggestion "$suggestion"

        # searching aur is slow, let's skip it here
        search-repo "$1" ||:
    else
        if ! search-repo "$1"; then
            # again, searching aur is slow so let's just skip it if we found a pacman package
            search-aur "$1" ||:
        fi
    fi

    return 127
}
