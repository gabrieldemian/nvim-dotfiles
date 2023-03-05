local status, saga = pcall(require, "lspsaga")
if (not status) then return end
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

saga.setup({
  lightbulb = {
    enable_in_insert = false
  },
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#74c7ec'
    }
  }
})

-- code action
map({ "n", "v" }, "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)

-- diagnostic
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', '<leader>d', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)

-- definition
map("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
map('n', 'gD', '<Cmd>Lspsaga goto_definition<CR>', opts)
map('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts)

-- hover
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

-- helpers
map('i', '<C-k>', vim.lsp.buf.signature_help, opts)
map('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)
-- <C-t> to jump back
map('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
