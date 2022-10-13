local M = {}
M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- shell
    "shfmt",
    "shellcheck",
    -- C/C++
    "clangd",
    -- python
    "sourcery",
    "python-lsp-server",
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
    -- grammarly
    "grammarly-languageserver",
    -- spell
    "codespell",
  },
}

M.gitsigns = {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<abbrev_sha> <author>, <author_time:%Y-%m-%d> - <summary>",
}

M.blankline = {
  show_current_context = true,
  show_current_context_start = true,
}
M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "json",
    "toml",
    "markdown",
    "c",
    "bash",
    "lua",
  },
}
return M
