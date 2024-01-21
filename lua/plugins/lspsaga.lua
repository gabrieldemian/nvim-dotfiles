local opts = { noremap = true, silent = true }

return {
	"nvimdev/lspsaga.nvim",
	opts = {
		lightbulb = {
			enable_in_insert = false,
			enable = false,
		},
		ui = {
			winblend = 10,
			border = "rounded",
			colors = {
				normal_bg = "#74c7ec",
			},
		},
	},
	keys = {
		{ "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts },
		{ "<leader>bf", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts },
		{ "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts },
		{ "<leader>d", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts },
		{ "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts },
		{ "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts },
		{ "gD", "<cmd>Lspsaga goto_definition<CR>", opts },
		{ "gd", "<cmd>Lspsaga peek_definition<CR>", opts },
		{ "K", "<cmd>Lspsaga hover_doc<CR>" },
		{ "<C-k>", vim.lsp.buf.signature_help, opts, mode = { "v" } },
		{ "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts },
		{ "gh", "<cmd>Lspsaga finder<CR>", opts },
	},
}
