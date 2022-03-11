local M = {}

-- local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"

-- M.ui = {
--   theme = "nord"
-- }

-- NvChad included plugin options & overrides
M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {
      telescope = "custom.plugins.telescope",
   },
   install = userPlugins,
}

M.mappings = {
   plugins = {
      telescope = {
         git_commits = "<leader>gl",
      },
   },
}
M.options = {
   mouse = "",
}

return M
