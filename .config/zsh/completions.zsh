# FZF + Gopass {{{
_fzf_complete_gopass() {
	_fzf_complete '+m' "$@" < <(
		gopass find ''
	)
}

_fzf_complete_gopass_post() {
	read passurl
	echo ${(q)passurl}
}
# # }}}

# # FZF + Git {{{
# _fzf_complete_git() {
# 	_fzf_complete "--height 40% --ansi" "$@" < <(
# 		git branch -vv --all --color=always
# 	)
# }

# _fzf_complete_git_post() {
#     local line branch
#     read -r line
#     branch=$(echo "${line}" | cut -d' ' -f 1)

#     if [[ ${branch} = "*" ]]; then
# 		branch=$(echo "${line}" | cut -d' ' -f 2)
#     fi
#     if [[ ${branch} =~ ^remotes/ ]]; then
# 		branch=${branch#"remotes/"}
#     fi
#     echo "${branch}"
# }
# # }}}
