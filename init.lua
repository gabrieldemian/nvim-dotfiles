vim.g.mapleader = " "

require("plugins_packer")
require("_telescope")
require("lsp_config")
require("keymaps")
require("tree_sitter_config")

local api = vim.api
local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0
opt.expandtab = true
opt.swapfile = false
vim.cmd([[silent! colorscheme catppuccin]])

-- Remaps
-- keep cursor in place
keymap.set("n", "J", "mzJ`z")
keymap.set("x", "<leader>p", '"_dP')

-- Copy to clipboard
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')
