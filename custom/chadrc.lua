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
   },
}

M.mappings = require "custom.mappings"

return M
