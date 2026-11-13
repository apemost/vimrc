--*********************************************************************
-- https://github.com/mfussenegger/nvim-lint
--*********************************************************************

local helpers = require("helpers")
local diagnostic_severity = { min = vim.diagnostic.severity.WARN }

-- Runs external linters on save and reports through the built-in diagnostic
-- system; formatting stays with conform.nvim.

-- Wraps between warnings and errors, matching the visible diagnostic markers.
local function goto_diagnostic(count)
  if vim.diagnostic.jump then
    vim.diagnostic.jump({ count = count, wrap = true, severity = diagnostic_severity })
  elseif count > 0 then
    vim.diagnostic.goto_next({ wrap = true, severity = diagnostic_severity })
  else
    vim.diagnostic.goto_prev({ wrap = true, severity = diagnostic_severity })
  end
end

-- Skip minified files and keep missing linter executables silent.
local function try_lint()
  if not vim.fn.expand("%"):match("%.min%.[jc]ss?$") then
    require("lint").try_lint(nil, { ignore_errors = true })
  end
end

return {
  {
    "mfussenegger/nvim-lint",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "3ffa176628fe49e74f47992757016b7371a9b86b" },
      { "0.11.3", "a219b2c9e5b4765e5c845aba119dad55806fcaf1" },
    }),
    event = { "BufReadPost", "BufWritePost" },
    keys = {
      {
        "<C-k>",
        function()
          goto_diagnostic(-1)
        end,
        desc = "Previous diagnostic",
      },
      {
        "<C-j>",
        function()
          goto_diagnostic(1)
        end,
        desc = "Next diagnostic",
      },
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

      -- Keep all diagnostic details available in floats, but only mark warnings/errors.
      local signs = { severity = diagnostic_severity }
      if vim.fn.has("nvim-0.10") == 1 then
        signs.text = {
          [vim.diagnostic.severity.ERROR] = vim.g.custom_error_symbol,
          [vim.diagnostic.severity.WARN] = vim.g.custom_warning_symbol,
        }
      else
        for _, name in ipairs({ "Error", "Warn", "Info", "Hint" }) do
          local group = "DiagnosticSign" .. name
          vim.fn.sign_define(group, {
            text = name == "Error" and vim.g.custom_error_symbol or vim.g.custom_warning_symbol,
            texthl = group,
          })
        end
      end

      vim.diagnostic.config({
        signs = signs,
        underline = { severity = diagnostic_severity },
        severity_sort = true,
      })

      vim.api.nvim_create_autocmd("BufWritePost", { callback = try_lint })
    end,
  },
}
