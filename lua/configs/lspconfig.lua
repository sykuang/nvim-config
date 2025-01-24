-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local function is_windows()
	return vim.loop.os_uname().version:match("Windows")
end
-- lspservers with default config
local servers = {
	"clangd",
	"yamlls",
	"pylsp",
	"bashls",
	"jsonls",
	"dockerls",
	"ts_ls",
}
if is_windows() then
  servers.insert("powershell_es")
end
local nvlsp = require "nvchad.configs.lspconfig"
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end
