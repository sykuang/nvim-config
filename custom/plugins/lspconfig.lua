local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspservers with default config
local servers = { "clangd", "yamlls", "pylsp", "sourcery", "bashls", "jsonls" }
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
  elseif lsp == "clangd" then
    local clangd_capabilities = capabilities
    clangd_capabilities.offsetEncoding = { "utf-16" }
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = clangd_capabilities,
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
