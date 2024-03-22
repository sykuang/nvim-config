-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {"clangd", "yamlls", "pylsp", "sourcery", "bashls", "jsonls", "dockerls", "grammarly", "powershell_es",
                 "tsserver"}
-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities
    }
end

-- typescript
lspconfig.tsserver.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities
}
lspconfig.pylsp.setup {
    cmd = cmd,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {"W391", "E203", "W503"},
                    maxLineLength = 88
                }
            }
        }
    }
}
lspconfig.sourcery.setup {
    cmd = cmd,
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        editor_version = "vim",
        extension_version = "vim.lsp"
    }
}
lspconfig.grammarly.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"markdown", "gitcommit"}
}
local clangd_capabilities = capabilities
clangd_capabilities.offsetEncoding = {"utf-16"}
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = clangd_capabilities
}
lspconfig.powershell_es.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
    shell = "C:/Program Files/PowerShell/7/pwsh.exe"
}
