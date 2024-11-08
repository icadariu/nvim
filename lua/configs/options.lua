vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ""

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes" -- Keep signcolumn on by default

vim.opt.updatetime = 250 -- Decrease update time

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split" -- Preview substitutions live, as you type!

vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.cursorcolumn = false -- Shows cursor vertical position

vim.opt.conceallevel = 0 -- disable cncealment in markdown

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.trouble_lualine = true

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.textwidth = 200 -- Line size

-- This option helps to avoid all the |hit-enter| prompts caused by file f.e with Ctrl-G
-- Ctrl-g prints current filename
vim.opt.shortmess:append { W = true, I = true, c = true, C = true }

vim.opt.spelllang = { "en" }
vim.opt.spelloptions:append "noplainbuffer" -- Only spellcheck a buffer when 'syntax' is enabled,

-- Avoid :checkhealth issues for node, perl and python
vim.cmd "let g:loaded_node_provider=0"
vim.cmd "let g:loaded_perl_provider=0"
vim.cmd "let g:loaded_python3_provider=0"

-- Folding options. Already set using nvim-ufo
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldtext = ""
-- vim.opt.foldmethod = "expr" -- works as long as you have treesitter
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldlevel = 99 -- the higher, the more folds opened
-- vim.opt.foldlevelstart = 99
