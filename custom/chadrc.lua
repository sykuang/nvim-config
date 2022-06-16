local M = {}

-- local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
M.plugins = {
   user = userPlugins,
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
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
         current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      },
   },
}

M.mappings = require "custom.mappings"

return M
