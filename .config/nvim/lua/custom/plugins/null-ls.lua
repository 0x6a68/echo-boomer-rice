local null_ls = require "null-ls"
local b = null_ls.builtins
local function has_eslint_configured(utils)
   return utils.root_has_file ".eslintrc.js"
end
local sources = {
   b.code_actions.gitsigns,
   b.code_actions.gitrebase,
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
   b.code_actions.eslint_d.with { condition = has_eslint_configured },
   b.diagnostics.eslint_d.with { condition = has_eslint_configured },
   b.formatting.eslint_d.with { condition = has_eslint_configured },
   b.formatting.prettier_d_slim.with {
      filetype = { "toml", "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql" },
   },
   -- b.formatting.prettier_d_slim.with {
   --    condition = function()
   --       return null_ls.get_source { name = "eslint_d", method = null_ls.methods.FORMATTING } == 0
   --    end,
   -- },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
      -- format on save
      on_attach = function(client, bufnr)
         if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
               group = augroup,
               buffer = bufnr,
               callback = function()
                  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                  vim.lsp.buf.formatting_sync()
               end,
            })
         end
      end,
   }
end

return M
