-- Preserve command-line completion keys on Neovim versions without Blink.
if vim.fn.has("nvim-0.10") == 1 then
  return {}
end

return {
  {
    "gelguy/wilder.nvim",
    commit = "679f348dc90d80ff9ba0e7c470c40a4d038dcecf",
    event = "CmdlineEnter",
    dependencies = { "houtsnip/vim-emacscommandline" },
    config = function()
      local wilder = require("wilder")
      wilder.set_option("use_python_remote_plugin", 0)
      wilder.setup({
        modes = { ":", "/", "?" },
        next_key = false,
        previous_key = false,
        accept_key = false,
        reject_key = false,
      })
      wilder.set_option("renderer", wilder.popupmenu_renderer())
      local function keycode(key)
        return vim.api.nvim_replace_termcodes(key, true, false, true)
      end
      local selecting = false
      vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
        callback = function()
          selecting = false
        end,
      })
      for key, action in pairs({ ["<Tab>"] = wilder.next, ["<S-Tab>"] = wilder.previous }) do
        vim.keymap.set("c", key, function()
          if wilder.in_context() ~= 1 then
            return keycode(key)
          end
          selecting = true
          return action()
        end, { expr = true, replace_keycodes = false })
      end
      for _, key in ipairs({ "<C-n>", "<Down>", "<Right>" }) do
        vim.keymap.set("c", key, function()
          return selecting and wilder.in_context() == 1 and wilder.next() or keycode(key)
        end, { expr = true, replace_keycodes = false })
      end
      for _, key in ipairs({ "<C-p>", "<Up>", "<Left>" }) do
        vim.keymap.set("c", key, function()
          return selecting and wilder.in_context() == 1 and wilder.previous() or keycode(key)
        end, { expr = true, replace_keycodes = false })
      end
      vim.keymap.set("c", "<C-space>", function()
        if wilder.in_context() ~= 1 then
          return keycode("<C-space>")
        end
        if selecting then
          return ""
        end
        selecting = true
        return wilder.next()
      end, { expr = true, replace_keycodes = false })
      vim.keymap.set("c", "<C-y>", function()
        if selecting and wilder.can_accept_completion() == 1 then
          selecting = false
          return wilder.accept_completion()
        end
        return keycode("<C-y>")
      end, { expr = true, replace_keycodes = false })
      vim.keymap.set("c", "<C-e>", function()
        if selecting and wilder.can_reject_completion() == 1 then
          selecting = false
          return wilder.reject_completion()
        end
        return keycode("<C-e>")
      end, { expr = true, replace_keycodes = false })
      vim.keymap.set("c", "<End>", function()
        selecting = false
        return keycode("<End>")
      end, { expr = true, replace_keycodes = false })
    end,
  },
}
