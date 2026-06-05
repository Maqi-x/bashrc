try-eval() {
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

command_not_found_handle() {
    if try-eval "$*"; then
        return
    fi

    local suggestion
    suggestion=$(get-suggestion "$1")

    print-msg "$1"
    if [[ -n $suggestion ]]; then
        print-suggestion "$suggestion"
    fi
    return 127
}
