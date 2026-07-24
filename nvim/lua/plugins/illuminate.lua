--*********************************************************************
-- https://github.com/RRethy/vim-illuminate
--*********************************************************************

-- Configures cursor-word references with LSP semantics and a regex fallback.
return {
  {
    "RRethy/vim-illuminate",
    init = function()
      -- Group the cursor-word references link to. Colorschemes often override the
      -- Lua engine's IlluminatedWord* groups into strong LSP reference colors;
      -- CursorLine stays faint like the legacy Vim engine. Set to "" to opt out.
      vim.g.illuminate_highlight_link = vim.g.illuminate_highlight_link or "CursorLine"
    end,
    config = function()
      require("illuminate").configure({
        providers = { "lsp", "regex" },
        delay = 250,
        filetypes_denylist = {
          "dirbuf",
          "dirvish",
          "fugitive",
          "NvimTree",
        },
      })

      -- Re-apply on every colorscheme load so the faint link wins over whatever
      -- the colorscheme defines; a falsy value leaves the colorscheme's styling.
      local link = vim.g.illuminate_highlight_link
      if link == nil or link == "" then
        return
      end
      local function apply_link()
        for _, group in ipairs({ "IlluminatedWordText", "IlluminatedWordRead", "IlluminatedWordWrite" }) do
          vim.api.nvim_set_hl(0, group, { link = link })
        end
      end
      apply_link()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_link })
    end,
  },
}
