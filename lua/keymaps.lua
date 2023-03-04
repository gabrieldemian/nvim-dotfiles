function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local builtin = require("telescope.builtin")
local telescope = require("telescope")

-- Telescope Keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>fb", telescope.extensions.file_browser.file_browser, { noremap = true })

-- Leap Highlight
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
vim.api.nvim_set_hl(0, "LeapMatch", {
	-- For light themes, set to 'black' or similar.
	fg = "white",
	bold = true,
	nocombine = true,
})
-- Specify some nicer shades instead of the default "red" and "blue".
vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
	fg = "yellow",
	bold = true,
	nocombine = true,
})
vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
	fg = "pink",
})

-- Barbar
map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>")
map("n", "<Tab>", "<Cmd>BufferNext<CR>")
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
-- Pin/unpin buffer
map("n", "<leader>p", "<Cmd>BufferPin<CR>")
-- Close buffer
map("n", "<leader>xx", "<Cmd>BufferClose<CR>")

map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>gs", vim.cmd.Git)
