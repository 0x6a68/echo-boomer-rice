return {
  -- Add ocaml & related to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ocaml" })
      end
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.ocamlformat,
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ocamlformat" })
      end
    end,
  },

  -- Ensure LSP installed correctly
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "tjdevries/ocaml.nvim",
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        ocamllsp = {
          get_language_id = function(_, ftype)
            return ftype
          end,
        },
      },
    },
  },
}
