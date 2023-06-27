ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
HISTFILE="$XDG_DATA_HOME/zsh/zshhistory" # Where history logs are stored.

[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source "$XDG_CONFIG_HOME/shell/aliasrc"
[ -f "$ASDF_DATA_DIR/rtx/bin/rtx" ] && source "$ASDF_DATA_DIR/rtx/bin/rtx activate -s zsh"

foreach file (
	plugins.zsh
  load.zsh
	settings.zsh
	functions.zsh
) {
	source $ZDOTDIR/$file
}
