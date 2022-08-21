local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspservers with default config
local servers = { "clangd", "yamlls", "pylsp", "sourcery" }

lspconfig.sourcery.setup {}
lspconfig.pylsp.setup {}
for _, lsp in ipairs(servers) do
  if lsp == "pylsp" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { "W391" },
              maxLineLength = 88,
            },
          },
        },
      },
    }
  elseif lsp == "sourcery" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        token = "user_C0NHmzz9hO729bd7WcuaMdmqwDUQWsR6PDHDfYfJyRCqZd4nRGb05sr8ZcQ",
        editor_version = "vim",
        extension_version = "vim.lsp",
      },
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
