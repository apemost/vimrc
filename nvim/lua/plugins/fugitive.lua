--*********************************************************************
-- https://github.com/tpope/vim-fugitive
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "tpope/vim-fugitive",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0" },
    }),
    config = function()
      local map = vim.keymap.set

      map("n", "<Leader>gb", function()
        if vim.fn.expand("%"):find("fugitiveblame") then
          return ":bdelete<CR>"
        end

        return ":Git blame<CR>"
      end, { expr = true })

      map("v", "<Leader>gb", ":Git blame<CR>")

      map("n", "<Leader>gc", function()
        if helpers.is_file_tree_buffer() then
          return "<C-w><C-w>:Git commit "
        end

        return ":Git commit "
      end, { expr = true })

      map("n", "<Leader>gD", ":Gdiff ")
      map("n", "<Leader>gd", ":Gdiff<CR>")
      map("n", "<Leader>ge", ":Gedit ")
      map("n", "<Leader>gf", ":Git fetch ")
      map("n", "<Leader>gl", ":Git pull ")
      map("n", "<Leader>gm", ":Git merge ")
      map("n", "<Leader>gp", ":Git push ")
      map("n", "<Leader>gr", ":Gread ")
      map("n", "<Leader>gs", function()
        if helpers.is_file_tree_buffer() then
          return "<C-w><C-w>:Git<CR>"
        end

        return ":Git<CR>"
      end, { expr = true })
      map("n", "<Leader>gw", ":Gwrite ")
    end,
  },
}
