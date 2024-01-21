return {
	"akinsho/nvim-bufferline.lua",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
		},
	},
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>" },
	},
}
