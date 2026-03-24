local helpers = require("helpers")
local opt = vim.opt

vim.cmd("syntax enable")

if helpers.has_option("termguicolors") then
  vim.o.termguicolors = true
end

vim.o.background = vim.g.custom_background

if not helpers.is_gui() and vim.g.custom_colorscheme == "molokai" then
  vim.g.rehash256 = 1
end

local function apply_colorscheme(name)
  return pcall(vim.cmd.colorscheme, name)
end

local requested_colorscheme = vim.g.custom_colorscheme
local fallback_colorscheme = "habamax"

if not apply_colorscheme(requested_colorscheme) then
  if requested_colorscheme ~= fallback_colorscheme then
    vim.notify(
      ("Colorscheme '%s' is unavailable, falling back to '%s'"):format(
        requested_colorscheme,
        fallback_colorscheme
      ),
      vim.log.levels.WARN
    )
  end

  if not apply_colorscheme(fallback_colorscheme) then
    apply_colorscheme("default")
  end
end

if helpers.is_gui() and helpers.has_option("guifont") then
  vim.o.guifont = vim.g.custom_guifont
end

if helpers.has_option("macligatures") and helpers.is_mac() then
  vim.o.macligatures = true
end

if (helpers.is_gui() or (vim.env.SSH_TTY == nil and vim.env.SUDO_USER == nil)) then
  vim.cmd("highlight Comment gui=italic cterm=italic")
end

if helpers.has_option("colorcolumn") and vim.g.custom_colorcolumn > 0 then
  opt.colorcolumn = tostring(vim.g.custom_colorcolumn)
end

opt.shortmess:append("atI")
opt.showmode = true
opt.title = true
opt.showcmd = true
opt.number = true
opt.ruler = true
opt.errorbells = false
opt.startofline = false
opt.listchars = { tab = "▸ ", trail = "·", nbsp = "_" }
opt.list = true
opt.hlsearch = true
opt.incsearch = true
opt.tabstop = 2
opt.laststatus = 2
opt.mouse = "a"

if helpers.has_option("relativenumber") then
  opt.relativenumber = true
end

opt.cursorline = true
opt.scrolloff = 3
opt.completeopt:remove("preview")
