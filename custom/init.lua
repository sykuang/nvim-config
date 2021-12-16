-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

-- hooks.add("install_plugins", function(use)
--    use {
--       "max397574/better-escape.nvim",
--       event = "InsertEnter",
--    }
-- end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
--

hooks.add("install_plugins", function(use)
   use {
      "ethanholz/nvim-lastplace",
      -- require'custom.plugins.lastplace'
      config = function()
         require("custom.plugins.lastplace").setup()
      end,
   }

   use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   }

   use {
      "williamboman/nvim-lsp-installer",
   }

   use {
      "liuchengxu/vista.vim",
   }

   use {
      "bogado/file-line",
   }

   use {
     "nathom/filetype.nvim",
     config = function()
         require("custom.plugins.filetype").setup()
      end,
   }

   use {
      "Pocco81/HighStr.nvim",
      config = function()
         require("custom.plugins.highstr").setup()
      end,
   }

   use {
     "bfredl/nvim-miniyank"
   }
end)

hooks.add("setup_mappings", function(map)
   map("n", "<leader>tb", ":Vista<CR>", opt)
   map("n", "<leader>gb", ":lua require'gitsigns'.blame_line()<CR>", opt)
   map("v", "<leader>m", ":<c-u>HSHighlight 1<CR>", opt)
end)

-- FIXME: Using lua to set keymap
vim.cmd([[
  cnoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Right> pumvisible() ? "\<Down>" : "\<Right>"
  cnoremap <expr> <Left> pumvisible() ? "\<Up>" : "\<Left>"
  map p <Plug>(miniyank-autoput)
  map P <Plug>(miniyank-autoPut)
  map <leader>p <Plug>(miniyank-startput)
  map <leader>P <Plug>(miniyank-startPut)
  map <leader>n <Plug>(miniyank-cycle)
  map <leader>N <Plug>(miniyank-cycleback)
]])
