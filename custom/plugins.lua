local overrides = require "custom.configs.overrides"
local plugins = {
  ----------------------------------------- default plugin ------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    init = function()
      if vim.loop.os_uname().sysname == "windows" then
        table.insert(overrides.mason.ensure_installed, "powershell-editor-services")
      end
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  { "lewis6991/gitsigns.nvim", override_options = overrides.gitsigns },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "nvim-telescope/telescope.nvim", override_options = overrides.telescope },
  { "folke/which-key.nvim", enabled = true },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  --------------------------------------------- custom plugins ----------------------------------------------
  { "ethanholz/nvim-lastplace", config = true, lazy = false },
  {
    "mhartington/formatter.nvim",
    config = function()
      require("custom.configs.formatter").setup()
    end,
    cmd = "Format",
  },
  { "bogado/file-line", lazy = false },
  {
    "nathom/filetype.nvim",
    config = function()
      require("custom.configs.filetype").setup()
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("custom.configs.neoclip").setup()
    end,
  },
  { "simrat39/symbols-outline.nvim", config = true },
  { "chooh/brightscript.vim" },
  {
    "lewis6991/spellsitter.nvim",
    config = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  { "ntpeters/vim-better-whitespace" },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("custom.configs.guess-indent").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require "custom.configs.copilot"
    end,
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = true,
    event = "InsertEnter",
  },
}
return plugins
