return {
  { "brenoprata10/nvim-highlight-colors" },
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
  { "catppuccin/nvim" },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  -- https://github.com/echasnovski/mini.nvim?tab=readme-ov-file#modules
  { "echasnovski/mini.nvim", version = "*" }, --  40+ independent Lua modules improving overall Neovim
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
    "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "regex",
          "lua",
          "bash",
          "diff",
          "make",
          "dockerfile",
          "terraform",
          "helm",
          "tmux",
        },
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = { enable = true },
        max_lines = 5,
      })
    end,
  },
}
