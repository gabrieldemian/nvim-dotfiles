local opts = { noremap = true, silent = true }

return {
	"neovim/nvim-lspconfig",
  event = "VeryLazy",
	-- dependencies = { "folke/neodev.nvim" },
  dependencies = {
      -- { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
	config = function()
		-- local nvim_lsp = require("lspconfig")
		local protocol = require("vim.lsp.protocol")
		local lsp = vim.lsp
		local handlers = lsp.handlers
		local pop_opts = { border = "rounded", max_width = 80 }

		handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
		handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		})

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			--Enable completion triggered by <c-x><c-o>
			--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
			--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			-- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
			-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
			buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			-- map('n', 'K', vim.lsp.buf.hover, opts)
		end

		protocol.CompletionItemKind = {
			"", -- Text
			"", -- Method
			"", -- Function
			"", -- Constructor
			"", -- Field
			"", -- Variable
			"", -- Class
			"ﰮ", -- Interface
			"", -- Module
			"", -- Property
			"", -- Unit
			"", -- Value
			"", -- Enum
			"", -- Keyword
			"﬌", -- Snippet
			"", -- Color
			"", -- File
			"", -- Reference
			"", -- Folder
			"", -- EnumMember
			"", -- Constant
			"", -- Struct
			"", -- Event
			"ﬦ", -- Operator
			"", -- TypeParameter
		}

		-- Set up completion using nvim_cmp with LSP source
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- nvim_lsp.flow.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- })
		--
		-- nvim_lsp.tsserver.setup({
		-- 	on_attach = on_attach,
		-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		-- 	cmd = { "typescript-language-server", "--stdio" },
		-- 	capabilities = capabilities,
		-- })
		--
		-- nvim_lsp.sourcekit.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- })
		--
		-- nvim_lsp.lua_ls.setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = function(client, bufnr)
		-- 		on_attach(client, bufnr)
		-- 		-- enable_format_on_save(client, bufnr)
		-- 	end,
		-- 	settings = {
		-- 		Lua = {
		-- 			diagnostics = {
		-- 				-- Get the language server to recognize the `vim` global
		-- 				globals = { "vim" },
		-- 			},
		-- 			workspace = {
		-- 				-- Make the server aware of Neovim runtime files
		-- 				library = vim.api.nvim_get_runtime_file("", true),
		-- 				checkThirdParty = false,
		-- 			},
		-- 		},
		-- 	},
		-- })
		--
		-- nvim_lsp.tailwindcss.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- })
		--
		-- nvim_lsp.cssls.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- })
		--
		-- nvim_lsp.astro.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- })

		local rt = require("rust-tools")
		HOME_PATH = os.getenv("HOME") .. "/"
		MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"
		local codelldb_path = MASON_PATH .. "codelldb/extension/adapter/codelldb"
		local liblldb_path = MASON_PATH .. "codelldb/extension/lldb/lib/liblldb.so"

		rt.setup({
			tools = {
				runnables = {
					use_telescope = true,
				},
				hover_actions = {
					auto_focus = true,
				},
				inlay_hints = {
					auto = true,
					show_parameter_hints = true,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
			},
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					rt.hover_actions.auto_focus = true
					Map("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Hover actions
					Map("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					Map("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
					rustfmt = {
						extraArgs = { "+nightly" },
					},
					cargo = {
						loadOutDirsFromCheck = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		})

		-- Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
			},
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = false,
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
