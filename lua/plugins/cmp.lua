return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"FelipeLema/cmp-async-path",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Add tab support
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					["<C-x>"] = cmp.mapping(
						cmp.mapping.complete({
							config = {
								sources = cmp.config.sources({
									{ name = "cmp_ai" },
								}),
							},
						}),
						{ "i" }
					),
				},
				-- Installed sources:
				sources = {
					{ name = "luasnip" },
					{ name = "async_path" }, -- file paths
					{ name = "nvim_lsp", keyword_length = 3 }, -- from language server
					{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
					{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
					{ name = "buffer", keyword_length = 2 }, -- source current buffer
					{ name = "emoji" },
				},
				window = {
					completion = cmp.config.window.bordered(),
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							-- ...
							return vim_item
						end,
					}),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = function(entry, vim_item)
						-- if you have lspkind installed, you can use it like
						-- in the following line:
						vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
						-- vim_item.menu = source_mapping[entry.source.name]
						if entry.source.name == "cmp_ai" then
							local detail = (entry.completion_item.labelDetails or {}).detail
							vim_item.kind = ""
							if detail and detail:find(".*%%.*") then
								vim_item.kind = vim_item.kind .. " " .. detail
							end

							if (entry.completion_item.data or {}).multiline then
								vim_item.kind = vim_item.kind .. " " .. "[ML]"
							end
						end
						local maxwidth = 80
						vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
						return vim_item
					end,
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
