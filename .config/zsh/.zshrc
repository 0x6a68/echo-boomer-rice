[ -f "$XDG_CONFIG_HOME/aliasrc" ] && source "$XDG_CONFIG_HOME/aliasrc"
[ -f "$ASDF_DATA_DIR/asdf.sh" ] && source "$ASDF_DATA_DIR/asdf.sh"
type direnv &> /dev/null && eval "$(direnv hook zsh)"

# Put these into .zshenv?
export ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
export HISTFILE="$XDG_DATA_HOME/zshhistory" # Where history logs are stored.

foreach piece (
	load.zsh
	plugins.zsh
	settings.zsh
	widgets.zsh
	mappings.zsh
	completions.zsh
	bindings.zsh
) {
	source $ZDOTDIR/$piece
}
