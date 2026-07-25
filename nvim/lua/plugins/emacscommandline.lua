--*********************************************************************
-- https://github.com/houtsnip/vim-emacscommandline
--*********************************************************************

return {
  "houtsnip/vim-emacscommandline",
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
