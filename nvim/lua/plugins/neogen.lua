--*********************************************************************
-- https://github.com/danymat/neogen
--*********************************************************************

local jsdoc = {
  -- Give overlapping JavaScript and TypeScript declaration nodes to functions.
  parent = { class = { "class_declaration", "export_statement" }, type = {} },
  template = { annotation_convention = "jsdoc" },
}

return {
  {
    "danymat/neogen",
    enabled = vim.fn.has("nvim-0.10") == 1,
    cmd = "Neogen",
    keys = {
      {
        "<Leader>dg",
        "<Cmd>Neogen<CR>",
        silent = true,
        desc = "Generate documentation",
      },
    },
    opts = {
      languages = {
        python = { template = { annotation_convention = "numpydoc" } },
        javascript = jsdoc,
        javascriptreact = jsdoc,
        typescript = jsdoc,
        typescriptreact = jsdoc,
      },
    },
  },
}
