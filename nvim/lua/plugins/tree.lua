local helpers = require("helpers")

local function tree_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(description)
    return {
      buffer = bufnr,
      desc = "nvim-tree: " .. description,
      noremap = true,
      nowait = true,
      silent = true,
    }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<C-n>", api.node.navigate.sibling.next, opts("Next sibling"))
  vim.keymap.set("n", "<C-p>", api.node.navigate.sibling.prev, opts("Previous sibling"))
end

local function close_tree_if_last_window()
  if vim.fn.winnr("$") ~= 1 then
    return
  end

  if helpers.is_file_tree_buffer() then
    vim.cmd("quit")
  end
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      local map = vim.keymap.set
      local group = vim.api.nvim_create_augroup("CloseNvimTreeAutomatically", { clear = true })

      require("nvim-tree").setup({
        on_attach = tree_on_attach,
        sort = {
          sorter = "case_sensitive",
        },
        renderer = {
          group_empty = true,
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        filters = {
          custom = {
            "^%.DS_Store$",
            "^%.git$",
            "%.pyc$",
            "^__pycache__$",
            "^node_modules$",
          },
        },
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        group = group,
        callback = close_tree_if_last_window,
      })

      map("n", "<Leader>nj", "<Cmd>NvimTreeFindFile<CR>", { silent = true })
      map("n", "<Leader>nn", "<Cmd>NvimTreeFocus<CR>", { silent = true })
      map("n", "<Leader>tn", "<Cmd>NvimTreeToggle<CR>", { silent = true })
    end,
  },
}
