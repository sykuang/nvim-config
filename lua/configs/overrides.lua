local M = {}
M.mason = {
  ensure_installed = {
    -- lua stuff
    "codespell",
    "lua-language-server",
    "stylua",
    -- shell
    -- "shfmt",
    "shellcheck",
    "beautysh",
    -- C/C++
    "clangd",
    -- python
    "python-lsp-server",
    "black",
    -- bashls
    "bash-language-server",
    -- yaml css ...
    "prettierd",
    "yaml-language-server",
    -- json
    "json-lsp",
    "fixjson",
    -- Dockerfile
    "hadolint",
    "dockerfile-language-server",
    -- spell
    -- typescript
    "typescript-language-server",
  },
}

M.gitsigns = {

}

M.blankline = {
  show_current_context = true,
  show_current_context_start = true,
}
M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "toml",
    "markdown",
    "c",
    "cpp",
    "python",
    "rust",
    "bash",
    "lua",
    "typescript",
    "yaml",
    "javascript",
    "make",
    "cmake",
    "diff",
    "git_rebase",
    "gitattributes",
    "jsonc",
    "dockerfile",
  },
}
M.telescope = {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
  extensions_list = { "themes", "terms", "fzf" },
}
local cmp = require "cmp"
M.cmp = {
  -- preselect = cmp.PreselectMode.None,
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = function(callback)
      callback()
    end,

    ["<S-Tab>"] = function(callback)
      callback()
    end,
  },
}
return M
