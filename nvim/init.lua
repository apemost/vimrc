if vim.loader and type(vim.loader.enable) == "function" then
  vim.loader.enable()
end

local helpers = require("helpers")

helpers.load_user_overrides("preload")

require("variables")
require("general")
require("config.lazy")
require("keymap")
require("appearance")

helpers.load_user_overrides("afterload")
