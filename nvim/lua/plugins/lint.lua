--*********************************************************************
-- https://github.com/mfussenegger/nvim-lint
--*********************************************************************

-- Runs external linters on save and reports through the built-in diagnostic
-- system; formatting stays with conform.nvim.

-- Wraps to the first/last diagnostic instead of stopping at the buffer edges.
local function goto_diagnostic(count)
  if vim.diagnostic.jump then
    vim.diagnostic.jump({ count = count, wrap = true })
  elseif count > 0 then
    vim.diagnostic.goto_next({ wrap = true })
  else
    vim.diagnostic.goto_prev({ wrap = true })
  end
end

-- ignore_errors keeps linters whose binary is missing silent; the filter
-- skips minified files.
local function try_lint()
  require("lint").try_lint(nil, {
    ignore_errors = true,
    filter = function()
      return vim.fn.expand("%"):match("%.min%.[jc]ss?$") == nil
    end,
  })
end

return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost" },
    keys = {
      { "<C-k>", function() goto_diagnostic(-1) end, desc = "Previous diagnostic" },
      { "<C-j>", function() goto_diagnostic(1) end, desc = "Next diagnostic" },
    },
    config = function()
      require("lint").linters_by_ft = {
        python = { "ruff" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        json = { "jsonlint" },
        yaml = { "yamllint" },
        dockerfile = { "hadolint" },
        markdown = { "markdownlint" },
        lua = { "luacheck" },
      }

      -- Sign symbols follow g:custom_error_symbol / g:custom_warning_symbol;
      -- INFO and HINT fall back to the warning symbol.
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = vim.g.custom_error_symbol,
            [vim.diagnostic.severity.WARN] = vim.g.custom_warning_symbol,
            [vim.diagnostic.severity.INFO] = vim.g.custom_warning_symbol,
            [vim.diagnostic.severity.HINT] = vim.g.custom_warning_symbol,
          },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePost", { callback = try_lint })
    end,
  },
}
