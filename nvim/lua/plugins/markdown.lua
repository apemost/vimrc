--*********************************************************************
-- https://github.com/iamcco/markdown-preview.nvim
-- https://github.com/apemost/vim-markdown-follow
--*********************************************************************

local helpers = require("helpers")

return {
  {
    "iamcco/markdown-preview.nvim",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee" },
    }),
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
      {
        "<LocalLeader>p",
        "<Cmd>MarkdownPreview<CR>",
        ft = { "markdown" },
        silent = true,
        desc = "Markdown preview",
      },
      {
        "<Leader>mp",
        function()
          vim.notify("<Leader>mp is deprecated; use <LocalLeader>p instead.", vim.log.levels.WARN)
          vim.cmd("MarkdownPreview")
        end,
        silent = true,
        desc = "Markdown preview (deprecated)",
      },
    },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      helpers.set_global_default("mkdp_auto_start", 0)
      helpers.set_global_default("mkdp_auto_close", 1)
      helpers.set_global_default("mkdp_refresh_slow", 0)
      helpers.set_global_default("mkdp_command_for_global", 0)
      helpers.set_global_default("mkdp_open_to_the_world", 0)
      helpers.set_global_default("mkdp_open_ip", "")
      helpers.set_global_default("mkdp_browser", "")
      helpers.set_global_default("mkdp_echo_preview_url", 0)
      helpers.set_global_default("mkdp_browserfunc", "")
      helpers.set_global_default("mkdp_markdown_css", "")
      helpers.set_global_default("mkdp_highlight_css", "")
      helpers.set_global_default("mkdp_port", "")
      helpers.set_global_default("mkdp_page_title", "${name}")

      if vim.g.mkdp_preview_options == nil then
        vim.g.mkdp_preview_options = {
          mkit = {},
          katex = {},
          uml = {},
          maid = {},
          disable_sync_scroll = 0,
          sync_scroll_type = "middle",
          hide_yaml_meta = 1,
          sequence_diagrams = {},
        }
      end
    end,
  },
  {
    "apemost/vim-markdown-follow",
    commit = helpers.get_plugin_commit_before_nvim({
      { "0.11.3", "00bf7f71be076b8b27eb06dd4c17e29548458b4c" },
    }),
    ft = { "markdown" },
  },
}
