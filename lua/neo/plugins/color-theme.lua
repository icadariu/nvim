return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensures it loads before other plugins that may depend on it
    config = function()
      require("catppuccin").setup({
        flavor = "mocha", -- Set the flavor to mocha (or your preferred flavor)
        -- Add any additional Catppuccin configuration here
      })
      vim.cmd([[colorscheme catppuccin]]) -- Set Catppuccin as the default colorscheme
    end
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm", -- The theme comes in three styles: `storm`, `moon`, `night`, `day`
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        },
      })
      -- No colorscheme command here, as Catppuccin is the default
    end
  },
}
