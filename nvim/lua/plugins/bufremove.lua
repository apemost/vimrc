--*********************************************************************
-- https://github.com/nvim-mini/mini.bufremove
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "nvim-mini/mini.bufremove",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "4925c29ebd8161b3129e0fe3bfe88d720959799d" },
      { "0.11.3", "281bb1a2c60c3618c854bef2c0933276eb2362c2" },
    }),
    version = false,
    keys = {
      {
        "<Leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete buffer",
      },
      {
        "<Leader>bw",
        function()
          require("mini.bufremove").wipeout(0, false)
        end,
        desc = "Wipe out buffer",
      },
    },
  },
}
