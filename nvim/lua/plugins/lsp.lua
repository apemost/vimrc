--*********************************************************************
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/saghen/blink.cmp
--*********************************************************************

-- Configures native Neovim LSP.
local function make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok, blink = pcall(require, "blink.cmp")

  if ok and type(blink.get_lsp_capabilities) == "function" then
    return blink.get_lsp_capabilities(capabilities)
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
    if method and not client:supports_method(method) then
      return
    end

    vim.keymap.set("n", keys, rhs, {
      buffer = bufnr,
      desc = desc,
      silent = true,
    })
  end

  map("<Leader>jc", vim.lsp.buf.definition, "LSP: go to include target", "textDocument/definition")
  map("<Leader>jd", vim.lsp.buf.declaration, "LSP: go to declaration", "textDocument/declaration")
  map("<LocalLeader>K", vim.lsp.buf.hover, "LSP: show documentation", "textDocument/hover")
  map("<LocalLeader>k", vim.lsp.buf.hover, "LSP: show symbol type", "textDocument/hover")
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      if not (vim.lsp and vim.lsp.config and vim.lsp.enable) then
        vim.notify("nvim-lspconfig requires Neovim 0.11 or newer.", vim.log.levels.WARN)
        return
      end

      vim.lsp.config("*", {
        capabilities = make_capabilities(),
      })

      vim.lsp.config("lua_ls", {
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
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = set_lsp_keymaps,
      })

      for _, server in ipairs({
        "bashls",
        "clangd",
        "gopls",
        "jdtls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
        "vimls",
      }) do
        vim.lsp.enable(server)
      end
    end,
  },
}
