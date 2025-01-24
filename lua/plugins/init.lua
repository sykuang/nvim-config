local plugins = {
	----------------------------------------- default plugin ------------------------------------------

	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},
	-- {
	--   "lukas-reineke/indent-blankline.nvim",
	--   opts = "configs.overrides.blankline",
	-- },
	{
		"lewis6991/gitsigns.nvim",
		opts = function(_, opts)
			opts.current_line_blame = true
			opts.current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 500,
				ignore_whitespace = false,
			}
			opts.current_line_blame_formatter = "<abbrev_sha> <author>, <author_time:%Y-%m-%d> - <summary>"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		-- dependencies = {
		--   {
		--     "jose-elias-alvarez/null-ls.nvim",
		--     config = function()
		--       require "configs.null-ls"
		--     end,
		--   },
		-- },
		config = function()
			require("configs.lspconfig")
		end,
	},
	{ "nvim-telescope/telescope.nvim", opts = "configs.overrides.telescope" },
	{ "folke/which-key.nvim", enabled = true },
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			}
			local cmp = require("cmp")
			opts.mapping = {
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = function(callback)
					callback()
				end,

				["<S-Tab>"] = function(callback)
					callback()
				end,
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			local sources = require("configs.overrides").treesitter.ensure_installed
			for _, vil in ipairs(sources) do
				table.insert(opts.ensure_installed, vil)
			end
		end,
		-- Force set zsh as bash even it's bad for zsh.
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
			local ft = require("Comment.ft")
			ft.set("proj", ft.get("xml"))
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
			require("configs.neoclip")
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
			require("configs.guess-indent")
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("configs.copilot")
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
