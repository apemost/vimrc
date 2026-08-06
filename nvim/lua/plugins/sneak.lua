--*********************************************************************
-- https://github.com/justinmk/vim-sneak
--*********************************************************************

return {
  {
    "justinmk/vim-sneak",
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
