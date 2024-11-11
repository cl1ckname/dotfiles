if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias pong='ping 8.8.8.8'
alias down='shutdown now'
alias ll='ls -la'
alias minecraft='java -jar /home/clickname/Downloads/TLauncher-2.876.jar'
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias iccat='kitten icat'

alias dcu='docker compose up -d'

starship init fish | source
enable_transience

fish_add_path ~/go/bin
fish_add_path ~/.npm-packages/bin
fish_add_path ~/.yarn/bin
fish_add_path ~/.config/yarn/global/node_modules/.bin
fish_add_path ~/.local/bin

set -gx EDITOR (type -p nvim)
set -gx NVM_DIR ~/.config/nvm
