# zshell(zi) plugin manager
if [[ ! -f $XDG_CONFIG_HOME/zsh/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$XDG_CONFIG_HOME/zsh/.zi" && command chmod go-rwX "$XDG_CONFIG_HOME/zsh/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$XDG_CONFIG_HOME/zsh/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
typeset -Ag ZI
ZI[HOME_DIR]="$XDG_DATA_HOME/zsh/zi"

source "$XDG_CONFIG_HOME/zsh/.zi/bin/zi.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

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
