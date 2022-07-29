# Zinit
# Repo: https://github.com/zdharma/zinit
declare -A ZINIT
ZINIT[HOME_DIR]="${XDG_DATA_HOME}/zinit"
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zcompdump"

# Auto install
if [[ ! -f "${ZINIT[HOME_DIR]}/bin/zi.zsh" ]]; then
    command git clone 'https://github.com/zdharma/zi' "${ZINIT[HOME_DIR]}/bin"
    . "${ZINIT[HOME_DIR]}/bin/zi.zsh"
    zi self-update
fi

source "${ZINIT[HOME_DIR]}/bin/zi.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

alias zinit-update='zi update --all && zi self-update && zi compile --all'

# Plugins {{{
zi ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zi light sindresorhus/pure
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-completions
zi light zdharma/fast-syntax-highlighting
zi snippet OMZ::plugins/fzf/fzf.plugin.zsh

zstyle :omz:plugins:ssh-agent identities keys/ga_rsa
zstyle :omz:plugins:ssh-agent lifetime 4h
zi snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
# }}}
