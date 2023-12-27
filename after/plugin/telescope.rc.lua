local map = vim.keymap.set
local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-c>"] = fb_actions.create,
					["<C-p>"] = fb_actions.goto_parent_dir,
					["<C-w>"] = fb_actions.goto_cwd,
					["<C-r>"] = fb_actions.rename,
					["<C-d>"] = fb_actions.remove,
				},
				["n"] = {
					-- your custom normal mode mappings
					["c"] = fb_actions.create,
					["p"] = fb_actions.goto_parent_dir,
					["r"] = fb_actions.rename,
					["d"] = fb_actions.remove,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

map("n", "ff", function()
	builtin.find_files({
		no_ignore = false,
		hidden = false,
	})
end)
map("n", "fg", function()
	builtin.live_grep({
		previewer = true,
	})
end)
map("n", "\\\\", function()
	builtin.buffers({
		previewer = false,
	})
end)
map("n", "ft", function()
	builtin.help_tags({
		previewer = true,
	})
end)
map("n", "fd", function()
	builtin.diagnostics()
end)
map("n", "fb", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = true,
		hidden = true,
		grouped = false,
		previewer = true,
		initial_mode = "insert",
		layout_config = { height = 40 },
	})
end)
