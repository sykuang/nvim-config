local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "bashls", "html", "cssls", "clangd", "pylsp" }

   lspconfig.sourcery.setup {
      init_options = {
         token = "user__i6gczBllHakIGAswG_cGpine88dps__CvXsVUQY9kJRBe0pl1QJ4JjYZE8",
         editor_version = "vim",
         extension_version = "vim.lsp",
      },
   }
   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M
