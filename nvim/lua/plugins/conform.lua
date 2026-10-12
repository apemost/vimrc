--*********************************************************************
-- https://github.com/stevearc/conform.nvim
--*********************************************************************

local helpers = require("helpers")

-- Lightweight formatter dispatcher; <Leader>= formats the buffer or the
-- selection in normal and visual mode.
return {
  {
    "stevearc/conform.nvim",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "cd75be867f2331b22905f47d28c0c270a69466aa" },
      { "0.11.3", "619363c30309d29ffa631e67c8183f2a72caa373" },
    }),
    cmd = { "ConformInfo" },
    opts = function()
      local opts = {
        formatters_by_ft = {
          bash = { "shfmt" },
          c = { "clang_format" },
          cpp = { "clang_format" },
          css = { "prettier" },
          go = { "goimports", "gofmt", stop_after_first = true },
          html = { "prettier" },
          java = { "google-java-format" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          lua = { "stylua" },
          markdown = { "prettier" },
          python = { "ruff_format", "black", stop_after_first = true },
          rust = { "rustfmt" },
          sh = { "shfmt" },
          toml = { "taplo" },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
      }
      if vim.fn.has("nvim-0.10") == 0 then
        -- The 0.8-compatible release selects alternatives through a nested list.
        for ft, formatters in pairs(opts.formatters_by_ft) do
          if formatters.stop_after_first then
            formatters.stop_after_first = nil
            opts.formatters_by_ft[ft] = { formatters }
          end
        end
        opts.default_format_opts = nil
      end
      return opts
    end,
    keys = {
      {
        "<Leader>=",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "Format buffer or selection",
      },
    },
  },
}
