local map = require("core.utils").map

map("n", "<leader>tb", ":Vista<CR>", opt)
map("n", "<leader>gb", ":lua require'gitsigns'.blame_line()<CR>", opt)
map("v", "<leader>m", ":<c-u>HSHighlight 1<CR>", opt)
map("n", "<leader>ct", "<cmd>lua require('custom.plugins.clipboardToggle').Toggle()<CR>", opt)
map("n", "<leader>p", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", opt)
map("n", "<leader>i", ":IndentBlanklineToggle<CR>", opt)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
vim.cmd [[
  cnoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Right> pumvisible() ? "\<Down>" : "\<Right>"
  cnoremap <expr> <Left> pumvisible() ? "\<Up>" : "\<Left>"
]]
