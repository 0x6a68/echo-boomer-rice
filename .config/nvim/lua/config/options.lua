vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = opt.formatoptions
  - "t" -- wrap with text width
  + "c" -- wrap comments
  - "r" -- insert comment after enter
  - "o" -- insert comment after o/O
  - "q" -- allow formatting of comments with gq
  - "a" -- format paragraphs
  + "n" -- recognized numbered lists
  - "2" -- use indent of second line for paragraph
  + "l" -- long lines are not broken
  + "j" -- remove comment when joining lines
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- Always display the status line
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Don't show mode since we have a status line
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
opt.colorcolumn = "80"
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
-- opt.timeout = false
-- opt.ttimeout = false
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger Cursor Hold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

opt.splitkeep = "screen"
opt.shortmess:append({ C = true })

opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┨",
  vertright = "┣",
  verthoriz = "╋",
  fold = "⠀",
  eob = " ",
  diff = "┃",
  msgsep = "‾",
  foldsep = "│",
  foldclose = "▶",
  foldopen = "▼",
}
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevelstart = 1
