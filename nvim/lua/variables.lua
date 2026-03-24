local defaults = {
  custom_leader = " ",
  custom_localleader = ",",
  custom_background = "dark",
  custom_colorscheme = "gruvbox",
  custom_colorcolumn = 0,
  custom_guifont = "Hack:h13,Monaco:h13",
  custom_powerline_fonts = 1,
  custom_plugins = {},
  custom_disabled_plugins = {},
  custom_completion_plugin = "",
  custom_lint_plugin = "",
  custom_search_engine = "https://www.google.com/search?q=%s",
  custom_error_symbol = "×",
  custom_warning_symbol = "¤",
}

for name, value in pairs(defaults) do
  if vim.g[name] == nil then
    vim.g[name] = value
  end
end
