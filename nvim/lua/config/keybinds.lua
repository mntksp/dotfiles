vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>hl", function() vim.o.hlsearch = not vim.o.hlsearch end)
