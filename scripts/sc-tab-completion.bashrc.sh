_sc ()
{
    local cur=${COMP_WORDS[$COMP_CWORD]}
    local cmd=${COMP_WORDS[0]}
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=($(compgen -W "cd $($cmd --names)" -- $cur))
    elif [ $COMP_CWORD -eq 2 ]; then
        local arg="${COMP_WORDS[1]}"
        if [ "$arg" == "cd" -o "$arg" == "edit" -o "$arg" == "path" ]; then
            COMPREPLY=($(compgen -W "$($cmd --names)" -- $cur))
        fi

    # TODO: modify this to allow tab completion for script arguments
    # elif [ $COMP_CWORD -eq 2 ]; then
    #     local script="${COMP_WORDS[1]}"
    #     local output
    #     output="$($cmd $script ls 2>/dev/null)"
    #     if [ $? -eq 0 ]; then
    #         COMPREPLY=($(compgen -W "$output" -- $cur))
    #     fi
    fi
}

sc ()
{
    if [ "$1" == "cd" ]; then
        if [ $# -lt 2 ]; then
            echo "Usage: sc cd <script>"
            return 1
        fi
        cd "$(dirname "$(command sc path "$2")")"
    else
        command sc "$@"
    fi
}

complete -F _sc sc
