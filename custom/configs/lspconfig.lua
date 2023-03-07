local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
  return
end

-- lspservers with default config
local servers =
  { "clangd", "yamlls", "pylsp", "sourcery", "bashls", "jsonls", "dockerls", "grammarly", "powershell_es" }
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
      print "Please add SOURCERY_TOKEN to Environment for using sourcery."
    end
  elseif lsp == "grammarly" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "markdown", "gitcommit" },
    }
  elseif lsp == "clangd" then
    local clangd_capabilities = capabilities
    clangd_capabilities.offsetEncoding = { "utf-16" }
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = clangd_capabilities,
    }
  elseif lsp == "powershell_es" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
      shell = "C:/Program Files/PowerShell/7/pwsh.exe",
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
