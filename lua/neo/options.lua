vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.guicursor = "" -- disable gui cursor
vim.g.have_nerd_font = true
vim.g.python3_host_prog = "/usr/bin/python3"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.mouse = ""

-- Case-insensitive searching unless \C
-- or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show signs like diagnostics, version control changes, breakpoints, etc
-- Show only if signs are present
vim.opt.signcolumn = "yes"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8        -- Lines to keep above and below the cursor.

vim.opt.cursorline = false   -- Shows cursor position
vim.opt.cursorcolumn = false -- Shows cursor vertical position

--vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true  -- Highlight all search matches
vim.opt.incsearch = true -- Show incremental search results as you type

vim.opt.termguicolors = true
vim.opt.spell = false -- Set spelling off by default

-- Insert mode transition to command mode.
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })
