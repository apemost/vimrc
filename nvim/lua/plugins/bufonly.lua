--*********************************************************************
-- https://github.com/schickling/vim-bufonly
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "schickling/vim-bufonly",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "05a9f2d79f7aa7e2a94f9a6e29555e878e88d411" },
    }),
    keys = {
      {
        "<Leader>bo",
        "<Cmd>BufOnly<CR>",
        desc = "Delete other buffers",
      },
    },
  },
}
