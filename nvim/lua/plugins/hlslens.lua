--*********************************************************************
-- https://github.com/kevinhwang91/nvim-hlslens
--*********************************************************************

return {
  {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    keys = {
      {
        "n",
        [[<Cmd>execute('normal! ' .. v:count1 .. 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        desc = "Next search result with lens",
      },
      {
        "N",
        [[<Cmd>execute('normal! ' .. v:count1 .. 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        desc = "Previous search result with lens",
      },
      { "*", [[*<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word forward with lens" },
      { "#", [[#<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word backward with lens" },
      { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], desc = "Search partial word forward with lens" },
      { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], desc = "Search partial word backward with lens" },
    },
    config = function()
      require("hlslens").setup({
        -- Clear lens when cursor moves out of the matched instance range,
        -- approximating is.vim's auto-nohlsearch behavior.
        calm_down = true,
      })
    end,
  },
}
