_sc ()
{
    local cur=${COMP_WORDS[$COMP_CWORD]}
    local cmd=${COMP_WORDS[0]}
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=($(compgen -W "$($cmd --names)" -- $cur))
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

complete -F _sc sc
