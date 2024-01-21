local opts = { silent = true }

local function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end

return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		src = {
			cmp = {
				enabled = true,
			},
		},
		null_ls = {
			enabled = true,
			name = "crates.nvim",
		},
	},
	keys = {
		{
			"<leader>ct",
			"<silent> :lua require('crates').toggle()<cr>",
			opts,
		},
		{
			"<leader>cr",
			"<silent> :lua require('crates').reload()<cr>",
			opts,
		},
		{
			"<leader>cv",
			"<silent>:lua require('crates').show_versions_popup()<cr>",
			opts,
		},
		{
			"<leader>cf",
			"<silent>:lua require('crates').show_features_popup()<cr>",
			opts,
		},
		{
			"<leader>cd",
			"<silent>:lua require('crates').show_dependencies_popup()<cr>",
			opts,
		},
		{
			"<leader>cu",
			"<silent>:lua require('crates').update_crate()<cr>",
			opts,
		},
		{
			"<leader>cu",
			"<silent>:lua require('crates').update_crates()<cr>",
			opts,
			mode = { "v" },
		},
		{
			"<leader>ca",
			"<silent>:lua require('crates').update_all_crates()<cr>",
			opts,
		},
		{
			"<leader>cU",
			"<silent>:lua require('crates').upgrade_crate()<cr>",
			opts,
		},
		{
			"<leader>cU",
			"<silent>:lua require('crates').upgrade_crates()<cr>",
			opts,
			mode = { "v" },
		},
		{
			"<leader>cA",
			"<silent>:lua require('crates').upgrade_all_crates()<cr>",
			opts,
		},
		{
			"<leader>ce",
			"<silent>:lua require('crates').expand_plain_crate_to_inline_table()<cr>",
			opts,
		},
		{
			"<leader>cE",
			"<silent>:lua require('crates').extract_crate_into_table()<cr>",
			opts,
		},
		{
			"<leader>cH",
			"<silent>:lua require('crates').open_homepage()<cr>",
			opts,
		},
		{
			"<leader>cR",
			"<silent>:lua require('crates').open_repository()<cr>",
			opts,
		},
		{
			"<leader>cD",
			"<silent>:lua require('crates').open_documentation()<cr>",
			opts,
		},
		{
			"<leader>cC",
			"<silent>:lua require('crates').open_crates_io()<cr>",
			opts,
		},
		{
			"<leader>K",
			show_documentation,
			opts,
		},
	},
}
