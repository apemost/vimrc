--*********************************************************************
-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim
--*********************************************************************

local helpers = require("helpers")

-- Installs LSP servers into Neovim's data dir and prepends their bin/ to PATH,
-- decoupling them from version managers and system availability.
return {
  {
    "mason-org/mason.nvim",
    -- Keep Mason's API generation compatible with the selected lspconfig.
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "fc98833b6da5de5a9c5b1446ac541577059555be" },
    }),
    build = ":MasonUpdate",
    lazy = false, -- run setup() at startup so its bin/ is on PATH before any LSP spawns
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "25c11854aa25558ee6c03432edfa0df0217324be" },
      { "0.11.3", "1a31f824b9cd5bc6f342fc29e9a53b60d74af245" },
    }),
    -- LSP loads this after adding its runtime files, before configuring servers.
    lazy = true,
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = function()
      local opts = {
        ensure_installed = {
          "basedpyright",
          "bashls",
          "clangd",
          "gopls",
          "jdtls",
          "lua_ls",
          "ts_ls",
          "vimls",
        },
      }
      if vim.fn.has("nvim-0.11.3") == 1 then
        opts.automatic_enable = false
      end
      return opts
    end,
  },
}
