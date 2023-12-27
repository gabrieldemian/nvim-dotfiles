local status, saga = pcall(require, "lspsaga")
if not status then
	return
end
local opts = { noremap = true, silent = true }

saga.setup({
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
})

-- code action
Map({ "n", "v" }, "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)

-- diagnostic
Map("n", "<leader>bf", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
Map("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
Map("n", "<leader>d", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- definition
Map("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
Map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
Map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
Map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)

-- hover
Map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- helpers
Map("i", "<C-k>", vim.lsp.buf.signature_help, opts)
Map("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)
-- <C-t> to jump back
Map("n", "gh", "<cmd>Lspsaga finder<CR>", opts)
