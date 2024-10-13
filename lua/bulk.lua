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
  { -- Used to trim new line, empty space, etc
    "cappyzawa/trim.nvim",
    opts = {
      -- Custom configuration for trim.nvim
      ft_blocklist = {}, -- Add any filetypes you don't want to be trimmed
      patterns = {}, -- Add any additional patterns to trim
      trim_on_write = true, -- Enable trim on file save (write)
      trim_trailing = true, -- Trim trailing whitespaces
      trim_last_line = true, -- Trim the last empty line(s)
      trim_first_line = true, -- Trim the first empty line(s)
      highlight = false, -- Disable highlighting of trimmed parts
      highlight_bg = "#ff0000", -- Customize highlight background color
      highlight_ctermbg = "red", -- Customize highlight color in terminal mode
    },
  },
}
