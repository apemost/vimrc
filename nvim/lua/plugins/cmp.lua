-- Keep the Blink completion keys on Neovim 0.8/0.9, which Blink does not support.
if vim.fn.has("nvim-0.10") == 1 then
  return {}
end

return {
  {
    "hrsh7th/nvim-cmp",
    commit = "8c82d0bd31299dbff7f8e780f5e06d2283de9678", -- v0.0.2
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
      { "hrsh7th/cmp-buffer", commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657" },
      { "hrsh7th/cmp-path", commit = "c642487086dbd9a93160e1679a1327be111cbc25" },
      { "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
      { "L3MON4D3/LuaSnip", tag = "v2.1.1" },
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local snippets = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      local pending_direction
      local pending_text
      local pending_cmdtype
      local function input_text()
        return vim.fn.getcmdtype() == "" and vim.api.nvim_get_current_line() or vim.fn.getcmdline()
      end
      local function select(direction)
        local action = direction == 1 and cmp.select_next_item or cmp.select_prev_item
        action({ behavior = cmp.SelectBehavior.Insert })
      end
      cmp.event:on("menu_opened", function()
        if
          pending_direction
          and pending_text == input_text()
          and pending_cmdtype == vim.fn.getcmdtype()
        then
          local direction = pending_direction
          pending_direction = nil
          vim.schedule(function()
            if cmp.visible() then
              select(direction)
            end
          end)
        else
          pending_direction = nil
        end
      end)
      cmp.event:on("menu_closed", function()
        pending_direction = nil
      end)

      local function complete(direction)
        if cmp.visible() then
          select(direction)
        else
          pending_direction = direction
          pending_text = input_text()
          pending_cmdtype = vim.fn.getcmdtype()
          cmp.complete()
        end
      end

      local function tab(direction)
        return cmp.mapping(function(fallback)
          if snippets.locally_jumpable(direction) then
            snippets.jump(direction)
          else
            local col = vim.api.nvim_win_get_cursor(0)[2]
            if col > 0 and vim.api.nvim_get_current_line():sub(col, col):match("%s") == nil then
              complete(direction)
            else
              fallback()
            end
          end
        end, { "i", "s" })
      end

      cmp.setup({
        -- Native popup insertion keeps candidate cycling stable on older Neovim.
        view = { entries = "native", docs = { auto_open = false } },
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            snippets.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = tab(1),
          ["<S-Tab>"] = tab(-1),
          ["<C-space>"] = cmp.mapping(function()
            if not cmp.visible() then
              cmp.complete()
            elseif cmp.visible_docs() then
              cmp.close_docs()
            else
              cmp.open_docs()
            end
          end, { "i" }),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
        },
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, { name = "path" }, { name = "luasnip" } },
          {
            { name = "buffer" },
          }
        ),
      })
    end,
  },
}
