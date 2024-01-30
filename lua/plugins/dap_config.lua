return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		keys = {
			{ "<leader>dt", ":DapToggleBreakpoint<CR>" },
			{ "<leader>dx", ":DapTerminate<CR>" },
			{ "<leader>do", ":DapStepOver<CR>" },
			{ "<leader>di", ":DapStepInto<CR>" },
			{ "<leader>dc", ":DapContinue<CR>" },
		},
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				opts = { floating = { border = "rounded" } },
				config = function(_, opts)
					local dap, dapui = require("dap"), require("dapui")
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
					dapui.setup(opts)
				end,
			},
			{
				"rcarriga/cmp-dap",
				dependencies = { "nvim-cmp" },
				config = function()
					require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
						sources = {
							{ name = "dap" },
						},
					})
				end,
			},
		},
		config = function()
			local dap = require("dap")

			local ExecTypes = {
				TEST = "cargo build --tests -q --message-format=json",
				BIN = "cargo build -q --message-format=json",
			}

			local function runBuild(type)
				local lines = vim.fn.systemlist(type)
				local output = table.concat(lines, "\n")
				local filename = output:match('^.*"executable":"(.*)",.*\n.*,"success":true}$')

				if filename == nil then
					return error("failed to build cargo project")
				end

				return filename
			end

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.exepath("codelldb"), -- install `lldb` && use :Mason to install codelldb & cpptools
					args = { "--port", "${port}" },
				},
				name = "codelldb",
			}

			if vim.fn.has("win32") == 1 then
				dap.adapters.codelldb.executable.detached = false
			end

			dap.configurations.rust = {
				{
					name = "Debug Test",
					type = "codelldb",
					request = "launch",
					program = function()
						return runBuild(ExecTypes.TEST)
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					showDisassembly = "never",
				},
				{
					name = "Debug Bin",
					type = "codelldb",
					request = "launch",
					program = function()
						return runBuild(ExecTypes.BIN)
						-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					showDisassembly = "never",
				},
			}
		end,
	},
}
