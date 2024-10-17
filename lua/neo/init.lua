-- Additional configs
require("neo.globals")
require("neo.options")
require("neo.remap")

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

require("lazy").setup({
  spec = {
    spec = "neo.plugins",
    change_detection = { notify = false }
  },
})

--vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme tokyonight")
