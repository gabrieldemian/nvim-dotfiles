local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("onsails/lspkind-nvim") -- vscode-like pictograms

	-- cmp plugins
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-path") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-cmdline") -- Completion
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-emoji") -- nvim-cmp source for emojis
	use("FelipeLema/cmp-async-path") -- nvim-cmp source for async path
	--

	use("David-Kunz/gen.nvim")

	use("folke/neodev.nvim")
	use({ "neovim/nvim-lspconfig", requires = { "folke/neodev.nvim" } }) -- LSP
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use("L3MON4D3/LuaSnip")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("simrat39/rust-tools.nvim")

	use("kyazdani42/nvim-web-devicons") -- File icons
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use({
		"numToStr/Comment.nvim",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})
	use("norcalli/nvim-colorizer.lua")
	use("folke/zen-mode.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("akinsho/nvim-bufferline.lua")

	use("lewis6991/gitsigns.nvim")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use("ggandor/leap.nvim")

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})

	use("RRethy/vim-illuminate")

	use({
		"saecki/crates.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use("glepnir/lspsaga.nvim") -- LSP UIs
end)
