return {
	"mrcjkb/rustaceanvim",
	version = "^4",
	ft = { "rust" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
		{
			"lvimuser/lsp-inlayhints.nvim",
			opts = {},
		},
	},
	config = function()
		vim.g.rustaceanvim = {
			-- inlay_hints = {
			-- 	highlight = "NonText",
			-- },
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
			server = {
				on_attach = function(client, bufnr)
					require("lsp-inlayhints").on_attach(client, bufnr)
					Map("n", "<leader>h", function()
						require("lsp-inlayhints").toggle()
					end)
				end,
				settings = {
					-- ["rust-analyzer"] = {
					-- 	inlay_hints = {
					-- 		auto = true,
					-- 	},
					-- },
				},
			},
		}
	end,
}
