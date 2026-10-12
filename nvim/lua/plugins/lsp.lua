--*********************************************************************
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/saghen/blink.cmp
--*********************************************************************

local helpers = require("helpers")

-- Configures native Neovim LSP.
local function make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok, blink = pcall(require, "blink.cmp")

  if ok and type(blink.get_lsp_capabilities) == "function" then
    return blink.get_lsp_capabilities(capabilities)
  end
  local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
  if cmp_ok then
    return vim.tbl_deep_extend("force", capabilities, cmp.default_capabilities())
  end

  return capabilities
end

local function set_lsp_keymaps(event)
  local bufnr = event.buf
  local client = vim.lsp.get_client_by_id(event.data.client_id)

  if not client then
    return
  end

  local function map(keys, rhs, desc, method)
    if method then
      local supported
      if vim.fn.has("nvim-0.11") == 1 then
        supported = client:supports_method(method)
      else
        supported = client.supports_method(method)
      end
      if not supported then
        return
      end
    end

    vim.keymap.set("n", keys, rhs, {
      buffer = bufnr,
      desc = desc,
      silent = true,
    })
  end

  map("<Leader>jd", vim.lsp.buf.declaration, "LSP: go to declaration", "textDocument/declaration")
  map("<LocalLeader>K", vim.lsp.buf.hover, "LSP: show documentation", "textDocument/hover")
  map("<LocalLeader>k", vim.lsp.buf.hover, "LSP: show symbol type", "textDocument/hover")
end

return {
  {
    "neovim/nvim-lspconfig",
    -- Newer lspconfig needs 0.11.3; earlier 0.11 also has a wildcard lookup bug.
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "0ef64599b8aa0187ee5f6d92cb39c951f348f041" },
      { "0.11.3", "cb33dea610b7eff240985be9f6fe219920e630ef" },
    }),
    dependencies = {
      "saghen/blink.cmp",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local lua_config = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      }

      local modern = vim.fn.has("nvim-0.11.3") == 1
      local capabilities = make_capabilities()
      if modern then
        vim.lsp.config("*", { capabilities = capabilities })
        vim.lsp.config("lua_ls", lua_config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = set_lsp_keymaps,
      })

      for _, server in ipairs({
        "basedpyright",
        "bashls",
        "clangd",
        "gopls",
        "jdtls",
        "lua_ls",
        "rust_analyzer",
        vim.fn.has("nvim-0.10") == 1 and "ts_ls" or "tsserver",
        "vimls",
      }) do
        if modern then
          vim.lsp.enable(server)
        else
          local opts = server == "lua_ls" and vim.deepcopy(lua_config) or {}
          opts.capabilities = capabilities
          require("lspconfig")[server].setup(opts)
        end
      end
    end,
  },
}
