return {
  {
    "nvim-cmp",
    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        cmd = { "CmpTabnineHub", "CmpTabnineHubUrl", "CmpTabninePrefetch" },
        init = function()
          vim.api.nvim_create_autocmd("BufReadPre", {
            pattern = "*.css,*.sass,*.html,*.js,*.jsx,*.ts,*.tsx",
            callback = function(ev)
              require("cmp_tabnine"):prefetch(ev.file)
            end,
          })
        end,
        config = function()
          local tabnine = require("cmp_tabnine.config")
          tabnine:setup({
            max_lines = 1000,
            max_num_results = 10,
            sort = true,
          })
        end,
        lazy = true,
        event = "InsertEnter",
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, { name = "cmp_tabnine", group_index = 2 })
    end,
  },
}
