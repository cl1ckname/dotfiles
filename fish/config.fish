if status is-interactive
    if not set -q TMUX
        exec tmux new-session
    end
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
alias rewall='~/dotfiles/scripts/background.sh'
alias kssh='kitten ssh'
alias nv='nvim'
alias ff='fastfetch'
alias copy='wl-copy'

alias dekyt='nmcli con down kyt'
alias wgp='nmcli con up wgp'
alias dewgp='nmcli con down wgp'

alias dcu='docker compose up -d'

function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience

fish_add_path ~/go/bin
fish_add_path ~/.npm-packages/bin
fish_add_path ~/.yarn/bin
fish_add_path ~/.config/yarn/global/node_modules/.bin

# set -Ux ANDROID_HOME /opt/android-sdk
# fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
# fish_add_path $ANDROID_HOME/platform-tools
# fish_add_path $ANDROID_HOME/tools
# fish_add_path $ANDROID_HOME/tools/bin
# fish_add_path $ANDROID_HOME/emulator

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

if not set -q SSH_AGENT_PID; or not kill -0 $SSH_AGENT_PID 2>/dev/null
    eval (ssh-agent -c | head -n 2)
end
cdf shell fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
