--*********************************************************************
-- https://github.com/ellisonleao/gruvbox.nvim
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "ellisonleao/gruvbox.nvim",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "154eb5ff5b96d0641307113fa385eaf0d36d9796" },
    }),
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_termcolors = vim.g.gruvbox_termcolors or 256
      vim.g.gruvbox_contrast_dark = vim.g.gruvbox_contrast_dark or "medium"
      vim.g.gruvbox_contrast_light = vim.g.gruvbox_contrast_light or "medium"
      vim.g.gruvbox_invert_selection = vim.g.gruvbox_invert_selection or 0
    end,
  },
}
