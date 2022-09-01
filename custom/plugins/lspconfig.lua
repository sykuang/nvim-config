local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspservers with default config
local servers = { "clangd", "yamlls", "pylsp", "sourcery", "bashls" }
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
    local sourcery_token = os.getenv "SOURCERY_TOKEN"
    if sourcery_token ~= "" then
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          token = sourcery_token,
          editor_version = "vim",
          extension_version = "vim.lsp",
        },
      }
    else
      print "Please add SOURCERY_TOKEN to Enviroment for using sourcery."
    end
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
