--*********************************************************************
-- https://github.com/kevinhwang91/nvim-hlslens
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "kevinhwang91/nvim-hlslens",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "be2d7b2be01860b5445a007ff2bc72b29896db6b" },
    }),
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
      {
        "#",
        [[#<Cmd>lua require('hlslens').start()<CR>]],
        desc = "Search word backward with lens",
      },
      {
        "g*",
        [[g*<Cmd>lua require('hlslens').start()<CR>]],
        desc = "Search partial word forward with lens",
      },
      {
        "g#",
        [[g#<Cmd>lua require('hlslens').start()<CR>]],
        desc = "Search partial word backward with lens",
      },
    },
    config = function()
      require("hlslens").setup({
        -- Clear the lens once the cursor moves out of the matched instance
        -- range, so search highlighting settles after leaving a match.
        calm_down = true,
      })
    end,
  },
}
