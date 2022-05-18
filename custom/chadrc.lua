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
}

M.mappings = require "custom.mappings"

return M
