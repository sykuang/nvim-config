-- load defaults i.e lua_lsp
local nvlsp = require "nvchad.configs.lspconfig"

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
vim.lsp.enable(servers)
