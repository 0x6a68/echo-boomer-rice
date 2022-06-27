local M = {}
local opt = vim.opt
local global = vim.g
-- make sure you maintain the structure of `core/default_config.lua` here,
M.options = {
   user = function()
      global.mapleader = ","
      global.transparency = M.ui.transparency

      opt.wrap = true
      opt.linebreak = true
      opt.foldmethod = "expr"
      opt.foldexpr = "nvim_treesitter#foldexpr()"

      opt.list = true
      -- opt.foldnestmax = 3
      -- opt.foldminlines = 10
      vim.api.nvim_create_autocmd("BufRead", {
         callback = function()
            vim.api.nvim_create_autocmd("BufWinEnter", {
               once = true,
               command = "normal! zx zM",
            })
         end,
      })
   end,
}

M.plugins = {
   user = require "custom.plugins",
   -- remove = {
   --    "lukas-reineke/indent-blankline.nvim",
   -- },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   override = {
      ["lewis6991/gitsigns.nvim"] = {
         current_line_blame = true,
         current_line_blame_opts = {
            ignore_whitespace = true,
         },
      },
      ["kyazdani42/nvim-tree.lua"] = {
         view = { side = "left" },
         git = {
            enable = true,
            ignore = true,
         },
      },
      ["nvim-treesitter/nvim-treesitter"] = {
         indent = {
            enable = true,
         },
      },
      ["akinsho/bufferline.nvim"] = {
         always_show_bufferline = true,
      },
      ["nvim-telescope/telescope.nvim"] = {
         extensions_list = "harpoon",
      },
   },
}

M.ui = {
   theme = "chadracula",
}

M.mappings = require "custom.mappings"

return M
