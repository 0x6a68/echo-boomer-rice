let g:coc_global_extensions=[
\ "coc-elixir",
\ "coc-json",
\ "coc-html",
\ "coc-css",
\ "coc-yaml",
\ "coc-tsserver",
\]

let g:coc_user_config={
	\ "coc.preferences.formatOnSaveFiletypes": ["*"],
	\ "suggest.enabledPreview": v:true,
	\ "diagnostic.errorSign": "‼️",
  \ "languageserver": {
  \   "haskell": {
  \     "command": "hie-wrapper",
  \     "args": ["--lsp"],
  \     "rootPatterns": [
  \       "*.cabal",
  \       "stack.yaml",
  \       "cabal.project",
  \       "package.yaml"
  \     ],
  \     "filetypes": [
  \       "hs",
  \       "lhs",
  \       "haskell"
  \     ],
  \     "initializationOptions": {
  \       "languageServerHaskell": {
  \       }
  \     }
  \   }
  \ }
\}

let g:coc_data_home=g:xdg_data_home . '/coc'
" Key Bindings {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-j> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Functions {{{
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Colors {{{
" hi! link CocErrorSign WarningMsg
" hi! link CocWarningSign Number
" hi! link CocInfoSign Type
" }}}

