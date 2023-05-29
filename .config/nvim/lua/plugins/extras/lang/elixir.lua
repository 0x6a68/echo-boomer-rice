return {
  -- add elixir to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "elixir", "eex", "heex", "surface" })
      end
    end,
  },
  -- add lsp support
  {
    "neovim/nvim-lspconfig",
    ---@type lspconfig.options
    opts = {
      servers = {
        elixirls = {
          dialyzerEnabled = true,
          fetchDeps = true,
        },
      },
    },
  },
  -- add null-ls support
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      local tools = {
        nls.builtins.diagnostics.credo,
        -- nls.builtins.formatting.mix,
        -- nls.builtins.formatting.surface,
      }
      for _, tool in ipairs(tools) do
        table.insert(opts.sources, tool)
      end
    end,
  },
  -- add projectionist support
  {
    "tpope/vim-projectionist",
    config = function()
      vim.g.projectionist_heuristics = {
        ["mix.exs"] = {
          ["lib/**/live/*_live.ex"] = {
            type = "live",
            alternate = "test/{dirname}/live/{basename}_live_test.exs",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live do",
              "  use {dirname|camelcase|capitalize}, :live_view",
              "end",
            },
          },
          ["test/**/live/*_live_test.exs"] = {
            type = "test",
            alternate = "lib/{dirname}/live/{basename}_live.ex",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}LiveTest do",
              "  use {dirname|camelcase|capitalize}.ConnCase, async: true",
              "end",
            },
          },
          ["lib/**/controllers/*_controller.ex"] = {
            type = "controller",
            alternate = "test/{dirname}/controllers/{basename}_controller_test.exs",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Controller do",
              "  use {dirname|camelcase|capitalize}, :controller",
              "end",
            },
          },
          ["test/**/controllers/*_controller_test.exs"] = {
            alternate = "lib/{dirname}/controllers/{basename}_controller.ex",
            type = "test",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ControllerTest do",
              "  use {dirname|camelcase|capitalize}.ConnCase, async: true",
              "end",
            },
          },
          ["lib/**/channels/*_channel.ex"] = {
            type = "channel",
            alternate = "test/{dirname}/channels/{basename}_channel_test.exs",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel do",
              "  use {dirname|camelcase|capitalize}, :channel",
              "end",
            },
          },
          ["test/**/channels/*_channel_test.exs"] = {
            alternate = "lib/{dirname}/channels/{basename}_channel.ex",
            type = "test",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ChannelTest do",
              "  use {dirname|camelcase|capitalize}.ChannelCase, async: true",
              "",
              "  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel",
              "end",
            },
          },
          ["test/**/features/*_test.exs"] = {
            type = "feature",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Test do",
              "  use {dirname|camelcase|capitalize}.FeatureCase, async: true",
              "end",
            },
          },
          ["lib/*.ex"] = {
            alternate = "test/{}_test.exs",
            type = "source",
            template = { "defmodule {camelcase|capitalize|dot} do", "end" },
          },
          ["test/*_test.exs"] = {
            alternate = "lib/{}.ex",
            type = "test",
            template = {
              "defmodule {camelcase|capitalize|dot}Test do",
              "  use ExUnit.Case, async: true",
              "",
              "  alias {camelcase|capitalize|dot}",
              "end",
            },
          },
        },
      }
      -- code
    end,
  },
  -- add dap support
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          table.insert(opts.ensure_installed, "elixir")
        end,
      },
    },
    config = function()
      local dap = require("dap")
      local elixirLS = require("mason-registry").get_package("elixir-ls"):get_install_path() .. "/debugger.sh"

      dap.adapters.mix_task = {
        type = "executable",
        command = elixirLS,
        args = {},
      }
      dap.configurations.elixir = {
        {
          type = "mix_task",
          name = "mix test",
          task = "test",
          taskArgs = { "--trace" },
          request = "launch",
          startApps = true,
          projectDir = "${workspaceFolder}",
          requireFiles = {
            "test/**/test_helper.exs",
            "test/**/*_test.exs",
          },
        },
      }
    end,
  },
  -- add test support
  {
    "nvim-neotest/neotest",
    dependencies = {
      "jfpedroza/neotest-elixir",
    },
    opts = function(_, opts)
      opts.adapters = vim.list_extend(opts.adapters or {}, {
        require("neotest-elixir"),
      })
    end,
  },
}
