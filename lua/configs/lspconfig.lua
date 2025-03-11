-- load defaults i.e lua_lsp
local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

local function is_windows()
    return vim.loop.os_uname().version:match("Windows")
end
-- lspservers with default config
local servers = {"clangd", "yamlls", "pylsp", "jsonls", "dockerls", "ts_ls"}
if is_windows() then
    table.insert(servers, "powershell_es")
    table.insert(servers, "csharp_ls")
else
    table.insert(servers, "bashls")
end
for _, lsp in ipairs(servers) do
    if lsp == "powershell_es" then
        lspconfig[lsp].setup({
            on_attach = nvlsp.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
            cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command',
                   [[& "$HOME\.PSES\PowerShellEditorServices\Start-EditorServices.ps1"]]}
        })
    else
        lspconfig[lsp].setup({
            on_attach = nvlsp.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities
        })
    end
end
