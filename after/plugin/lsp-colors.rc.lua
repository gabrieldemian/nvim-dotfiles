local status, colors = pcall(require, "lsp-colors")
if (not status) then return end

colors.setup {
  Error = "#f38ba8",
  Warning = "#f9e2af",
  Information = "#89b4fa",
  Hint = "#74c7ec"
}
