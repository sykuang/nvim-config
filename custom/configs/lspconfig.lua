local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
  return
end
local function is_windows()
  return vim.loop.os_uname().version:match "Windows"
end
-- lspservers with default config
local servers =
  { "clangd", "yamlls", "pylsp", "sourcery", "bashls", "jsonls", "dockerls", "grammarly", "powershell_es" }
for _, lsp in ipairs(servers) do
  if lsp == "pylsp" then
    local cmd
    if is_windows() then
      cmd = { "pylsp.cmd" }
    else
      cmd = { "pylsp" }
    end
    lspconfig[lsp].setup {
      cmd = cmd,
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { "W391", "E203", "W503" },
              maxLineLength = 88,
            },
          },
        },
      },
    }
  elseif lsp == "sourcery" then
    local cmd
    if is_windows() then
      cmd = { "sourcery.cmd", "lsp" }
    else
      cmd = { "sourcery", "lsp" }
    end
    lspconfig[lsp].setup {
      cmd = cmd,
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        editor_version = "vim",
        extension_version = "vim.lsp",
      },
    }
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
