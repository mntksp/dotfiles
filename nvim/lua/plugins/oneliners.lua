return {
  { "tpope/vim-fugitive" },
  { "ojroques/nvim-osc52" },
  { "towolf/vim-helm" },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
