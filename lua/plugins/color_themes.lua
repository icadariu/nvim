return {
  -- Theme plugins with their names specified
  { "sainnhe/edge",                name = "edge",       lazy = true },
  { "gbprod/nord.nvim",            name = "nord",       lazy = true },
  { "sainnhe/sonokai",             name = "sonokai",    lazy = true },
  { "sainnhe/everforest",          name = "everforest", lazy = true },
  { "EdenEast/nightfox.nvim",      name = "nightfox",   lazy = true },
  { "marko-cerovac/material.nvim", name = "material",   lazy = true },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = true,
    config = function()
      require("gruvbox").setup({
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
        contrast = "",  -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
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
    lazy = false,
    opts = {},
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark",   -- style for floating windows
          vim.cmd.colorscheme 'tokyonight-night'
        },
      })
    end,
  },
}
