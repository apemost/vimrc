local helpers = require("helpers")
local opt = vim.opt

if helpers.has_option("ttyfast") then
  opt.ttyfast = true
end

opt.autoread = true
opt.modeline = true
opt.modelines = 4
opt.exrc = true

if helpers.has_option("secure") then
  opt.secure = true
end

-- Over SSH without X11, Wayland, or tmux, copy through the terminal via OSC 52.
-- Paste returns the last copy instead of querying the terminal, because
-- OSC 52 reads are often blocked and each query can wait up to 10 seconds.
if
  vim.env.SSH_CONNECTION
  and not vim.env.DISPLAY
  and not vim.env.WAYLAND_DISPLAY
  and not vim.env.TMUX
then
  local osc52 = require("vim.ui.clipboard.osc52")
  local last = {}
  local function copy(reg)
    local send = osc52.copy(reg)
    return function(lines, regtype)
      last[reg] = { lines, regtype }
      send(lines)
    end
  end
  local function paste(reg)
    return function()
      return last[reg] or {}
    end
  end
  vim.g.clipboard = {
    name = "OSC 52 (copy only)",
    copy = { ["+"] = copy("+"), ["*"] = copy("*") },
    paste = { ["+"] = paste("+"), ["*"] = paste("*") },
  }
end

if vim.fn.has("clipboard") == 1 then
  if vim.fn.has("unnamedplus") == 1 then
    opt.clipboard = "unnamed,unnamedplus"
  else
    opt.clipboard = "unnamed"
  end
end

opt.wildmenu = true
if helpers.has_option("esckeys") then
  opt.esckeys = true
end
opt.backspace = { "indent", "eol", "start" }
opt.ignorecase = true
opt.smartcase = true
opt.hidden = true

if helpers.has_option("encoding") then
  vim.o.encoding = "utf-8"
end

if helpers.has_option("bomb") then
  opt.bomb = false
end

if helpers.has_option("termencoding") then
  vim.o.termencoding = "utf-8"
end

opt.fileencoding = "utf-8"
opt.fileencodings = { "utf-8", "ucs-bom", "gb18030", "gbk", "gb2312", "cp936", "default", "latin1" }
opt.fileformats = { "unix", "dos", "mac" }

local state_dir = vim.fn.stdpath("state")
local backup_dir = helpers.ensure_dir(helpers.join_paths(state_dir, "backup"))
local swap_dir = helpers.ensure_dir(helpers.join_paths(state_dir, "swap"))
local undo_dir = helpers.ensure_dir(helpers.join_paths(state_dir, "undo"))

opt.backupdir = { backup_dir }
opt.directory = { swap_dir }

if helpers.has_option("undodir") then
  opt.undodir = undo_dir
  opt.undofile = true
end

opt.backupskip = { "/tmp/*", "/private/tmp/*" }

vim.g.mapleader = vim.g.custom_leader
vim.g.maplocalleader = vim.g.custom_localleader
