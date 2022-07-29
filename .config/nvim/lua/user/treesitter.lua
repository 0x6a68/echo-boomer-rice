local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local define_modules = require("nvim-treesitter").define_modules
local query = require("nvim-treesitter.query")

local foldmethod_backups = {}
local foldexpr_backups = {}

define_modules({
	-- Fold settings on
	folding = {
		enable = true,
		attach = function(bufnr)
			foldmethod_backups[bufnr] = vim.wo.foldmethod
			foldexpr_backups[bufnr] = vim.wo.foldexpr
			print("attaching")
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
		end,
		detach = function(bufnr)
			print("detaching")
			vim.wo.foldmethod = foldmethod_backups[bufnr]
			vim.wo.foldexpr = foldexpr_backups[bufnr]
			foldmethod_backups[bufnr] = nil
			foldexpr_backups[bufnr] = nil
		end,
		is_supported = query.has_folds,
	},
})

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
