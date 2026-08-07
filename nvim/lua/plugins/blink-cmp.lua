--*********************************************************************
-- https://github.com/saghen/blink.cmp
-- https://github.com/rafamadriz/friendly-snippets
--*********************************************************************

-- Only trigger/cycle completion when a keyword character precedes the cursor,
-- so Tab can still fall back to a literal tab (e.g. indentation on empty lines).
local function has_words_before()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return col > 0 and vim.api.nvim_get_current_line():sub(col, col):match("%s") == nil
end

return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = "default",
        -- <Tab>/<S-Tab>: jump snippet placeholders when a snippet is active,
        -- otherwise trigger completion and cycle candidates (wrapping around).
        ["<Tab>"] = {
          "snippet_forward",
          function(cmp)
            if has_words_before() then return cmp.insert_next() end
          end,
          "fallback",
        },
        ["<S-Tab>"] = {
          "snippet_backward",
          function(cmp)
            if has_words_before() then return cmp.insert_prev() end
          end,
          "fallback",
        },
      },
      cmdline = {
        keymap = {
          -- The 'cmdline' preset cycles candidates with <Tab>/<S-Tab>,
          -- <C-n>/<C-p> and <Left>/<Right>; also allow <Down>/<Up>.
          ["<Down>"] = { "select_next", "fallback" },
          ["<Up>"] = { "select_prev", "fallback" },
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = false,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
    opts_extend = {
      "sources.default",
    },
  },
}
