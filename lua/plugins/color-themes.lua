return {
  -- Theme plugins with their names specified
  { "sainnhe/edge", name = "edge", lazy = true },
  { "sainnhe/sonokai", name = "sonokai", lazy = true },
  { "sainnhe/everforest", name = "everforest", lazy = true },
  { "EdenEast/nightfox.nvim", name = "nightfox", lazy = true },
  { "marko-cerovac/material.nvim", name = "material", lazy = true },
  {
    "sainnhe/gruvbox-material", -- seems cool
    lazy = false,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = false
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        theme = "wave", -- Default theme, will be overridden
      })
    end,
  },
  {
    "rockyzhang24/arctic.nvim", -- seems cool
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "v2",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavor = "mocha",
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
