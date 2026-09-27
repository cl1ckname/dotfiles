# Terminal title = name of the running command, or of the last one when idle.
# tmux shows it as the window name while the shell is idle.
function fish_title
    set -l cmd $argv[1]
    test -z "$cmd"; and set cmd $history[1]
    test -z "$cmd"; and set cmd (prompt_pwd -d 1 -D 1)

    string trim -- $cmd | string split -f1 -n ' ' | path basename
end
