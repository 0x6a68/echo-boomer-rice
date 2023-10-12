return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local cwd = vim.fn.getcwd()
      local util = require("lspconfig.util")
      local project_root = util.find_node_modules_ancestor(cwd)

      local vue_path = util.path.join(project_root, "node_modules", "vue")
      local is_vue = vim.fn.isdirectory(vue_path) == 1

      if is_vue then
        opts.servers.volar = {
          filetypes = {
            "vue",
            "javascript",
            "javascript.jsx",
            "typescript",
            "typescript.tsx",
            "javascriptreact",
            "typescriptreact",
            "json",
          },
        }
        opts.servers.tsserver = {
          autostart = false,
          root_dir = function()
            return false
          end,
          single_file_support = false,
        }
      end

      return opts
    end,
  },

  -- Add vitest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      opts.adapters = vim.list_extend(opts.adapters or {}, {
        require("neotest-vitest"),
      })
    end,
  },
}