return {
  ["ethanholz/nvim-lastplace"] = {
    config = function()
      require("custom.plugins.lastplace").setup()
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["bogado/file-line"] = {},
  ["nathom/filetype.nvim"] = {
    config = function()
      require("custom.plugins.filetype").setup()
    end,
  },
  ["AckslD/nvim-neoclip.lua"] = {
    requires = {
      { "tami5/sqlite.lua", module = "sqlite" },
    },
    config = function()
      require("custom.plugins.neoclip").setup()
    end,
  },
  ["simrat39/symbols-outline.nvim"] = {},
  ["chooh/brightscript.vim"] = {},
  ["kyazdani42/nvim-tree.lua"] = {
    event = "BufWinEnter",
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["lewis6991/spellsitter.nvim"] = {
    config = function()
      require("spellsitter").setup()
    end,
  },
}
