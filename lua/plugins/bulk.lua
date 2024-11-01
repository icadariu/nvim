-- list of plugins that have little to no configs
return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  { "Bilal2453/luvit-meta", lazy = true }, -- Collection of definition files for the framework Luvit
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
