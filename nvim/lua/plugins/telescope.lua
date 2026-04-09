local helpers = require("helpers")

local function current_git_root()
  local buffer_path = vim.api.nvim_buf_get_name(0)
  local search_dir = buffer_path ~= "" and vim.fn.fnamemodify(buffer_path, ":p:h") or vim.fn.getcwd()
  local lines = vim.fn.systemlist({ "git", "-C", search_dir, "rev-parse", "--show-toplevel" })

  if vim.v.shell_error ~= 0 or not lines[1] or lines[1] == "" then
    return nil
  end

  return lines[1]
end

local function search_root()
  return current_git_root() or vim.fn.getcwd()
end

local function run_from_normal_window(callback)
  return function()
    if helpers.is_file_tree_buffer() then
      vim.cmd.wincmd("w")
    end

    callback()
  end
end

local function get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_row = start_pos[2] - 1
  local start_col = start_pos[3] - 1
  local end_row = end_pos[2] - 1
  local end_line = vim.api.nvim_buf_get_lines(0, end_row, end_row + 1, false)[1] or ""
  local end_col = math.min(end_pos[3], #end_line)

  local lines = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
  return table.concat(lines, " ")
end

local function live_grep_args(ignore_case)
  if not ignore_case then
    return nil
  end

  return function()
    return { "--ignore-case" }
  end
end

local function grep_picker(builtin, opts)
  local picker_opts = vim.tbl_extend("force", {
    cwd = opts.cwd,
  }, opts.search ~= nil and {
    search = opts.search,
  } or {})

  if opts.ignore_case then
    picker_opts.additional_args = live_grep_args(true)
  end

  if opts.search ~= nil then
    builtin.grep_string(picker_opts)
    return
  end

  builtin.live_grep(picker_opts)
end

local function grep_command_runner(builtin, opts)
  return function(command_opts)
    grep_picker(builtin, {
      cwd = opts.cwd(),
      search = command_opts.args ~= "" and command_opts.args or nil,
      ignore_case = opts.ignore_case,
    })
  end
end

local function prompt_for_query(prompt, callback)
  vim.ui.input({ prompt = prompt }, function(input)
    if input == nil then
      return
    end

    callback(input ~= "" and input or nil)
  end)
end

local function open_windows_picker(pickers, finders, conf, actions, action_state)
  local windows = {}

  for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local bufnr = vim.api.nvim_win_get_buf(winid)
    local name = vim.api.nvim_buf_get_name(bufnr)
    local cursor = vim.api.nvim_win_get_cursor(winid)
    local display_name = name ~= "" and vim.fn.fnamemodify(name, ":~:.") or "[No Name]"
    local marker = winid == vim.api.nvim_get_current_win() and "*" or " "

    table.insert(windows, {
      winid = winid,
      ordinal = string.format("%s %s %d", display_name, vim.bo[bufnr].filetype, cursor[1]),
      display = string.format("%s %d:%d %s", marker, winid, cursor[1], display_name),
    })
  end

  pickers.new({}, {
    prompt_title = "Windows",
    finder = finders.new_table({
      results = windows,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display,
          ordinal = entry.ordinal,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection and selection.value then
          vim.api.nvim_set_current_win(selection.value.winid)
        end
      end)

      return true
    end,
  }):find()
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local map = vim.keymap.set

      telescope.setup({})

      vim.api.nvim_create_user_command("GG", grep_command_runner(builtin, {
        cwd = current_git_root,
        ignore_case = false,
      }), { nargs = "*", force = true })

      vim.api.nvim_create_user_command("RG", grep_command_runner(builtin, {
        cwd = search_root,
        ignore_case = false,
      }), { nargs = "*", force = true })

      vim.api.nvim_create_user_command("Ag", grep_command_runner(builtin, {
        cwd = search_root,
        ignore_case = false,
      }), { nargs = "*", force = true })

      vim.api.nvim_create_user_command("Gg", grep_command_runner(builtin, {
        cwd = current_git_root,
        ignore_case = true,
      }), { nargs = "*", force = true })

      vim.api.nvim_create_user_command("Rg", grep_command_runner(builtin, {
        cwd = search_root,
        ignore_case = true,
      }), { nargs = "*", force = true })

      map({ "n", "x", "o" }, "<Leader><Tab>", function()
        builtin.keymaps()
      end, { silent = true })

      map("n", "<Leader>bb", run_from_normal_window(function()
        builtin.buffers({
          sort_mru = true,
          ignore_current_buffer = true,
        })
      end), { silent = true })

      map("n", "<Leader>bh", run_from_normal_window(function()
        builtin.git_bcommits()
      end), { silent = true })

      map("x", "<Leader>bh", function()
        builtin.git_bcommits_range()
      end, { silent = true })

      map("n", "<Leader>f/", function()
        builtin.search_history()
      end, { silent = true })

      map("n", "<Leader>f:", function()
        builtin.command_history()
      end, { silent = true })

      map("n", "<Leader>fa", function()
        grep_picker(builtin, {
          cwd = search_root(),
          search = vim.fn.expand("<cword>"),
          ignore_case = false,
        })
      end, { silent = true })

      map("x", "<Leader>fa", function()
        grep_picker(builtin, {
          cwd = search_root(),
          search = get_visual_selection(),
          ignore_case = false,
        })
      end, { silent = true })

      map("n", "<Leader>fc", function()
        builtin.commands()
      end, { silent = true })

      map("n", "<Leader>ff", run_from_normal_window(function()
        builtin.find_files({
          cwd = search_root(),
          hidden = true,
        })
      end), { silent = true })

      map("n", "<Leader>fg", function()
        grep_picker(builtin, {
          cwd = current_git_root() or vim.fn.getcwd(),
          search = vim.fn.expand("<cword>"),
          ignore_case = true,
        })
      end, { silent = true })

      map("x", "<Leader>fg", function()
        grep_picker(builtin, {
          cwd = current_git_root() or vim.fn.getcwd(),
          search = get_visual_selection(),
          ignore_case = true,
        })
      end, { silent = true })

      map("n", "<Leader>fh", run_from_normal_window(function()
        builtin.oldfiles()
      end), { silent = true })

      map("n", "<Leader>fm", function()
        builtin.marks()
      end, { silent = true })

      map("n", "<Leader>fr", function()
        grep_picker(builtin, {
          cwd = search_root(),
          search = vim.fn.expand("<cword>"),
          ignore_case = true,
        })
      end, { silent = true })

      map("x", "<Leader>fr", function()
        grep_picker(builtin, {
          cwd = search_root(),
          search = get_visual_selection(),
          ignore_case = true,
        })
      end, { silent = true })

      map("n", "<Leader>fs", run_from_normal_window(function()
        local git_root = current_git_root()

        if git_root == nil then
          vim.notify("Git status is only available inside a git repository.", vim.log.levels.WARN)
          return
        end

        builtin.git_status({ cwd = git_root })
      end), { silent = true })

      map("n", "<Leader>fw", function()
        open_windows_picker(pickers, finders, conf, actions, action_state)
      end, { silent = true })

      map("n", "<Leader>fz", ":Telescope ")

      map("n", "<Leader>gg", run_from_normal_window(function()
        local git_root = current_git_root()

        if git_root == nil then
          builtin.find_files({
            cwd = vim.fn.getcwd(),
            hidden = true,
          })
          return
        end

        builtin.git_files({
          cwd = git_root,
          show_untracked = true,
        })
      end), { silent = true })

      map("n", "<Leader>gh", function()
        local git_root = current_git_root()

        if git_root == nil then
          vim.notify("Git history is only available inside a git repository.", vim.log.levels.WARN)
          return
        end

        builtin.git_commits({ cwd = git_root })
      end, { silent = true })

      map("n", "<Leader>sG", function()
        prompt_for_query("GG> ", function(input)
          grep_picker(builtin, {
            cwd = current_git_root() or vim.fn.getcwd(),
            search = input,
            ignore_case = false,
          })
        end)
      end, { silent = true })

      map("n", "<Leader>sR", function()
        prompt_for_query("RG> ", function(input)
          grep_picker(builtin, {
            cwd = search_root(),
            search = input,
            ignore_case = false,
          })
        end)
      end, { silent = true })

      map("n", "<Leader>sa", function()
        prompt_for_query("Ag> ", function(input)
          grep_picker(builtin, {
            cwd = search_root(),
            search = input,
            ignore_case = false,
          })
        end)
      end, { silent = true })

      map("n", "<Leader>sg", function()
        prompt_for_query("Gg> ", function(input)
          grep_picker(builtin, {
            cwd = current_git_root() or vim.fn.getcwd(),
            search = input,
            ignore_case = true,
          })
        end)
      end, { silent = true })

      map("n", "<Leader>sr", function()
        prompt_for_query("Rg> ", function(input)
          grep_picker(builtin, {
            cwd = search_root(),
            search = input,
            ignore_case = true,
          })
        end)
      end, { silent = true })
    end,
  },
}
