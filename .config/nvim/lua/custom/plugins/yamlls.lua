local M = {}

M.setup = function(attach, capabilities)
   return {
      on_attach = attach,
      capabilities = capabilities,
      settings = {
         yaml = {
            trace = {
               server = "verbose",
            },
            schemaDownload = { enable = true },
            validate = true,
         },
      },
   }
end

return M
