return {
  -- enable better spellchecking
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          settings = {
            diagnosticSeverity = "Warning",
          },
        },
      },
    },
  },
  -- add rest http client I do not use
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    requires = { "nvim-lua/plenary.nvim" },
  },
  -- sourcegraph code search
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-cmp",
        opts = function(_, opts)
          table.insert(opts.sources, 1, {
            name = "cody",
            group_index = 1,
            priority = 100,
          })
        end,
      },
    },
    event = "VeryLazy",
    build = "nvim -l build/init.lua",
    keys = {
      {
        "<leader>cS",
        function()
          require("sg.extensions.telescope").fuzzy_search_results()
        end,
        desc = "Sourcegraph search",
      },
    },
    opts = {
      on_attach = require("lazyvim.util").lsp.on_attach,
    },
  },
}
