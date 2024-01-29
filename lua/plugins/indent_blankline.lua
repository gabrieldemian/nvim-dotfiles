local highlight = {
	"lavender",
}

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	dependencies = {
		"catppuccin/nvim",
	},
	config = function()
		vim.g.rainbow_delimiters = { highlight = highlight }
		local hooks = require("ibl.hooks")
		local palette = require("catppuccin.palettes").get_palette("mocha")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "lavender", { fg = palette.overlay0 })
		end)
		require("ibl").setup({
			enabled = true,
			scope = {
				show_start = false,
				show_end = false,
				highlight = highlight,
			},
			whitespace = {
				highlight = highlight,
			},
		})
	end,
	-- 	scope = {
	-- 		scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
	-- 		colored_indent_levels = false,
	-- 	},
}
