local overrides = require "custom.plugins.overrides"
return {
  ----------------------------------------- default plugins ------------------------------------------
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },
  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },
  --------------------------------------------- custom plugins ----------------------------------------------
  ["ethanholz/nvim-lastplace"] = {
    config = function()
      require("custom.plugins.lastplace").setup()
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["bogado/file-line"] = {},
  ["nathom/filetype.nvim"] = {
    config = function()
      require("custom.plugins.filetype").setup()
    end,
  },
  ["AckslD/nvim-neoclip.lua"] = {
    opt = false,
    requires = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("custom.plugins.neoclip").setup()
    end,
  },
  ["simrat39/symbols-outline.nvim"] = {
    config = function()
      require("symbols-outline").setup {}
    end,
  },
  ["chooh/brightscript.vim"] = {},
  ["kyazdani42/nvim-tree.lua"] = {
    event = "BufWinEnter",
  },
  ["lewis6991/spellsitter.nvim"] = {
    config = function()
      require("spellsitter").setup()
    end,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run="cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  ["ntpeters/vim-better-whitespace"] = {
  },
}
