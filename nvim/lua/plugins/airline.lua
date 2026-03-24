local function set_global_default(name, value)
  if vim.g[name] == nil then
    vim.g[name] = value
  end
end

local function lower_string(value, fallback)
  if type(value) == "string" and value ~= "" then
    return string.lower(value)
  end

  return fallback
end

local function default_airline_theme()
  local colorscheme = lower_string(vim.g.custom_colorscheme, "")
  if colorscheme ~= "gruvbox" then
    return colorscheme
  end

  local background = lower_string(vim.g.custom_background, lower_string(vim.o.background, "dark"))
  local is_light = background == "light"
  local contrast_key = is_light and "gruvbox_contrast_light" or "gruvbox_contrast_dark"
  local allowed_contrasts = is_light and {
    hard = true,
    medium = true,
    soft = true,
  } or {
    hard = true,
    medium = true,
    soft = true,
    pale = true,
  }
  local contrast = lower_string(vim.g[contrast_key], "medium")

  if not allowed_contrasts[contrast] then
    contrast = "medium"
  end

  return string.format("base16_gruvbox_%s_%s", is_light and "light" or "dark", contrast)
end

return {
  {
    "vim-airline/vim-airline",
    lazy = false,
    dependencies = {
      "vim-airline/vim-airline-themes",
    },
    init = function()
      set_global_default("airline#extensions#tabline#enabled", 1)
      set_global_default("airline#extensions#tabline#fnamemod", ":t")
      set_global_default("airline#extensions#tabline#tab_nr_type", 2)
      set_global_default("airline#extensions#tabline#show_tab_nr", 1)
      set_global_default("airline#extensions#tabline#show_tab_type", 1)
      set_global_default("airline#extensions#tabline#buffer_idx_mode", 1)
      set_global_default("airline#extensions#tabline#buffers_label", "BUFFERS")
      set_global_default("airline#extensions#tabline#tabs_label", "TABS")
      set_global_default("airline#extensions#tmuxline#enabled", 1)
      set_global_default("airline_theme", default_airline_theme())
      set_global_default("airline_powerline_fonts", vim.g.custom_powerline_fonts)
    end,
    config = function()
      local map = vim.keymap.set
      local plug_opts = { remap = true }
      local silent_plug_opts = { remap = true, silent = true }

      map("n", "<Leader>1", "<Plug>AirlineSelectTab1", plug_opts)
      map("n", "<Leader>2", "<Plug>AirlineSelectTab2", plug_opts)
      map("n", "<Leader>3", "<Plug>AirlineSelectTab3", plug_opts)
      map("n", "<Leader>4", "<Plug>AirlineSelectTab4", plug_opts)
      map("n", "<Leader>5", "<Plug>AirlineSelectTab5", plug_opts)
      map("n", "<Leader>6", "<Plug>AirlineSelectTab6", plug_opts)
      map("n", "<Leader>7", "<Plug>AirlineSelectTab7", plug_opts)
      map("n", "<Leader>8", "<Plug>AirlineSelectTab8", plug_opts)
      map("n", "<Leader>9", "<Plug>AirlineSelectTab9", plug_opts)
      map("n", "<Leader>-", "<Plug>AirlineSelectPrevTab", plug_opts)
      map("n", "<Leader>+", "<Plug>AirlineSelectNextTab", plug_opts)

      map("n", "[t", "<Plug>AirlineSelectPrevTab", silent_plug_opts)
      map("n", "]t", "<Plug>AirlineSelectNextTab", silent_plug_opts)
    end,
  },
}
