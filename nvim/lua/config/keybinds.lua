vim.g.mapleader = " "

vim.keymap.set("n", "j", function() return vim.v.count == 0 and "gj" or "j" end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function() return vim.v.count == 0 and "gk" or "k" end, { expr = true, silent = true, desc = "Up (wrap-aware)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
vim.keymap.set("n", "<M-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "J", ":m .+1<CR>==", { desc = "Move line down"})
vim.keymap.set("n", "K", ":m .-2<CR>==", { desc = "Move line up"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up"})

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect"})
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect"})


local diagnostic_text = true
vim.diagnostic.config({ virtual_text = diagnostic_text })
vim.keymap.set("n", "<leader>d", function()
  diagnostic_text = not diagnostic_text
  vim.diagnostic.config({ virtual_text = diagnostic_text })
end, { desc = "Toggle inline diagnostic messages" })

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set("n", "<leader>hl", function() vim.o.hlsearch = not vim.o.hlsearch end, { desc = "Toggle search highlight" })

