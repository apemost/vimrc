--*********************************************************************
-- https://github.com/lewis6991/gitsigns.nvim
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "lewis6991/gitsigns.nvim",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.10", "907f7ac79b2c359320b392fc8c209214a1a79a65" },
      { "0.11", "31d6fb2d618bca1482b9f274751ead5f03461408" },
      { "0.11.3", "a462f416e2ce4744531c6256252dee99a7d34a83" },
    }),
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Hunk navigation (falls back to vim's ]c/[c inside diff windows).
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          elseif gs.nav_hunk then
            gs.nav_hunk("next")
          else
            gs.next_hunk()
          end
        end, "Next git hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          elseif gs.nav_hunk then
            gs.nav_hunk("prev")
          else
            gs.prev_hunk()
          end
        end, "Prev git hunk")

        -- Hunk actions.
        map("n", "<Leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<Leader>hr", gs.reset_hunk, "Reset hunk")
        map("v", "<Leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")
        map("v", "<Leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset hunk")
        map("n", "<Leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<Leader>hR", gs.reset_buffer, "Reset buffer")
        map("n", "<Leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<Leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line (full)")
        map("n", "<Leader>hd", gs.diffthis, "Diff this")

        -- Hunk text object.
        map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
      end,
    },
  },
}
