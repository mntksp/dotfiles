return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  end,
}
