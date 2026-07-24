--*********************************************************************
-- https://github.com/nvim-treesitter/nvim-treesitter
--*********************************************************************

-- Parsers for common languages, installed on startup (no-op if already
-- installed).
local ensure_installed = {
  "bash",
  "c",
  "cpp",
  "css",
  "go",
  "html",
  "java",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "rust",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- tree-sitter-cli is required to build parsers; skip installation
      -- with a visible warning when it is missing.
      if vim.fn.executable("tree-sitter") == 1 then
        require("nvim-treesitter").install(ensure_installed)
      else
        vim.notify(
          "tree-sitter-cli not found; skipping parser installation",
          vim.log.levels.WARN
        )
      end

      -- Highlighting is not enabled automatically; start it whenever a
      -- parser is available for the buffer's filetype.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
        callback = function(event)
          pcall(vim.treesitter.start, event.buf)
        end,
      })
    end,
  },
}
