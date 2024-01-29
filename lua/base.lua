vim.g.mapleader = " "

local opt = vim.opt

vim.cmd([[set termguicolors]])
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0
opt.expandtab = true
opt.swapfile = false
opt.showmode = false
vim.cmd([[set cursorline]])
-- vim.cmd([[highlight CursorLineNr gui=bold guifg=Pink]])
