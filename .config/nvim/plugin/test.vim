let test#strategy = "neoterm"
let neoterm_size='70'
let neoterm_default_mod = 'vertical'
let neoterm_autoscroll = 1
let neoterm_keep_term_open = 1
let neoterm_eof = "\r"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>TT :TestSuite<CR>


nnoremap <silent> <leader>th :call neoterm#close()<CR>
nnoremap <silent> <leader>tl :call neoterm#clear()<CR>
nnoremap <silent> <leader>tk :call neoterm#kill()<CR>
tmap <silent> <C-e> <C-\><C-n>
