local M = {}

local function expand(path)
  return vim.fn.expand(path)
end

function M.join_paths(...)
  if vim.fs and vim.fs.joinpath then
    return vim.fs.joinpath(...)
  end

  return table.concat({ ... }, "/")
end

function M.file_exists(path)
  return vim.fn.filereadable(expand(path)) == 1
end

function M.has_option(name)
  return vim.fn.exists("+" .. name) == 1
end

function M.ensure_dir(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end

  return path
end

function M.source_if_exists(path)
  local resolved = expand(path)
  if M.file_exists(resolved) then
    vim.cmd("source " .. vim.fn.fnameescape(resolved))
    return true
  end

  return false
end

function M.run_lua_file_if_exists(path)
  local resolved = expand(path)
  if M.file_exists(resolved) then
    dofile(resolved)
    return true
  end

  return false
end

function M.load_user_overrides(name)
  local config_dir = vim.fn.stdpath("config")
  local candidates = {}

  if name == "preload" then
    table.insert(candidates, { kind = "vim", path = "~/.vimrc.preload" })
  elseif name == "afterload" then
    table.insert(candidates, { kind = "vim", path = "~/.vimrc.afterload" })
  end

  table.insert(candidates, { kind = "vim", path = M.join_paths(config_dir, name .. ".vim") })
  table.insert(candidates, { kind = "lua", path = M.join_paths(config_dir, name .. ".lua") })

  for _, candidate in ipairs(candidates) do
    if candidate.kind == "lua" then
      M.run_lua_file_if_exists(candidate.path)
    else
      M.source_if_exists(candidate.path)
    end
  end
end

function M.has_features()
  return vim.fn.has("timers") == 1
    and (vim.fn.exists("*jobstart") == 1 or vim.fn.exists("*job_start") == 1)
end

function M.is_linux()
  return vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0 and vim.fn.has("win32unix") == 0
end

function M.is_mac()
  return vim.fn.has("macunix") == 1
end

function M.is_windows()
  return vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
end

function M.is_gui()
  return vim.g.neovide or vim.g.GuiLoaded or vim.g.gonvim_running or vim.g.nvim_qt
end

function M.url_encode(value)
  return vim.uri_encode((value or ""):gsub('[\"\n]', " "))
end

-- Return whether the target buffer is backed by a file tree window.
function M.is_file_tree_buffer(bufnr)
  local buffer = bufnr or 0
  local filetype = vim.bo[buffer].filetype
  local name = vim.api.nvim_buf_get_name(buffer)

  return filetype == "NvimTree"
    or name:find("NERD_tree") ~= nil
    or name:find("NvimTree_") ~= nil
end

return M
