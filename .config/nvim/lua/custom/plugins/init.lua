return {
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   ["tpope/vim-sleuth"] = {},
   ["ThePrimeagen/harpoon"] = {},
   ["akinsho/flutter-tools.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      config = function()
         require("flutter-tools").setup {
            flutter_lookup_cmd = "asdf where flutter",
         }
      end,
   },
}
