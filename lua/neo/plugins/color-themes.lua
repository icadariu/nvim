return {
  -- Theme plugins with their names specified
  { "navarasu/onedark.nvim", name = "onedark", lazy = true },
  { "sainnhe/edge", name = "edge", lazy = true },
  { "sainnhe/sonokai", name = "sonokai", lazy = true },
  { "sainnhe/gruvbox-material", name = "gruvbox-material", lazy = true },
  { "sainnhe/everforest", name = "everforest", lazy = true },
  { "EdenEast/nightfox.nvim", name = "nightfox", lazy = true },
  { "olimorris/onedarkpro.nvim", name = "onedarkpro", lazy = true },
  { "marko-cerovac/material.nvim", name = "material", lazy = true },
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
    "rockyzhang24/arctic.nvim",
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
      -- print("Catppuccin theme configured") -- Remove or comment out unnecessary prints
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        },
      })
      -- print("TokyoNight theme configured") -- Remove or comment out unnecessary prints
    end,
  },

  -- Configuration plugin that handles theme selection
  {
    "nvim-lua/plenary.nvim",
    name = "theme-selector",
    lazy = false,  -- Ensure it's loaded at startup
    config = function()
      -- Theme selection function
      local function select_theme(theme_name)
        -- Load the selected theme plugin
        require("lazy").load({ plugins = { theme_name } })

        -- If the theme requires special handling, configure it here
        if theme_name == "kanagawa" then
          -- List of Kanagawa flavors
          local kanagawa_flavors = { "wave", "dragon", "lotus" }
          -- Randomly select a flavor
          local flavor = kanagawa_flavors[math.random(1, #kanagawa_flavors)]
          -- Configure Kanagawa with the selected flavor
          require("kanagawa").setup({ theme = flavor })
          print("Kanagawa theme configured with flavor: " .. flavor)
        end

        -- Apply the selected theme
        vim.cmd("colorscheme " .. theme_name)
      end

      -- Random theme selection function
      local function select_random_theme()
        -- List of colorscheme names
        local themes = {
          "onedark",
          "edge",
          "sonokai",
          "gruvbox-material",
          "everforest",
          "nightfox",
          "catppuccin",
          "onedarkpro",
          "material",
          "kanagawa",
          "arctic",
          "tokyonight",
        }

        -- Randomly select a theme
        math.randomseed(os.time())
        local selected_theme = themes[math.random(1, #themes)]

        -- Debug print to show which theme is selected
        print("Selected theme: " .. selected_theme)

        -- Apply the selected theme
        select_theme(selected_theme)
      end

      -- Select a theme during startup
      select_random_theme()

      -- Map a key to select a random theme
      vim.keymap.set('n', '<leader>rt', function()
        select_random_theme()
      end, { noremap = true, silent = true, desc = 'Random Theme' })
    end,
  },
}
