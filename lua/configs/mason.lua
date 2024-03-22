M = {}
M.ensure_installed = { -- lua stuff
"lua-language-server", "stylua", -- shell
-- "shfmt",
"shellcheck", "beautysh", -- C/C++
"clangd", -- python
"sourcery", "python-lsp-server", "black", -- bashls
"bash-language-server", -- yaml css ...
"prettierd", "yaml-language-server", -- json
"json-lsp", "fixjson", -- Dockerfile
"hadolint", "dockerfile-language-server", -- grammarly
"grammarly-languageserver", -- spell
"codespell", -- typescript
"typescript-language-server"}
return M
