vim.g.have_nerd_font = true
vim.g.python3_host_prog = '/usr/bin/python3'

-- NetRw vim file explorer
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- simplify options
local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.mouse = ""

-- opt.showmode = true
opt.smartindent = true
opt.wrap = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Show signs like diagnostics, version control changes (e.g., Git changes), breakpoints, etc
-- Show only if signs are present
opt.signcolumn = "auto"

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.cursorline = true    -- Shows cursor position
opt.cursorcolumn = false -- Shows cursor vertical position

--opt.colorcolumn = "80"
opt.updatetime = 50

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = true  -- Highlight all search matches
opt.incsearch = true -- Show incremental search results as you type

-- Keybinding for disabling the mouse. Already have \m \M for this
--vim.api.nvim_set_keymap('n', '<leader>m', ':set mouse=a<CR>', { noremap = true, silent = true, desc = "Enable mouse" })
--vim.api.nvim_set_keymap('n', '<leader>M', ':set mouse=<CR>', { noremap = true, silent = true, desc = "Disable mouse" })

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
