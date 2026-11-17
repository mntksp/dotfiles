vim.o.number = true -- enable line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.wrap = false -- do not wrap lines by default
vim.o.expandtab = true -- convert tabs to spaces
vim.o.tabstop = 2 -- number of spaces a tab represents
vim.o.shiftwidth = 2 -- number of spaces for each indentation
vim.o.smartindent = true -- automatically indent new lines
vim.o.autoindent = true -- copy indent from current line
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor

vim.o.cursorline = true -- highlight the current line
vim.o.termguicolors = true -- enable 24-bit rgb colors

vim.o.showmode = false -- do not show mode, instead have it in the status line

vim.o.ignorecase = true -- ignore case for search
vim.o.smartcase = true -- case sensitive if search string contains uppercase

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
