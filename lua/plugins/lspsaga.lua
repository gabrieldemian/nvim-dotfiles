local opts = { noremap = true, silent = true }

return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    lightbulb = {
      enable_in_insert = false,
      enable = false,
    },
    ui = {
      winblend = 10,
      border = "rounded",
      colors = {
        normal_bg = "#74c7ec",
      },
    },
  },
  keys = {
    { "<leader>ca", "<cmd>Lspsaga code_action<cr>",           opts },
    { "<leader>bf", "<cmd>Lspsaga show_buf_diagnostics<cc>",  opts },
    { "<C-j>",      "<cmd>Lspsaga diagnostic_jump_next<cr>",  opts },
    { "<leader>d",  "<cmd>Lspsaga show_line_diagnostics<cr>", opts },
    { "gT",         "<cmd>Lspsaga goto_type_definition<cr>",  opts },
    { "gt",         "<cmd>Lspsaga peek_type_definition<cr>",  opts },
    { "gD",         "<cmd>Lspsaga goto_definition<cr>",       opts },
    { "gd",         "<cmd>Lspsaga peek_definition<cr>",       opts },
    { "K",          "<cmd>Lspsaga hover_doc<cr>" },
    { "<C-k>",      vim.lsp.buf.signature_help,               opts, mode = { "v" } },
    { "<leader>rn", "<cmd>Lspsaga rename<cr>",                opts },
    { "gh",         "<cmd>Lspsaga finder<cr>",                opts },
  },
}
