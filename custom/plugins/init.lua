return {
   {
      "ethanholz/nvim-lastplace",
      config = function()
         require("nvim-lastplace").setup {
            lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
            lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
            lastplace_open_folds = true,
         }
      end,
   },
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   {
      "williamboman/nvim-lsp-installer",
   },
   {
      "liuchengxu/vista.vim",
   },
   -- {
   --    "bogado/file-line",
   -- },
   {
      "nathom/filetype.nvim",
      config = function()
         require("custom.plugins.filetype").setup()
      end,
   },
   {
      "Pocco81/HighStr.nvim",
      config = function()
         require("custom.plugins.highstr").setup()
      end,
   },
   {
      "AckslD/nvim-neoclip.lua",
      requires = {
         { "tami5/sqlite.lua", module = "sqlite" },
      },
      config = function()
         require("custom.plugins.neoclip").setup()
      end,
   },
   {
      "folke/which-key.nvim",
      config = function()
         require("which-key").setup()
      end,
   },
}
