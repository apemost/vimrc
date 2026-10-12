--*********************************************************************
-- https://github.com/justinmk/vim-sneak
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "justinmk/vim-sneak",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "feea86adcfbf8e6b5e71fdd5f4f5736fd8819fdb" },
    }),
    init = function()
      vim.g["sneak#label"] = vim.g["sneak#label"] or 1
      vim.g["sneak#use_ic_scs"] = vim.g["sneak#use_ic_scs"] or 1
    end,
    keys = {
      { "s", "<Plug>Sneak_s", mode = { "n" }, remap = true },
      { "S", "<Plug>Sneak_S", mode = { "n" }, remap = true },
      { "z", "<Plug>Sneak_z", mode = { "x", "o" }, remap = true },
      { "Z", "<Plug>Sneak_Z", mode = { "x", "o" }, remap = true },
    },
  },
}
