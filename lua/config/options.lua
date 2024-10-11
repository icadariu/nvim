local o = vim.opt
local g = vim.g
local wo = vim.wo
local bo = vim.bo
local utils = require('utils.index')

g.have_nerd_font = true
g.python3_host_prog = '/usr/bin/python3'

o.number = true
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.wrap = false
o.mouse = ""

-- Case-insensitive searching unless \C
-- or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Show signs like diagnostics, version control changes, breakpoints, etc
-- Show only if signs are present
o.signcolumn = "auto"

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

o.scrolloff = 10       -- Lines to keep above and below the cursor.

o.cursorline = false   -- Shows cursor position
o.cursorcolumn = false -- Shows cursor vertical position

--o.colorcolumn = "80"
o.updatetime = 50

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = true  -- Highlight all search matches
o.incsearch = true -- Show incremental search results as you type

o.termguicolors = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- o.list = true
-- o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = "custom_buffer",
  pattern  = "*",
  callback = function() vim.highlight.on_yank { timeout = 200 } end
})

-- makrdown filetype changes indentation. Fix it usig this
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})
