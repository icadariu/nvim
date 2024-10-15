-- Init lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader before lazy setup
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  spec = {
    -- Import all plugins from lua/plugins/ folder
    { import = "plugins" },
    -- Load additional plugins from lua/bulk.lua
    { import = "bulk" },
  },
  change_detection = { notify = false },
})
-- Additional configs
require("neo.globals")
require("neo.options")
require("neo.remap")
--vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme tokyonight")
