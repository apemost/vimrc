--*********************************************************************
-- https://github.com/windwp/nvim-autopairs
--*********************************************************************

-- windwp/nvim-autopairs: auto-close brackets / quotes in insert mode.
-- TODO: opt-in deep integration with blink-cmp (CR accept + pairs) if needed.
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
