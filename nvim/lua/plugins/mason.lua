--*********************************************************************
-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim
--*********************************************************************

-- Installs LSP servers into Neovim's data dir and prepends their bin/ to PATH,
-- decoupling them from version managers and system availability.
return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    lazy = false, -- run setup() at startup so its bin/ is on PATH before any LSP spawns
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "basedpyright", "bashls", "lua_ls", "ts_ls", "vimls" },
      automatic_enable = false, -- keep enabling in lsp.lua's manual loop
    },
  },
}
