local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspservers with default config
local servers = { "clangd", "pylsp", "yamlls" }

lspconfig.sourcery.setup {
  init_options = {
    token = "user_C0NHmzz9hO729bd7WcuaMdmqwDUQWsR6PDHDfYfJyRCqZd4nRGb05sr8ZcQ",
    editor_version = "vim",
    extension_version = "vim.lsp",
  },
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
