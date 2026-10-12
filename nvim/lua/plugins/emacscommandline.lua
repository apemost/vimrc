--*********************************************************************
-- https://github.com/houtsnip/vim-emacscommandline
--*********************************************************************

local helpers = require("helpers")

return {
  "houtsnip/vim-emacscommandline",
  commit = helpers.get_plugin_commit_before_nvim({
    { "0.11.3", "3363eeb1f958bd0630448fdaa5f19ba7a834b343" },
  }),
  event = "CmdlineEnter",
  init = function()
    -- Keep the plugin from mapping <C-n>/<C-p> to <Down>/<Up> in cmdline mode:
    -- those mappings would override blink.cmp's cmdline completion mappings
    -- (select next/previous item). History recall is unchanged because native
    -- <C-n>/<C-p> in cmdline mode behave like <Down>/<Up>.
    vim.g.EmacsCommandLineNewerMatchingCommandLineDisable = 1
    vim.g.EmacsCommandLineOlderMatchingCommandLineDisable = 1
  end,
}
