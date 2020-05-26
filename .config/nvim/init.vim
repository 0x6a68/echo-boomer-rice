""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                __   __ __   __    __   ______   ______                       "
"               /\ \ / //\ \ /\  -./  \ /\  == \ /\  ___\                      "
"               \ \ \'/ \ \ \\ \ \-./\ \\ \  __< \ \ \____                     "
"                \ \__|  \ \_\\ \_\ \ \_\\ \_\ \_\\ \_____\                    "
"                 \/_/    \/_/ \/_/  \/_/ \/_/ /_/ \/_____/                    "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Variables {{{
let g:mapleader = ','

" XDG compliant directories
let g:xdg_config_home = fnamemodify(expand('<sfile>'), ':p:h')
let g:xdg_data_home = fnamemodify(g:xdg_config_home, ':s?/.config/nvim?/.local/share/nvim?')
" }}}

" Plugins {{{
" Install vim-plug if needed
let s:vim_plug_path = g:xdg_data_home . '/site/autoload/plug.vim'
if !filereadable(s:vim_plug_path)
  execute 'silent !curl -qSLo ' . s:vim_plug_path . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(g:xdg_data_home . '/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'ap/vim-css-color'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'kassio/neoterm'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-projectionist'
  Plug 'voldikss/vim-floaterm'
  Plug 'junegunn/fzf.vim'
  Plug 'vim-test/vim-test'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vimwiki/vimwiki', {'branch': 'dev'}
call plug#end()
" }}}

" Encoding {{{
set encoding=UTF-8 " Default encoding. (vim-only)
scriptencoding UTF-8 " Default encoding for current script.
set fileformats=unix " Only use Unix end-of-line format.
" }}}

" Settings {{{

" Disable unused built-in plugins. {{{
let g:loaded_gzip = v:true
let g:loaded_rrhelper = v:true
let g:loaded_tarPlugin = v:true
let g:loaded_zipPlugin = v:true
let g:loaded_netrwPlugin = v:true
let g:loaded_netrwFileHandlers = v:true
let g:loaded_netrwSettings = v:true
let g:loaded_2html_plugin = v:true
let g:loaded_vimballPlugin = v:true
let g:loaded_getscriptPlugin = v:true
let g:loaded_logipat = v:true
let g:loaded_tutor_mode_plugin = v:true
let g:loaded_matchit = v:true
" }}}

" Encoding {{{
set encoding=UTF-8 " Default encoding. (vim-only)
scriptencoding UTF-8 " Default encoding for current script.
set fileformats=unix " Only use Unix end-of-line format.
" }}}

" Colors {{{
set termguicolors " Enable True Color support.
colorscheme dracula
" }}}

" Behaviour {{{
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set belloff=all " Turn off the bell upon all events.
set breakindent " Wrapped lines will be indented with same amount of space.
set clipboard=unnamedplus " Sync unnamed register with system clipboard.
" set confirm " Seek for confirmation for certain commands instead of giving errors.
set display=lastline " As much as possible of the last line in a window will be displayed.
set keywordprg= " Disable definition search by default.
set modelines=1 " Maximum number of lines that is checked for set commands.
set mouse=nv " Enable mouse support only for normal and visual modes.
set nojoinspaces " Disable inserting two spaces after `.`, `?`, `!` with join command.
set nolangremap " Setting 'langmap' does not apply to characters resulting from a mapping.
set noruler " Disable showing line numbers in command line.
set noshowmatch " When a bracket is inserted, do not jump to the matching one.
set nostartofline " Prevent the cursor from changing the current column when jumping.
set wrap " Prevent wrapping for long lines.
set nrformats=bin,hex " Only accept binary and hexadecimal numbers.
set pumheight=10 " Maximum number of items to show in the pop-up menu for completion.
set regexpengine=1 " Use old regular expression engine.
set report=0 " Threshold for reporting number of lines changed.
set scrolloff=8 " Minimum number of screen lines to keep above and below the cursor.
set sessionoptions=blank,buffers,curdir,folds,help,localoptions,resize,tabpages,winsize " Options for `mksession` command.
set shellpipe=&> " Fix potentional screen flashing problems with not using `tee`.
set shortmess=filmnrwxoOstTIc " Use abbreviations and short messages in command menu line.
set sidescroll=5 " Columns to scroll horizontally when cursor is moved off the screen.
set sidescrolloff=5 " Minimum number of screen columns to keep to cursor right.
set synmaxcol=200 " Maximum column in which to search for syntax items.
set textwidth=0 " Prevent auto wrapping when using affecting keys.
set timeoutlen=500 " Mapping delays in milliseconds.
set ttimeoutlen=10 " Key code delays in milliseconds.
set ttyfast " More characters will be sent to the screen for redrawing in terminal. (vim-only)
set updatetime=2000 " If that milliseconds nothing is typed CursorHold event will trigger.
set visualbell " Use visual bell instead of beeping on errors.
set iskeyword+=- " Treat words with dash as a word in Vim
" }}}

" Interface {{{
set cursorline " Highlight the line background of the cursor.
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:\  " Characters to be used in various user-interface elements.
set laststatus=2 " Always show the status line.
set linebreak " Wrap lines in 'breakat', rather than at the last character.
set list " Show invisibles
set showbreak=↪\ " Show breaks when long lines wrap
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
" set number " Show line numbers alongside relative numbers.
" set relativenumber " Show relative line numbers alongside numbers.
set signcolumn=yes " Always draw the sign column even there is no sign in it.
set title " Show title as in 'titlestring' in title bar of window.
set titlestring=%f " Format of the title used by 'title'.
set colorcolumn=81
" }}}

" Tags {{{
set tags=tags
" }}}

" Diff {{{
set diffopt=filler,vertical,foldcolumn:0 " Option settings for diff mode.
" }}}

" Completion {{{
set complete=.,w,b,k,t " Options for keyword completion.
set completeopt=noinsert,menuone " Options for insert mode completion.
set path=.,** " List of directories which will be searched when using related features.
set pumheight=8 " Maximum height of the popup menu for insert mode completion.
" }}}

" Indentation {{{
set tabstop=4 " Length of a <Tab> character.
set shiftwidth=0 " Number of spaces to use for each step of auto indent operators.
set softtabstop=-1 " Number of spaces that a <Tab> counts.
set noexpandtab " Disable using spaces instead of tab characters.
set nosmarttab " Tab key always inserts blanks according to 'tabstop'.
set autoindent " Copy indent from current line when starting a new line.
set shiftround " Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
set smartindent " Automatically inserts one extra level of indentation in some cases.
" }}}

" Folding {{{
set foldlevelstart=99 " Start editing with all folds open.
set foldmethod=indent " Use indent model for folding mechanism.
" }}}

" Search {{{
let &grepprg = 'rg --vimgrep --no-messages --no-ignore --hidden --follow --smart-case --glob "!.git/" --glob "!node_modules/" --regexp' " Program to use for the :grep command.
set grepformat=%f:%l:%c:%m,%f:%l:%m " Format to recognize for the :grep command output.
set ignorecase " Make default search is not case sensitive.
set incsearch " Instantly show results when you start searching.
"set nohlsearch " Disable highlight the matched search results by default.
set smartcase " If a uppercase character is entered, the search will be case sensitive.
" }}}

" Backup {{{
set undofile " Undo tree to be saved to a file when exiting a buffer.
set undolevels=100000 " Maximum undo limit.
set updatecount=100 " Typing this many characters will create the swap file.
set viewoptions=cursor,folds " Options used by `mkview` and `loadview` commands.
" }}}

" Buffers, Windows, Tabs {{{
set autoread " Read the file again if have been changed outside of Vim.
set hidden " Allows you to hide buffers with unsaved changes without being prompted.
set splitbelow " Splitting a window will put the new window below of the current one.
set splitright " Splitting a window will put the new window right of the current one.
set switchbuf=useopen " Jump to the first open window that contains the specified buffer.
set tabpagemax=50 " Maximum number of tab pages to be opened by the `tab all` command.
" }}}

" Command Mode {{{
set cmdwinheight=18 " Height of the command window size for commands like `q:` and `q/`.
set history=10000 " Define maximum command history size.
set noshowcmd " Disable displaying key presses at the right bottom.
set noshowmode " Disable native mode indicator.
set wildcharm=<C-z> " The key to start wildcard expansion inside macro.
set wildignorecase " Ignore case when completing in command menu.
set wildmenu " Command-line completion operates in an enhanced mode.
set wildmode=full " Wildmenu options.<Paste>
" }}}

" Neovim {{{
set inccommand=nosplit " Show live substitution results as you type.
" }}}

" }}}

" Mappings {{{

" Insert Mode {{{
" disable esc
inoremap <esc> <nop>
" use jk instead of esc
inoremap jk <esc>
" }}}

" Visual Mode {{{
" Stay in visual mode when indenting.
xnoremap < <gv
xnoremap > >gv
" Always search with 'very magic' mode.
xnoremap / /\v
xnoremap ? ?\v
" Use `s` for registers.
xnoremap s "
" }}}

" Normal Mode {{{
" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Always search with 'very magic' mode.
nnoremap / /\v
nnoremap ? ?\v
" useful when using wrapped lines
nnoremap j gj
nnoremap k gk
" Alternative beginning and end of line mappings.
nnoremap H ^
xnoremap H ^
onoremap H ^
nnoremap L $
xnoremap L g_
" Scroll viewport faster.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" automaticly jump to end of text input after pased
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Alternative mappings for finding the next pair.
nnoremap <C-n> %
xnoremap <C-n> %
onoremap <C-n> %
" highlight last insert text
nnoremap gV `[v`]
" faster Ex commands
nnoremap ; :
" Resize current window sizes.
nnoremap <S-Up> 2<C-w>+
nnoremap <S-Down> 2<C-w>-
nnoremap <S-Right> 2<C-w>>
nnoremap <S-Left> 2<C-w><
" Ex-mode / Help and man shortcut is shitty
nnoremap Q <nop>
" Override Ex mode with run @q.
nnoremap Q @q
nnoremap <F1> <nop>
nnoremap K <nop>
" remap macro record to Q
nnoremap Q q
nnoremap q <Nop>
" remap toggle folding
nnoremap <space> za
" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
" Tags
nnoremap <C-]> <C-]>
" }}}

" Command Mode {{{
" Jump to the beginning and end of line.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" Jump previous and next commands from history.
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
" Navigate left and right characters.
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" Construct substitute command with 'very magic' mode.
cnoremap :s substitute/\v//gc<Left><Left><Left><Left>
" Construct global command with 'very magic' mode.
cnoremap :g global/\v/<Left>
" }}}

" Leader {{{
" Open up .vimrc quickly in a new buffer
nnoremap  <leader>ev :vsp $MYVIMRC<cr>
" Source .vimrc explitly
nnoremap  <leader>sv :source $MYVIMRC<cr>
" reset search highlight
nnoremap <leader>/ :nohlsearch<CR>
" }}}

" }}}

syntax on " Enable loading syntax/*.vim files.
filetype plugin indent on " Enable loading {ftdetect,ftplugin,indent}/*.vim files.

" vim:foldmethod=marker:foldlevel=0
