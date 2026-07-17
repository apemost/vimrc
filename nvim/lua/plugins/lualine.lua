-- Disabled unless vim.g.custom_statusline_plugin == "lualine".
if vim.g.custom_statusline_plugin ~= "lualine" then
  return {}
end

local helpers = require("helpers")

local function lower_string(value, fallback)
  if type(value) == "string" and value ~= "" then
    return string.lower(value)
  end

  return fallback
end

-- Map the current colorscheme to a lualine theme name.
-- Lualine ships built-in themes for most popular colorschemes (including
-- gruvbox variants), so the mapping is typically straightforward.
local function resolve_lualine_theme()
  local colorscheme = lower_string(vim.g.custom_colorscheme, "auto")
  if colorscheme == "gruvbox" then
    return "gruvbox"
  end

  -- Let lualine auto-detect the theme from the active colorscheme.
  return "auto"
end

return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local icons_ok, _ = pcall(require, "nvim-web-devicons")

      -- Powerline glyphs (U+E0B0/B2 for sections, U+E0B1/B3 for components)
      -- are built at runtime via nr2char instead of embedding the private-use
      -- bytes literally -- those bytes were silently dropped from the file once.
      local powerline = vim.g.custom_powerline_fonts == 1
      local section_sep = powerline
          and { left = vim.fn.nr2char(0xe0b0), right = vim.fn.nr2char(0xe0b2) }
        or { left = "", right = "" }
      local component_sep = powerline
          and { left = vim.fn.nr2char(0xe0b1), right = vim.fn.nr2char(0xe0b3) }
        or { left = "|", right = "|" }

      require("lualine").setup({
        options = {
          theme = resolve_lualine_theme(),
          icons_enabled = icons_ok,
          section_separators = section_sep,
          component_separators = component_sep,
          globalstatus = false,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              "buffers",
              show_filename_only = true,
              mode = 2, -- show buffer index + name
              buffers_color = {
                active = "lualine_a_normal",
                inactive = "lualine_b_normal",
              },
            },
          },
          lualine_z = {
            {
              "tabs",
              mode = 2, -- show tab number + name
            },
          },
        },
        extensions = { "fugitive", "nvim-tree", "lazy" },
      })

      -- Buffer / tab navigation keymaps that replicate vim-airline behavior.
      local map = vim.keymap.set

      for i = 1, 9 do
        map("n", "<Leader>" .. i, function()
          vim.cmd("LualineBuffersJump " .. i)
        end, { desc = "Go to buffer " .. i })
      end

      map("n", "<Leader>-", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
      map("n", "<Leader>+", "<Cmd>bnext<CR>", { desc = "Next buffer" })

      map("n", "[t", "<Cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
      map("n", "]t", "<Cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
    end,
  },
}
