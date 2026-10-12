--*********************************************************************
-- https://github.com/windwp/nvim-autopairs
--*********************************************************************

local helpers = require("helpers")

-- windwp/nvim-autopairs: auto-close brackets / quotes in insert mode.
-- TODO: opt-in deep integration with blink-cmp (CR accept + pairs) if needed.
return {
  {
    "windwp/nvim-autopairs",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "7b9923abad60b903ece7c52940e1321d39eccc79" },
    }),
    event = "InsertEnter",
    opts = {},
  },
}
