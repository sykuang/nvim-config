-- map("v", "<leader>m", ":<c-u>HSHighlight 1<CR>", opt)
vim.cmd [[
  cnoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Right> pumvisible() ? "\<Down>" : "\<Right>"
  cnoremap <expr> <Left> pumvisible() ? "\<Up>" : "\<Left>"
]]

local M = {}

M.telescope = {
   n = {
      ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "  find media" },
      ["<leader>fg"] = { ":Telescope current_buffer_fuzzy_find<CR>", "� Fuzzy find in current buffer" },
   },
}

M.gitsigns = {
   n = {
      ["<leader>gb"] = { ":lua require'gitsigns'.blame_line() <CR>", " git blame current line" },
      ["]c"] = { "<cmd> Gitsigns next_hunk <CR>", " next git hunk" },
      ["[c"] = { "<cmd> Gitsigns prev_hunk <CR>", " previoues git hunk" },
   },
}

M.neoclip = {
   n = {
      ["<leader>pb"] = { ":lua require('telescope').extensions.neoclip.default()<CR>", "show neoclip board" },
   },
}

M.lspconfig = {
   v = {
      ["<leader>fm"] = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", " range formatting" },
   },
}

M.misc = {
   n = {
      ["<leader>ct"] = {
         "<cmd>lua require('custom.plugins.clipboardToggle').Toggle()<CR>",
         "Toggle buffer to clipboard",
      },
      ["<leader>i"] = { ":IndentBlanklineToggle<CR>", "Toggle Indent blank lines" },
   },
}

M.vista = {
   n = {
      ["<leader>tb"] = { ":Vista<CR>", "Toggle Symbol list" },
   },
}

return M
