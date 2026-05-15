if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

alias zel zellij
alias rm trash-put

function fish_prompt --description 'Muted, minimal prompt'
    set -l last_status $status

    # Colors (muted: greys, blues, red, gold)
    set -l c_user    (set_color 8a8c94)      # grey
    set -l c_host    (set_color 6b7089)      # muted blue-grey
    set -l c_cwd     (set_color 7fa2c7)      # soft blue
    set -l c_git     (set_color c9a86a)      # muted gold
    set -l c_ok      (set_color 6fa171)      # desaturated green
    set -l c_err     (set_color c26c6c)      # soft red
    set -l c_symbol  (set_color 888888)      # grey
    set -l c_normal  (set_color normal)

    # User@host
    printf '%s%s%s@%s%s ' $c_user $USER $c_normal $c_host (hostname | cut -d. -f1) $c_normal

    # Directory
    printf '%s%s%s ' $c_cwd (prompt_pwd) $c_normal

    # Git branch/status (muted gold)
    if git -C . rev-parse HEAD >/dev/null 2>&1
        set -l git_status (__fish_git_prompt '%s')
        printf '%s%s%s ' $c_git $git_status $c_normal
    end

    # Status indicator
    if test $last_status -ne 0
        printf '%s✘%s ' $c_err $c_normal
    else
        printf '%s●%s ' $c_ok $c_normal
    end

    # Prompt symbol
    printf '%s❯%s ' $c_symbol $c_normal
end

zoxide init fish | source
