local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_ai = "[AI]",
	path = "[Path]",
}

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
	{ "folke/which-key.nvim", lazy = true },
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"nvim-lua/plenary.nvim",
	{
		"Wansmer/treesj",
		keys = {
			{ "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
		},
		opts = { use_default_keymaps = false, max_join_length = 150 },
	},
	"folke/neodev.nvim",
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = { "lua_ls", "rust_analyzer" },
		},
	},
	"L3MON4D3/LuaSnip",
	"simrat39/rust-tools.nvim",
	{
		"kyazdani42/nvim-web-devicons",
		opts = {
			default = false,
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},
	"windwp/nvim-ts-autotag",
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			"*",
		},
	},
	{
		"folke/zen-mode.nvim",
		keys = { "<C-w>o" },
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "lewis6991/gitsigns.nvim", lazy = true },
	{ "mbbill/undotree", lazy = true },
	{ "tpope/vim-fugitive", lazy = true,

    opts = {
  keymaps = {
    -- Open git blame window
    blame = "<leader>gb",
    -- Open file/folder in git repository
    browse = "<leader>go",
  }
    }
  },
	{ "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
	},
	{ "RRethy/vim-illuminate",
    -- opts = {
    --   providers = {
    --     "lsp",
    --     "treesitter",
    --     "regex",
    --   },
    --   delay = 100,
    --   filetype_overrides = {},
    --   filetypes_denylist = {
    --     "dirbuf",
    --     "dirvish",
    --     "fugitive",
    --   },
    -- }
  },
}
