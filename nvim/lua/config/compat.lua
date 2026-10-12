-- Isolate plugin, lockfile and parser storage across compatibility boundaries.
local version = vim.version()
local profile = version.major .. "." .. version.minor
if profile == "0.11" then
  if vim.fn.has("nvim-0.11.7") == 1 then
    profile = "0.11.7"
  elseif vim.fn.has("nvim-0.11.3") == 1 then
    profile = "0.11.3"
  end
end

return { profile = profile }
