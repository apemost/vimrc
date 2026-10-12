--*********************************************************************
-- https://github.com/kylechui/nvim-surround
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "kylechui/nvim-surround",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "1098d7b3c34adcfa7feb3289ee434529abd4afd1" },
    }),
    version = vim.fn.has("nvim-0.11.3") == 1 and "*" or false,
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
