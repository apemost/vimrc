--*********************************************************************
-- https://github.com/mbbill/undotree
--*********************************************************************

-- Undo history sidebar. <Leader>tu toggles it after closing the symbol
-- outline; the two sidebars are mutually exclusive.
return {
  {
    "mbbill/undotree",
    init = function()
      vim.g.undotree_WindowLayout = vim.g.undotree_WindowLayout or 4
    end,
    cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus" },
    keys = {
      {
        "<Leader>tu",
        function()
          -- The other sidebar plugin may not be loaded yet (lazy).
          pcall(vim.cmd, "AerialClose")
          vim.cmd("UndotreeToggle")
        end,
        desc = "Toggle undo tree",
      },
    },
  },
}
