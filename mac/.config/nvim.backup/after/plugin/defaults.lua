vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
--- vim.g.mapleader = ','


map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-g>', ':let @+ = expand("%:p")<Return>')
local builtin = require("telescope.builtin")
local telescope = require("telescope")
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end
vim.keymap.set('n', '<space>f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
   end)
--- vim.keymap.set('n', ';r', function()
---   builtin.live_grep()
--- end)
--- vim.keymap.set('n', '\\\\', function()
---   builtin.buffers()
--- end)
--- vim.keymap.set('n', ';t', function()
---   builtin.help_tags()
--- end)
vim.keymap.set('n', '<space>o', function()
  builtin.resume()
end)
-- vim.keymap.set('n', ';e', function()
--   builtin.diagnostics()
-- end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

local keymap = vim.keymap

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', 'tp', ':tabp<Return>')
keymap.set('n', 'tn', ':tabn<Return>')
keymap.set('n', 'tx', ':tabclose<Return>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
