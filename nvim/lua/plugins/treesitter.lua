--*********************************************************************
-- https://github.com/nvim-treesitter/nvim-treesitter
--*********************************************************************

local helpers = require("helpers")

-- Parsers for common languages, installed on startup (no-op if already
-- installed).
local ensure_installed = {
  "bash",
  "c",
  "cpp",
  "css",
  "dart",
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
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "0f9f09275f5fdfcc2b1f4021ddca44282cf47a6b" },
      { "0.12", "cf12346a3414fa1b06af75c79faebe7f76df080a" },
    }),
    branch = vim.fn.has("nvim-0.12") == 1 and "main" or nil,
    lazy = false,
    build = ":TSUpdate",
    config = function()
      if vim.fn.has("nvim-0.12") == 0 then
        local parser_dir = vim.fn.stdpath("data") .. "/site"
        vim.fn.mkdir(parser_dir, "p")
        vim.opt.rtp:prepend(parser_dir)
        require("nvim-treesitter.configs").setup({
          parser_install_dir = parser_dir,
          ensure_installed = ensure_installed,
          highlight = { enable = true },
        })
        return
      end

      -- tree-sitter-cli is required to build parsers; skip installation
      -- with a visible warning when it is missing.
      if vim.fn.executable("tree-sitter") == 1 then
        require("nvim-treesitter").install(ensure_installed)
      else
        vim.notify("tree-sitter-cli not found; skipping parser installation", vim.log.levels.WARN)
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
