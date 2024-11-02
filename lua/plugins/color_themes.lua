return {
  -- Theme plugins with their names specified
  { "sainnhe/edge", name = "edge", lazy = true },
  { "gbprod/nord.nvim", name = "nord", lazy = true },
  { "sainnhe/sonokai", name = "sonokai", lazy = true },
  { "sainnhe/everforest", name = "everforest", lazy = true },
  { "EdenEast/nightfox.nvim", name = "nightfox", lazy = true },
  { "marko-cerovac/material.nvim", name = "material", lazy = true },
  { "ntk148v/habamax.nvim", name = "habamax", lazy = false },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = true,
    config = function()
      require("gruvbox").setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = false,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }
    end,
  },
  {
    "sainnhe/gruvbox-material", -- seems cool
    name = "gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_enable_italic = false
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    config = function()
      require("kanagawa").setup {
        theme = "wave", -- Default theme, will be overridden
      }
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
      require("catppuccin").setup {
        flavor = "mocha",
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme "tokyonight-night"
      vim.cmd.hi "Comment gui=none"
    end,
  },
}
