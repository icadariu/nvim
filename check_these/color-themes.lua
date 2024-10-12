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
    priority = 1000,
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
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- Configuration plugin that handles theme selection
  {
    "nvim-lua/plenary.nvim",
    name = "theme-selector",
    lazy = false, -- Ensure it's loaded at startup
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
          "edge",
          "sonokai",
          "gruvbox-material",
          "catppuccin",
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
      vim.keymap.set("n", "<leader>rt", function()
        select_random_theme()
      end, { noremap = true, silent = true, desc = "Random Theme" })
    end,
  },
}
