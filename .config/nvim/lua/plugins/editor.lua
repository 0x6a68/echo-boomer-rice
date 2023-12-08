return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next, -- scroll the list with <c-j>
            ["<C-k>"] = require("telescope.actions").move_selection_previous, -- scroll the list with <c-k>
          },
        },
      },
    },
  },
  -- notify
  { "j-hui/fidget.nvim" },
  -- file navigation
  {
    "echasnovski/mini.files",
    keys = {
      {
        "-",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      -- {
      --   "_",
      --   function()
      --     require("mini.files").open(vim.loop.cwd(), true)
      --   end,
      --   desc = "Open mini.files (cwd)",
      -- },
    },
    opts = {
      mappings = {
        go_in_plus = "<cr>",
        show_help = "?",
        go_out_plus = "-",
      },
      windows = {
        preview = false,
      },
    },
    init = function()
      local map_split = function(buf_id, lhs, direction)
        local minifiles = require("mini.files")
        local function rhs()
          local window = minifiles.get_target_window()
          -- Noop if the explorer isn't open or the cursor is on a directory.
          if window == nil or minifiles.get_fs_entry().fs_type == "directory" then
            return
          end

          -- Make a new window and set it as target.
          local new_target_window
          vim.api.nvim_win_call(window, function()
            vim.cmd(direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
          end)

          minifiles.set_target_window(new_target_window)
          -- Go in and close the explorer.
          minifiles.go_in()
          minifiles.close()
        end

        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. string.sub(direction, 12) })
      end

      -- add extra keymappings
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          map_split(buf_id, "<C-x>", "belowright horizontal")
          map_split(buf_id, "<C-v>", "belowright vertical")
        end,
      })
    end,
  },
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon menu",
      },
      {
        "<Leader>ha",
        function()
          local harpoon_list = require("harpoon"):list()
          local item_to_toggle = harpoon_list.config.add(harpoon_list.config)

          ---@type number?
          local item_to_toggle_index = nil
          for index, item in ipairs(harpoon_list.items) do
            if harpoon_list.config.equals(item, item_to_toggle) then
              item_to_toggle_index = index
              break
            end
          end

          if item_to_toggle_index ~= nil then
            harpoon_list:removeAt(item_to_toggle_index)
            vim.notify("Removed file " .. item_to_toggle.value)
          else
            harpoon_list:append(item_to_toggle)
            vim.notify("Appended file " .. item_to_toggle.value)
          end
        end,
        desc = "(harpoon) Toggle file",
      },
      {
        "[h",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "(harpoon) Previous file",
      },
      {
        "]h",
        function()
          require("harpoon"):list():next()
        end,
        desc = "(harpoon) Next file",
      },
    },
    config = function(_, opts)
      require("harpoon"):setup(opts)
    end,
    opts = {
      settings = {
        save_on_toggle = true,
      },
    },
  },
  -- open files by line and column numbers
  { "wsdjeg/vim-fetch" },
  -- alternative files
  {
    "rgroli/other.nvim",
    keys = {
      {
        "<leader>fv",
        "<cmd>OtherVSplit<CR>",
        desc = "Open alternative file in v-split",
      },
      {
        "<leader>fs",
        "<cmd>OtherSplit<CR>",
        desc = "Open alternative file in split",
      },
    },
    config = function()
      require("other-nvim").setup({
        showMissingFiles = true,
        mappings = {
          {
            context = "test",
            pattern = "(.*).ts$",
            target = "%1.spec.ts",
          },
          {
            context = "implementation",
            pattern = "(.*).spec.ts$",
            target = "%1.ts",
          },
          {
            context = "test",
            pattern = "(.*).vue$",
            target = "%1.spec.ts",
          },
          {
            context = "implementation",
            pattern = "(.*).spec.ts$",
            target = "%1.vue",
          },
        },
      })
    end,
  },
  -- trouble
  {
    "folke/trouble.nvim",
    init = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        -- enable delete for trouble diagnostics
        pattern = "Trouble",
        callback = function(event)
          if require("trouble.config").options.mode ~= "telescope" then
            return
          end

          local function delete()
            local folds = require("trouble.folds")
            local telescope = require("trouble.providers.telescope")

            local ord = { "" } -- { filename, ... }
            local files = { [""] = { 1, 1, 0 } } -- { [filename] = { start, end, start_index } }
            for i, result in ipairs(telescope.results) do
              if files[result.filename] == nil then
                local next = files[ord[#ord]][2] + 1
                files[result.filename] = { next, next, i }
                table.insert(ord, result.filename)
              end
              if not folds.is_folded(result.filename) then
                files[result.filename][2] = files[result.filename][2] + 1
              end
            end

            local line = unpack(vim.api.nvim_win_get_cursor(0))
            for i, id in ipairs(ord) do
              if line == files[id][1] then -- Group
                local next = ord[i + 1]
                for _ = files[id][3], next and files[next][3] - 1 or #telescope.results do
                  table.remove(telescope.results, files[id][3])
                end
                break
              elseif line <= files[id][2] then -- Item
                table.remove(telescope.results, files[id][3] + (line - files[id][1]) - 1)
                break
              end
            end

            if #telescope.results == 0 then
              require("trouble").close()
            else
              require("trouble").refresh({ provider = "telescope", auto = false })
            end
          end

          vim.keymap.set("n", "dd", delete, { buffer = event.buf })
        end,
      })
    end,
  },
  -- git integration
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>gg",
        function()
          require("neogit").open()
        end,
        desc = "neogit menu",
      },
    },
    config = true,
  },
}
