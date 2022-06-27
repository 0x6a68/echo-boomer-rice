local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = {
      "html",
      "cssls",
      "bashls",
      "emmet_ls",
      -- "tsserver",
      "rust_analyzer",
      "clangd",
      "jsonls",
      "yamlls",
      "taplo",
      "elixirls",
   }

   for _, lsp in ipairs(servers) do
      if pcall(require, "custom.plugins." .. lsp) then
         require("custom.plugins." .. lsp).setup(attach, capabilities)
      else
         lspconfig[lsp].setup {
            on_attach = attach,
            capabilities = capabilities,
         }
      end
   end
end

return M
