return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- use {
	--  'lewis6991/impatient.nvim'
	-- }
	use({ "catppuccin/nvim", as = "catppuccin" })

	use({ "mbbill/undotree" })
	use({ "tpope/vim-fugitive" })

	-- Comments
	use({ "preservim/nerdcommenter" })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				debug = true,
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file({
								".eslintrc.js",
								".eslintrc.cjs",
								".eslintrc.yaml",
								".eslintrc.yml",
								".eslintrc.json",
							})
						end,
						filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
					}),
					null_ls.builtins.formatting.rustfmt,
					null_ls.builtins.formatting.rustywind,
					null_ls.builtins.diagnostics.eslint_d.with({
						filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
					}),
					null_ls.builtins.completion.spell,
				},
			})
		end,
	})

	use({
		"williamboman/mason.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("mason").setup({})
		end,
	})

	-- Post-install/update hook with neovim command
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- file browser
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	})
	use("neovim/nvim-lspconfig")
	use("simrat39/rust-tools.nvim")

	-- Tab
	use("nvim-tree/nvim-web-devicons")
	use({
		"romgrk/barbar.nvim",
		requires = "nvim-web-devicons",
		animations = false,
	})
	require("bufferline").setup({
		auto_hide = true,
	})

	-- Visualize lsp progress
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = false,
				map_cr = true,
				check_ts = true,
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	})

	-- Autocompletion framework
	use("hrsh7th/nvim-cmp")

	use({
		-- cmp LSP completion
		"hrsh7th/cmp-nvim-lsp",
		-- cmp Snippet completion
		"hrsh7th/cmp-vsnip",
		-- cmp Path completion
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		after = { "hrsh7th/nvim-cmp" },
		requires = { "hrsh7th/nvim-cmp" },
	})

	-- Debugging
	use("nvim-lua/plenary.nvim")
	use("mfussenegger/nvim-dap")

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
end)
