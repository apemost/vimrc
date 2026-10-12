--*********************************************************************
-- https://github.com/tpope/vim-repeat
--*********************************************************************

local helpers = require("helpers")

-- tpope/vim-repeat: lets `.` repeat plugin maps (surround, fugitive, ...).
-- Pure vimscript, no setup; load eagerly so dot-repeat works from startup.
return {
  {
    "tpope/vim-repeat",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "65846025c15494983dafe5e3b46c8f88ab2e9635" },
    }),
    lazy = false,
  },
}
