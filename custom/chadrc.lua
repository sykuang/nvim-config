local M = {}

-- local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
M.plugins = {
  user = userPlugins,
  override = {
    ["lukas-reineke/indent-blankline.nvim"] = {
      show_current_context = true,
      show_current_context_start = true,
    },
    ["lewis6991/gitsigns.nvim"] = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<abbrev_sha> <author>, <author_time:%Y-%m-%d> - <summary>",
    },
    ["williamboman/mason.nvim"] = {
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
      },
    },
  },
  remove = {
    "NvChad/nvim-colorizer.lua",
  },
}

M.mappings = require "custom.mappings"

return M
