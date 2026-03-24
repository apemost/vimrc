return {
  {
    "ellisonleao/gruvbox.nvim",
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
