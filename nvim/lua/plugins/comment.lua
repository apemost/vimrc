-- nvim-mini/mini.comment: NERDCommenter-style mappings with flush-left comments.
local function current_range()
  local first = vim.api.nvim_win_get_cursor(0)[1]
  local last = math.min(first + vim.v.count1 - 1, vim.api.nvim_buf_line_count(0))
  return first, last
end

local function visual_range()
  local first = vim.fn.line("v")
  local last = vim.fn.line(".")
  local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  return math.min(first, last), math.max(first, last)
end

local function comment_parts(line_number)
  local commentstring = require("mini.comment").get_commentstring({ line_number, 1 })
  local left, right = commentstring:match("^(.-)%%s(.-)$")
  return vim.trim(left or ""), vim.trim(right or "")
end

local function is_commented(line_number)
  local line = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1] or ""
  local content = vim.trim(line)
  if content == "" then
    return false
  end

  local left, right = comment_parts(line_number)
  if left == "" and right == "" then
    return false
  end

  local has_left = left == "" or vim.startswith(content, left)
  local has_right = right == "" or vim.endswith(content, right)
  return has_left and has_right
end

local function set_comment_state(first, last, should_comment)
  local comment = require("mini.comment")
  for line_number = first, last do
    local line = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1] or ""
    if not line:match("^%s*$") and is_commented(line_number) ~= should_comment then
      comment.toggle_lines(line_number, line_number, { ref_position = { line_number, 1 } })
    end
  end
end

local function comment_current()
  local first, last = current_range()
  set_comment_state(first, last, true)
end

local function uncomment_current()
  local first, last = current_range()
  set_comment_state(first, last, false)
end

local function toggle_current()
  require("mini.comment").toggle_lines(current_range())
end

local function comment_visual()
  local first, last = visual_range()
  set_comment_state(first, last, true)
end

local function uncomment_visual()
  local first, last = visual_range()
  set_comment_state(first, last, false)
end

local function toggle_visual()
  require("mini.comment").toggle_lines(visual_range())
end

local function yank_and_comment_current()
  local first, last = current_range()
  vim.cmd.normal({ args = { tostring(last - first + 1) .. "yy" }, bang = true })
  set_comment_state(first, last, true)
end

local function yank_and_comment_visual()
  local first, last = visual_range()
  vim.cmd.normal({ args = { "gvy" }, bang = true })
  set_comment_state(first, last, true)
end

return {
  {
    "nvim-mini/mini.comment",
    version = false,
    event = "VeryLazy",
    opts = {
      options = {
        start_of_line = true,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
    keys = {
      { "<Leader>cc", comment_current, desc = "Comment line(s)" },
      { "<Leader>cc", comment_visual, mode = "x", desc = "Comment selection" },
      { "<Leader>c<Space>", toggle_current, desc = "Toggle comment line(s)" },
      { "<Leader>c<Space>", toggle_visual, mode = "x", desc = "Toggle comment selection" },
      { "<Leader>cu", uncomment_current, desc = "Uncomment line(s)" },
      { "<Leader>cu", uncomment_visual, mode = "x", desc = "Uncomment selection" },
      { "<Leader>cy", yank_and_comment_current, desc = "Yank and comment line(s)" },
      { "<Leader>cy", yank_and_comment_visual, mode = "x", desc = "Yank and comment selection" },
    },
  },
}
