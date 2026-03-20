source-if-exists() {
    [ -f "$1" ] && source "$1"
}

add-path() {
    case ":$PATH:" in
    *:"$1":*)
        ;;
    *)
        PATH="${PATH:+$PATH:}$1"
    esac
}
add-path-front() {
    case ":$PATH:" in
    *:"$1":*)
        ;;
    *)
        PATH="$1${PATH:+:$PATH}"
    esac
}

has-cmd() {
    command -v "$1" > /dev/null
}
