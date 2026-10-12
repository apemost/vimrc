--*********************************************************************
-- https://github.com/stevearc/aerial.nvim
--*********************************************************************

local helpers = require("helpers")

-- Symbol outline sidebar (LSP with TreeSitter/markdown fallback). <Leader>tt
-- toggles it after hiding the undo tree; the two sidebars are mutually
-- exclusive.
return {
  {
    "stevearc/aerial.nvim",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "d8343d0c935a72382413f9344ae0e39072405b7d" },
      { "0.11", "8bb8697d180681746da41bef5c8691d04443af36" },
      { "0.12", "c5e56945d9703f7079ccff484b35d0e4c231dd6c" },
    }),
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
