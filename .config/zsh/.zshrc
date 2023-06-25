foreach file (
  load.zsh
	settings.zsh
	plugins.zsh
) {
	source $ZDOTDIR/$file
}
[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source "$XDG_CONFIG_HOME/shell/aliasrc"
