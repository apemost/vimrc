--*********************************************************************
-- https://github.com/schickling/vim-bufonly
--*********************************************************************

return {
  {
    "schickling/vim-bufonly",
    keys = {
      {
        "<Leader>bo",
        "<Cmd>BufOnly<CR>",
        desc = "Delete other buffers",
      },
    },
  },
}
