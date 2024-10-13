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
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash:" },
      { "S",     mode = { "n" },           function() require("flash").treesitter() end,        desc = "Flash: Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Flash: Remote" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Flash: Treesitter Search" },
    },
}
