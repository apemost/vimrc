-- Shared dependency; load only when another plugin needs it.
local helpers = require("helpers")

return {
  {
    "rafamadriz/friendly-snippets",
    optional = true,
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "6cd7280adead7f586db6fccbd15d2cac7e2188b9" },
    }),
  },
}
