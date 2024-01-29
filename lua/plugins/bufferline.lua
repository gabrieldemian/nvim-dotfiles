return {
	"akinsho/nvim-bufferline.lua",
	opts = {
		diagnostics = "nvim-lsp",
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
		{ "<C-p>", "<Cmd>BufferLinePick<CR>" },
		{ "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>" },
		{ "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>" },
		{ "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>" },
		{ "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>" },
	},
}
