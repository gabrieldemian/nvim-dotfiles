local map = vim.keymap.set

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

map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>gs", vim.cmd.Git)

-- keep cursor in place
map("n", "J", "mzJ`z")
map("x", "<leader>p", '"_dP')

-- Copy to clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

map('n', 'x', '"_x')

-- Format
map("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { silent = true })
