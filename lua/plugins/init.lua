return { ----------------------------------------- default plugin ------------------------------------------
  {
    "williamboman/mason.nvim",
    -- init = function()
    --   if vim.loop.os_uname().version:match "Windows" then
    --     table.insert(configs.mason.ensure_installed, "powershell-editor-services")
    --   end
    -- end,
    opts = {
      ensure_installed = { -- lua stuff
        "lua-language-server",
        "stylua", -- shell
        -- "shfmt",
        "shellcheck",
        "beautysh", -- C/C++
        "clangd", -- python
        "sourcery",
        "python-lsp-server",
        "black", -- bashls
        "bash-language-server", -- yaml css ...
        "prettierd",
        "yaml-language-server", -- json
        "json-lsp",
        "fixjson", -- Dockerfile
        "hadolint",
        "dockerfile-language-server", -- grammarly
        "grammarly-languageserver", -- spell
        "codespell", -- typescript
        "typescript-language-server",
      },
    },
  },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "lewis6991/gitsigns.nvim",
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<abbrev_sha> <author>, <author_time:%Y-%m-%d> - <summary>",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "rg", -- find command (defaults to `fd`)
      },
    },
    extensions_list = { "themes", "terms", "fzf" },
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "nvchad.configs.cmp"
      require "configs.cmp"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter", -- Force set zsh as bash even it's bad for zsh.
    opts = {
      ensure_installed = {
        "vim",
        "html",
        "toml",
        "markdown",
        "c",
        "cpp",
        "python",
        "rust",
        "bash",
        "lua",
        "typescript",
        "yaml",
        "javascript",
        "make",
        "cmake",
        "diff",
        "git_rebase",
        "gitattributes",
        "jsonc",
        "dockerfile",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
      local ft = require "Comment.ft"
      ft.set("proj", ft.get "xml")
    end,
  }, --------------------------------------------- plugins ----------------------------------------------
  {
    "ethanholz/nvim-lastplace",
    config = true,
    lazy = false,
  }, -- {
  --   "mhartington/formatter.nvim",
  --   config = function()
  --     require("configs.formatter").setup()
  --   end,
  --   cmd = "Format",
  -- },
  {
    "bogado/file-line",
    lazy = false,
  },
  {
    "nathom/filetype.nvim",
    lazy = false,
    config = function()
      require "configs.filetype"
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    dependencies = { { "nvim-telescope/telescope.nvim" } },
    config = function()
      require "configs.neoclip"
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = true,
    cmd = "SymbolsOutline",
  },
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
      require "configs.guess-indent"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require "configs.copilot"
    end,
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
    event = "InsertEnter",
  },
}
