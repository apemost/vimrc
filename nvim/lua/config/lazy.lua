-- lazy.nvim requires Neovim 0.8; older versions keep only the base configuration.
if vim.fn.has("nvim-0.8") == 0 then
  return
end

local fs = vim.uv or vim.loop

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not fs.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

local compat = require("config.compat")

require("lazy").setup({
  spec = { { import = "plugins" } },
  root = vim.fn.stdpath("data") .. "/lazy-nvim-" .. compat.profile,
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock-" .. compat.profile .. ".json",
  install = {
    missing = true,
    colorscheme = { "gruvbox" },
  },
})
