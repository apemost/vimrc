--*********************************************************************
-- https://github.com/nvim-mini/mini.bufremove
--*********************************************************************

return {
  {
    "nvim-mini/mini.bufremove",
    enabled = vim.fn.has("nvim-0.10") == 1,
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
