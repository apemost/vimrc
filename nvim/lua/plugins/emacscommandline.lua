--*********************************************************************
-- https://github.com/houtsnip/vim-emacscommandline
--*********************************************************************

return {
  "houtsnip/vim-emacscommandline",
  event = "CmdlineEnter",
  init = function()
    -- Disable the plugin's history mappings for <C-n>/<C-p> and use expr
    -- mappings instead: navigate the cmdline completion popup (wildmenu) when
    -- it is open, otherwise recall newer/older history.
    vim.g.EmacsCommandLineNewerMatchingCommandLineDisable = 1
    vim.g.EmacsCommandLineOlderMatchingCommandLineDisable = 1

    vim.keymap.set("c", "<C-n>", function()
      return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>"
    end, { expr = true })
    vim.keymap.set("c", "<C-p>", function()
      return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>"
    end, { expr = true })
  end,
}
