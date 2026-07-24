--*********************************************************************
-- https://github.com/nvim-treesitter/nvim-treesitter
--*********************************************************************

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },
}
