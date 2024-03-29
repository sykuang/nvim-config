local M = {}

M.telescope = {
  n = {
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "find media" },
    ["<leader>fg"] = { "<cmd> Telescope current_buffer_fuzzy_find<CR>", "Fuzzy find in current buffer" },
    ["<leader>ss"] = { "<cmd> Telescope spell_suggest<CR>", "Lists spelling suggestions" },
    ["<leader>ks"] = { "<cmd> Telescope keymaps<CR>", "Lists normal mode keymappings" },
    ["ce"] = { "<cmd> Telescope lsp_incoming_calls<CR>", "Lists LSP incoming calls for word under the cursor" },
    ["cr"] = { "<cmd> Telescope lsp_outgoing_calls<CR>", "Lists LSP outgoing calls for word under the cursor" },
    ["gd"] = { "<cmd> Telescope lsp_definitions<CR>", "Goto the definition of the word under the cursor" },
    ["gr"] = { "<cmd> Telescope lsp_references<CR>", "Lists LSP references for word under the cursor" },
    ["<leader>wb"] = {
      "<cmd> Telescope lsp_workspace_symbols<CR>",
      "Lists LSP document symbols in the current workspace",
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gb"] = { "<cmd> Gitsigns toggle_current_line_blame<CR>", "git blame current line" },
    ["]c"] = { "<cmd> Gitsigns next_hunk <CR>", "next git hunk" },
    ["[c"] = { "<cmd> Gitsigns prev_hunk <CR>", "previoues git hunk" },
  },
}

M.neoclip = {
  n = {
    ["<leader>pb"] = {
      ":lua require('telescope').load_extension('neoclip')<CR>:Telescope neoclip<CR>",
      "show neoclip board",
    },
  },
}

M.lspconfig = {
  plugin = false,
  v = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "range formatting",
    },
  },
  n = {
    ["gw"] = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "List worksapce symbols" },
    ["gs"] = { ":ClangdSwitchSourceHeader<CR>", "Switch Source/Header" },
  },
}

M.misc = {
  n = {
    ["<leader>ct"] = {
      "<cmd>lua require('custom.configs.clipboardToggle').Toggle()<CR>",
      "Toggle buffer to clipboard",
    },
    ["<leader>i"] = { ":IndentBlanklineToggle<CR>", "Toggle Indent blank lines" },
    ["<leader>sp"] = { ":set spell!<CR>", "Toggle spell checking" },
    ["<leader>lz"] = {
      function()
        require("nvterm.terminal").send("lazygit", "vertical")
      end,
      "nvterm lazygit",
    },
    -- ["<leader>fm"] = { ":Format<CR>", "formatting" },
  },
  v = {
    -- ["<leader>fm"] = { ":'<,'>Format<CR>", "range formatting" },
  },
}

M.SymbolsOutline = {
  n = {
    ["<leader>tb"] = { ":SymbolsOutline<CR>", "Toggle Symbol outline" },
  },
}
if vim.loop.os_uname().sysname == "Windows_NT" then
  M.Windows_NT = {
    n = {
      ["<C-z>"] = { "<nop>", "NOP" },
    },
    v = {
      ["<C-z>"] = { "<nop>", "NOP" },
    },
  }
end
return M
