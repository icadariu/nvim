return {
  {
  "vhyrro/luarocks.nvim",
  priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
  },
  -- https://github.com/echasnovski/mini.nvim?tab=readme-ov-file#modules
  { 'echasnovski/mini.nvim', version = '*' }, --  40+ independent Lua modules improving overall Neovim
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
