foreach widget (
	# Built-in
	'add-surround surround'
	'delete-surround surround'
	'change-surround surround'
	select-quoted
	select-bracketed
	# Custom
) {
	eval zle -N $widget
}

unset widget
