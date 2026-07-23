--*********************************************************************
-- https://github.com/RRethy/vim-illuminate
--*********************************************************************

-- Configures cursor-word references with LSP semantics and a regex fallback.
return {
  {
    "RRethy/vim-illuminate",
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
    end,
  },
}
