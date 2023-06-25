typeset -Ag ZI
ZI[HOME_DIR]="$XDG_DATA_HOME/zsh/zi"
ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
HISTFILE="$XDG_DATA_HOME/zsh/zshhistory" # Where history logs are stored.

# Make special variables duplicate-free.
typeset -gU path fpath cdpath

# Set zsh custom autoload directory.
fpath=(
	$fpath
	"$ZDOTDIR/autoload"
	${ASDF_DIR}/completions
)

# Define functions to load them on execution.
foreach function (
	add-zsh-hook
	compinit
	promptinit
	select-bracketed
	select-quoted
	surround
	vcs_info
	zrecompile
) {
	autoload -U $function
}

# Load binary modules.
foreach module (
	complete
	complist
	datetime
	parameter
	regex
	zle
	zleparameter
	zpty
	zutil
) {
	zmodload zsh/$module
}

compinit -d $ZSH_COMPDUMP # Completion cache file.
