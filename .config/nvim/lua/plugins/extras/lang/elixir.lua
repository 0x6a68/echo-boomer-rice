return {
  -- add json to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "elixir", "heex", "eex" })
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, { nls.builtins.formatting.mix })
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        elixirls = {},
      },
    },
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