--*********************************************************************
-- https://github.com/mbbill/undotree
--*********************************************************************

local helpers = require("helpers")

-- Undo history sidebar. <Leader>tu toggles it after closing the symbol
-- outline; the two sidebars are mutually exclusive.
return {
  {
    "mbbill/undotree",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "6fa6b57cda8459e1e4b2ca34df702f55242f4e4d" },
    }),
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
