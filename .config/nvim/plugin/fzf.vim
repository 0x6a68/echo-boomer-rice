let g:fzf_command_prefix = 'F' " Add prefix 'Fzf' commands for grouping.
let g:fzf_buffers_jump = v:true " Jump to the existing window if possible.
let g:fzf_commands_expect = 'alt-enter' " Directly execute the command without appending anything.
let g:fzf_history_dir=g:xdg_data_home " History directory.s

" Define key mappings.
nnoremap <silent> <C-p> :FGFiles<CR>
nnoremap <silent> gis :FGFiles?<CR>
nnoremap <silent> <Leader><C-p> :FFiles<CR>
nnoremap <silent> <M-x> :FCommands<CR>
nnoremap <silent> <C-b> :FBuffers<CR>
nnoremap <silent> <C-f> :FBTags<CR>
nnoremap <silent> <Leader><C-f> :FTags<CR>
nnoremap <silent> <Leader>h :FHelptags<CR>
nnoremap <silent> <Leader>: :FHistory:<CR>
nnoremap <silent> <Leader>/ :FHistory/<CR>
nnoremap <silent> <Leader>` :FMarks<CR>
" nnoremap <silent> g<C-p> :call fzf#run(
" 	\ fzf#wrap(
" 		\ 'projects',
" 		\ {
" 		\	'source': 'ls ~/Projects',
" 		\	'dir': '~/Projects',
" 		\	'sink': {dir -> execute(printf('silent edit %s', dir))},
" 		\	'options': '--no-multi --prompt="> "'
" 		\ },
" 		\ 0
" 	\ )
" \ )<CR>

" function! g:FzfFloatingWindow() abort
" 	call nvim_open_win(
" 		\ nvim_create_buf(v:false, v:true),
" 		\ v:true,
" 		\ {
" 			\ 'relative': 'editor',
" 			\ 'row': 3,
" 			\ 'col': (&columns - 80) / 2,
" 			\ 'width': 80,
" 			\ 'height': 30,
" 			\ 'style': 'minimal'
" 		\ }
" 	\ )
" endfunction
