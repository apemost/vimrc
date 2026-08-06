--*********************************************************************
-- https://github.com/stevearc/aerial.nvim
--*********************************************************************

-- Symbol outline sidebar (LSP with TreeSitter/markdown fallback). <Leader>tt
-- toggles it after hiding the undo tree; the two sidebars are mutually
-- exclusive.
return {
  {
    "stevearc/aerial.nvim",
    opts = {},
    cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
    keys = {
      {
        "<Leader>tt",
        function()
          -- The other sidebar plugin may not be loaded yet (lazy).
          pcall(vim.cmd, "UndotreeHide")
          vim.cmd("AerialToggle")
        end,
        desc = "Toggle symbol outline",
      },
    },
  },
}
