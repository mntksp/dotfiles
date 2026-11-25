return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- show multi-key leader mappings (e.g. <leader>cd) directly instead of as groups
    expand = function(node)
      return vim.startswith(node.keys, "<Space>")
    end,
  },
}
