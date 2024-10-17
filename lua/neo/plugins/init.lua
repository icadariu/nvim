-- plugins need little to no config to work.
return {
  { "echasnovski/mini.icons" },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, you can add custom ones if needed
    cmd = "Trouble",
  },
  {
    --
    "tpope/vim-surround",
    event = "VeryLazy", -- Load the plugin lazily
  },
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
}
