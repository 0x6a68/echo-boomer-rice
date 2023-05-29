local opt = vim.opt

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Mappings
vim.opt.pastetoggle = "<leader>v"

-- Visual
opt.confirm = false -- do not confirm to save changes before exiting modified buffer
opt.guicursor = "" -- keep fat cursor
opt.hlsearch = false -- disable highlights
opt.incsearch = true -- enable incremental search
opt.colorcolumn = "80" -- display line column
-- folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldnestmax = 99
-- opt.foldlevelstart = 2

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
vim.wo.fillchars = "fold:\\"
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1
