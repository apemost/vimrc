local helpers = require("helpers")
local map = vim.keymap.set

local function internet_search(query)
  local encoded_query = helpers.url_encode(query)
  local url = string.format(vim.g.custom_search_engine, encoded_query)

  if vim.ui and type(vim.ui.open) == "function" then
    local ok = pcall(vim.ui.open, url)
    if ok then
      return
    end
  end

  local opener = helpers.is_linux() and "xdg-open" or "open"

  if vim.system then
    vim.system({ opener, url }, { detach = true })
  else
    vim.fn.jobstart({ opener, url }, { detach = true })
  end
end

map("n", "Y", "y$")
map("n", "]b", "<Cmd>bnext<CR>", { silent = true })
map("n", "[b", "<Cmd>bprevious<CR>", { silent = true })

map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")
map("i", "<C-b>", "<Left>")
map("i", "<C-f>", "<Right>")
map("i", "<C-d>", "<Del>")

map("n", "<Leader>W", ":w !sudo tee % > /dev/null<CR>", { silent = true })
map("n", "<Leader>yf", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { silent = true })
map("n", "<Leader>yn", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { silent = true })

map("n", "<Leader>se", function()
  internet_search(vim.fn.expand("<cWORD>"))
end, { silent = true })

map("x", "<Leader>se", function()
  vim.cmd('normal! "gy')
  internet_search(vim.fn.getreg("g"))
end, { silent = true })
