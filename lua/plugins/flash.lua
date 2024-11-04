return { -- amazing for fast navigation
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    jump = {
      autojump = true,
    },
    modes = {
      -- options used when flash is activated through
      -- a regular search with `/` or `?`
      search = {
        enabled = false, -- me: deactivate while using search, for now.
      },
      -- options used when flash is activated through
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = {
        enabled = false,
        jump_labels = true,
        multi_line = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<M-s>", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash: Select character" },
    { "<M-S>", mode = { "n" },           function() require("flash").treesitter() end, desc = "Flash: Select using Treesitter" },
  },
}
