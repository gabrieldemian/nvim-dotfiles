local status, crates = pcall(require, "crates")
if not status then
	return
end

crates.setup({
	src = {
		cmp = {
			enabled = true,
		},
	},
	null_ls = {
		enabled = true,
		name = "crates.nvim",
	},
})

local opts = { silent = true }

Map("n", "<leader>ct", crates.toggle, opts)
Map("n", "<leader>cr", crates.reload, opts)

Map("n", "<leader>cv", crates.show_versions_popup, opts)
Map("n", "<leader>cf", crates.show_features_popup, opts)
Map("n", "<leader>cd", crates.show_dependencies_popup, opts)

Map("n", "<leader>cu", crates.update_crate, opts)
Map("v", "<leader>cu", crates.update_crates, opts)
Map("n", "<leader>ca", crates.update_all_crates, opts)
Map("n", "<leader>cU", crates.upgrade_crate, opts)
Map("v", "<leader>cU", crates.upgrade_crates, opts)
Map("n", "<leader>cA", crates.upgrade_all_crates, opts)

Map("n", "<leader>ce", crates.expand_plain_crate_to_inline_table, opts)
Map("n", "<leader>cE", crates.extract_crate_into_table, opts)

Map("n", "<leader>cH", crates.open_homepage, opts)
Map("n", "<leader>cR", crates.open_repository, opts)
Map("n", "<leader>cD", crates.open_documentation, opts)
Map("n", "<leader>cC", crates.open_crates_io, opts)

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

Map("n", "K", show_documentation, { silent = true })
