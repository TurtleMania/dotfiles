autoload -Uz vcs_info

# Setup git branch showing
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%b '

precmd() { vcs_info }

# Setup prompt
setopt PROMPT_SUBST
PROMPT='%n ${vcs_info_msg_0_}%(!.#.$) '
RPROMPT='%~'

# Setup aliases
alias ls='ls --color=auto'
alias la='ls -A'
alias grep='grep --color=auto'
alias c='clear'

# Add .local/bin to PATH
path+=$HOME/.local/bin
export PATH

# Disable a few binds
stty start undef
stty stop undef

# Enable zoxide
eval "$(zoxide init zsh)"

# Grab colors
(cat ~/.cache/wal/sequences &)

# Set EDITOR to neovim
export EDITOR=nvim

fastfetch
