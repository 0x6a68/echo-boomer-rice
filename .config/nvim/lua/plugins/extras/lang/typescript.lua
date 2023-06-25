return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
    },
    opts = function(_, opts)
      opts.adapters = vim.list_extend(opts.adapters or {}, {
        require("neotest-jest")({
          jestCommand = "npx jest",
        }),
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      local tools = {
        nls.builtins.code_actions.eslint_d,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.formatting.prettier_d_slim,
      }
      for _, tool in ipairs(tools) do
        table.insert(opts.sources, tool)
      end
    end,
  },
  {
    "tpope/vim-projectionist",
    config = function()
      local heuristics = {
        ["package.json"] = {},
        ["tsconfig.json"] = {},
      }
      -- Helper function for batch-updating the vim.g.projectionist_heuristics variable.
      local project = function(root, projections)
        for pattern, projection in pairs(projections) do
          heuristics[root][pattern] = projection
        end
      end

      -- Set up projections for JS variants.
      for _, root_and_extension in ipairs({
        { "package.json", ".js" },
        { "package.json", ".jsx" },
        { "tsconfig.json", ".ts" },
        { "tsconfig.json", ".tsx" },
      }) do
        local root = root_and_extension[1]
        local extension = root_and_extension[2]
        project(root, {
          ["*" .. extension] = {
            ["alternate"] = {
              "{dirname}/{basename}.test" .. extension,
              "{dirname}/__tests__/{basename}.test" .. extension,
              "{dirname}/__tests__/{basename}-test" .. extension,
              "{dirname}/__tests__/{basename}-mocha" .. extension,
            },
            ["type"] = "source",
          },
          ["*.test" .. extension] = {
            ["alternate"] = "{basename}" .. extension,
            ["type"] = "test",
          },
          ["**/__tests__/*.test" .. extension] = {
            ["alternate"] = "{dirname}/{basename}" .. extension,
            ["type"] = "test",
          },
          ["**/__tests__/*-test" .. extension] = {
            ["alternate"] = "{dirname}/{basename}" .. extension,
            ["type"] = "test",
          },
          ["**/__tests__/*-mocha" .. extension] = {
            ["alternate"] = "{dirname}/{basename}" .. extension,
            ["type"] = "test",
          },
        })

        vim.g.projectionist_heuristics = heuristics
      end
    end,
  },
}
