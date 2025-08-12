#preserve history
# shopt -s histappend
# export PROMPT_COMMAND="history -a; history -n"
#more commands
shopt -s extglob
#move directories without cd command
shopt -s autocd
#
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init /opt/homebrew/bin/bash)"
source ~/.local/share/blesh/ble.sh
eval "$(fzf --bash)"
#path
export PATH="/Users/hamzamasood/.bin:$PATH"
export PATH="/Users/hamzamasood/scripts:$PATH"
export PATH="/Users/hamzamasood/.local/bin:$PATH"
export GOPATH=/Users/hamzamasood/go
export PATH=$PATH:$GOPATH/bin
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Users/hamzamasood/Library/Python/3.9/bin:$PATH"
export ATAC_KEY_BINDINGS="/Users/hamzamasood/.config/ATAC/keybindings.toml"

#env vars
export SECOND_BRAIN="/Users/hamzamasood/Documents/second-brain"
export EDITOR='nvim'

#z.sh
# . z
#alias
alias l="eza -l --no-user --no-time --icons --no-permissions --no-filesize"
alias ll="eza -l --no-user --icons"
alias la="ll -a"
alias lt="ll -aT"
alias vim=nvim
alias day="source day"
#kubectl alias
alias kx="kubectx"
alias k="kubectl"
alias kg="kubectl get"
# for kubectl completion
# complete -o default -F __start_kubectl k
alias sb="source second-brain"
alias grep='ggrep --color=auto -n'
alias dgrep='ggrep --color=auto -n -R -w'
alias sed='gsed'
alias awk='gawk'
alias zenv='. /Users/hamzamasood/scripts/zeebe-env.sh'
# alias vcat='cat'
# alias cat='bat'
# Yazi file-manager
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# atuin
. "$HOME/.atuin/bin/env"
export ATUIN_NOBIND="true"
eval "$(atuin init bash)"

# bind to ctrl-r, add any other bindings you want here too
bind -x '"\C-r": __atuin_history'

# bind to the up key, which depends on terminal mode
bind -x '"\e[A": __atuin_history --shell-up-key-binding'
bind -x '"\eOA": __atuin_history --shell-up-key-binding'

# zoxide
eval "$(zoxide init bash)"

#krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#node
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"
# nushell
# export XDG_CONFIG_HOME="/Users/hamzamasood/.config"

# nvm() {
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
# . "/Users/hamzamasood/.acme.sh/acme.sh.env"
# }
# kubech
source ~/.kubech/kubech
source ~/.kubech/completion/kubech.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hamzamasood/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hamzamasood/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hamzamasood/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hamzamasood/Downloads/google-cloud-sdk/completion.bash.inc'; fi
###
#bash completion
# [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# rust
. "$HOME/.cargo/env"

pokeget random --hide-name
