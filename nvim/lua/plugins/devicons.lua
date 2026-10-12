-- Shared dependency; load only when another plugin needs it.
local helpers = require("helpers")

return {
  {
    "nvim-tree/nvim-web-devicons",
    optional = true,
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "2ae6958df7ced50baac5035cec0c15799eedfbf7" },
    }),
  },
}
