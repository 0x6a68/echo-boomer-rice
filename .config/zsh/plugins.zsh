# Zinit
# Repo: https://github.com/zdharma/zinit
declare -A ZINIT
ZINIT[HOME_DIR]="${XDG_DATA_HOME}/zinit"
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zcompdump"

# Auto install
if [[ ! -f "${ZINIT[HOME_DIR]}/bin/zinit.zsh" ]]; then
    command git clone 'https://github.com/zdharma/zinit' "${ZINIT[HOME_DIR]}/bin"
    . "${ZINIT[HOME_DIR]}/bin/zinit.zsh"
    zinit self-update
fi

source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

alias zinit-update='zinit update --all && zinit self-update && zinit compile --all'

# Plugins {{{
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

zstyle :omz:plugins:ssh-agent identities keys/ga_rsa
zstyle :omz:plugins:ssh-agent lifetime 4h
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
# }}}
