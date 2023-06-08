local overrides = require "custom.configs.overrides"
local plugins = {
  ----------------------------------------- default plugin ------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    init = function()
      if vim.loop.os_uname().version:match "Windows" then
        table.insert(overrides.mason.ensure_installed, "powershell-editor-services")
      end
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  { "lewis6991/gitsigns.nvim", opts = overrides.gitsigns },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "nvim-telescope/telescope.nvim", opts = overrides.telescope },
  { "folke/which-key.nvim", enabled = true },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    -- Force set zsh as bash even it's bad for zsh.
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
      local ft = require "Comment.ft"
      ft.set("proj", ft.get "xml")
    end,
  },
  --------------------------------------------- custom plugins ----------------------------------------------
  { "ethanholz/nvim-lastplace", config = true, lazy = false },
  -- {
  --   "mhartington/formatter.nvim",
  --   config = function()
  --     require("custom.configs.formatter").setup()
  --   end,
  --   cmd = "Format",
  -- },
  { "bogado/file-line", lazy = false },
  -- {
  --   "nathom/filetype.nvim",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.filetype"
  --   end,
  -- },
  {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require "custom.configs.neoclip"
    end,
  },
  { "simrat39/symbols-outline.nvim", config = true, cmd = "SymbolsOutline" },
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
      require "custom.configs.guess-indent"
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
