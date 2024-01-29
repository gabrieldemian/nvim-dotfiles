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

Map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- keep cursor in place
-- Map("n", "J", "mzJ`z")
Map("x", "<leader>p", '"_dP')

-- Copy to clipboard
Map("n", "<leader>y", '"+y')
Map("v", "<leader>y", '"+y')
Map("n", "<leader>Y", '"+Y')

Map("n", "x", '"_x')

-- Git (vim-fugitive)
Map("n", "<leader>gs", vim.cmd.Git)
-- stage current file, similar to `Git add %`
Map("n", "<leader>gw", vim.cmd.Gwrite)

-- remove current file on the next commit
Map("n", "<leader>rm", vim.cmd.Gremove)

-- Discard unstaged changes to the current file
Map("n", "<leader>rd", vim.cmd.Gread)

-- Git blame
Map("n", "<leader>gb", "<Cmd>G blame<CR>")
