--*********************************************************************
-- https://github.com/kylechui/nvim-surround
--*********************************************************************

return {
  {
    "kylechui/nvim-surround",
    enabled = vim.fn.has("nvim-0.8") == 1,
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
