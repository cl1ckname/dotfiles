if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \cg accept-autosuggestion
set -U fish_greeting

alias cd..='cd ..'
alias ll='eza -l --icons --no-permissions --no-user -h -o'
alias la='eza -a'
alias ls='eza'
alias tree='eza -T --level=5'
alias cat='bat'

alias ipa='ip a'
alias pong='ping 8.8.8.8'
alias down='shutdown now'
alias minecraft='java -jar /home/clickname/Downloads/TLauncher-2.876.jar'
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias iccat='kitten icat'
alias refish='source ~/dotfiles/fish/config.fish'
alias rewall='killall swaybg || true && ~/dotfiles/scripts/background.sh'
alias kssh='kitten ssh'
alias nv='nvim'

alias dekyt='nmcli con down kyt'
alias wgp='nmcli con up wgp'
alias dewgp='nmcli con down wgp'

alias dcu='docker compose up -d'

starship init fish | source
enable_transience

fish_add_path ~/go/bin
fish_add_path ~/.npm-packages/bin
fish_add_path ~/.yarn/bin
fish_add_path ~/.config/yarn/global/node_modules/.bin
fish_add_path ~/.local/bin

set -gx EDITOR (type -p nvim)
set -gx GOBIN ~/go/bin
set -gx NVM_DIR ~/.config/nvm

# For yazi integration
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/clickname/.local/share/coursier/bin"
# <<< coursier install directory <<<

eval (ssh-agent -c)
cdf shell fish | source
