autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%b '

precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='%n ${vcs_info_msg_0_}%(!.#.$) '
RPROMPT='%~'

alias ls='ls --color=auto'
alias la='ls -A'
alias grep='grep --color=auto'

eval "$(zoxide init zsh)"

(cat ~/.cache/wal/sequences &)

export EDITOR=nvim

fastfetch
