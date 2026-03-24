return {
  {
    "tpope/vim-fugitive",
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
        if vim.fn.expand("%"):find("NERD_tree") then
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
        if vim.fn.expand("%"):find("NERD_tree") then
          return "<C-w><C-w>:Git<CR>"
        end

        return ":Git<CR>"
      end, { expr = true })
      map("n", "<Leader>gw", ":Gwrite ")
    end,
  },
}
