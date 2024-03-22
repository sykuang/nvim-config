require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- telescope
map("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", { desc = "find media" })
map("n", "<leader>fg", "<cmd> Telescope current_buffer_fuzzy_find<CR>", { desc = " Fuzzy find in current buffer" })
map("n", "<leader>ss", "<cmd> Telescope spell_suggest<CR>", { desc = "Lists spelling suggestions" })
map("n", "<leader>ks", "<cmd> Telescope keymaps<CR>", { desc = "Lists normal mode keymappings" })
map(
  "n",
  "ce",
  "<cmd> Telescope lsp_incoming_calls<CR>",
  { desc = "Lists LSP incoming calls for word under the cursor" }
)
map(
  "n",
  "cr",
  "<cmd> Telescope lsp_outgoing_calls<CR>",
  { desc = "Lists LSP outgoing calls for word under the cursor" }
)
map("n", "gd", "<cmd> Telescope lsp_definitions<CR>", { desc = "Goto the definition of the word under the cursor" })
map("n", "gr", "<cmd> Telescope lsp_references<CR>", { desc = "Lists LSP references for word under the cursor" })
map(
  "n",
  "<leader>wb",
  "<cmd> Telescope lsp_workspace_symbols<CR>",
  { desc = "Lists LSP document symbols in the current workspace" }
)
-- gitsigns
map("n", "<leader>gb", "<cmd> Gitsigns toggle_current_line_blame<CR>", { desc = "git blame current line" })
map("n", "]c", "<cmd> Gitsigns next_hunk <CR>", { desc = "next git hunk" })
map("n", "[c", "<cmd> Gitsigns prev_hunk <CR>", { desc = "previoues git hunk" })
map(
  "n",
  "<leader>pb",
  ":lua require('telescope'}).load_extension('neoclip')<CR>:Telescope neoclip<CR>",
  { desc = "show neoclip board" }
)
-- lspconfig
map("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol(})<CR>", { desc = "List worksapce symbols" })
map("n", "gs", ":ClangdSwitchSourceHeader<CR>", { desc = "Switch Source/Header" })
map("v", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { desc = "range formatting" })
-- misc
map(
  "n",
  "<leader>ct",
  "<cmd>lua require('custom.configs.clipboardToggle'}).Toggle()<CR>",
  { desc = "Toggle buffer to clipboard" }
)
map("n", "<leader>i", ":IndentBlanklineToggle<CR>", { desc = "Toggle Indent blank lines" })
map("n", "<leader>sp", ":set spell!<CR>", { desc = "Toggle spell checking" })
-- map({ "n", "i", "v" }) "<C-s>", "<cmd> w <cr>")
-- Windows specific mappings
if vim.loop.os_uname().sysname == "Windows_NT" then
  map("n", "<C-z>", "<nop>", { desc = "Disable Windows C-z" })
  map("v", "<C-z>", "<nop>", { desc = "Disable Windows C-z" })
end

