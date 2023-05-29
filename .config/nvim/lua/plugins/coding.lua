return {
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
    },
    config = true,
  },
  {
    "nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
  {
    -- treesitter addons
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "andymass/vim-matchup" },
      { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
    },
    opts = {
      matchup = { enable = true },
    },
  },
}
