-- plugins need little to no config to work.
return {
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
  }

}
