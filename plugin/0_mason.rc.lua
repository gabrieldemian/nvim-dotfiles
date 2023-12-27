local status, mason = pcall(require, "mason")
if not status then
	return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

lspconfig.setup({
	automatic_installation = true,
	ensure_installed = { "lua_ls", "rust_analyzer" },
})

-- lspconfig.setup_handlers({})