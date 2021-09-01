" Plugin: fzf {{{

" Settings {{{
let g:fzf_command_prefix = 'F' " Add prefix 'Fzf' commands for grouping.
let g:fzf_buffers_jump = v:true " Jump to the existing window if possible.
let g:fzf_commands_expect = 'alt-enter' " Directly execute the command without appending anything.
let g:fzf_history_dir=g:xdg_data_home " History directory.s
"}}}

" Mappings {{{
" Define key mappings.
nnoremap <silent> <C-p> :FFiles<CR>
nnoremap <silent> gis :FGFiles?<CR>
nnoremap <silent> <Leader><C-p> :FFiles<CR>
nnoremap <silent> <M-x> :FCommands<CR>
nnoremap <silent> <C-b> :FBuffers<CR>
nnoremap <silent> <C-f> :FBTags<CR>
nnoremap <silent> <Leader><C-f> :FTags<CR>
nnoremap <silent> <Leader>h :FHelptags<CR>
nnoremap <silent> <Leader>: :FHistory:<CR>
nnoremap <silent> <Leader>` :FMarks<CR>
nnoremap <silent> <Leader>rg :FRg<CR>
" }}}

" Commands {{{
function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
