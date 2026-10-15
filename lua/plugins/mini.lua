return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open()
        end,
        desc = "File explorer",
      },
    },
    config = function()
      require("mini.ai").setup {}
      require("mini.files").setup {}
      require("mini.pairs").setup {
        mappings = {
          -- Pair quotes only when not touching a word on either side, so quoting an existing word needs no cleanup.
          ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w\\][^%w]", register = { cr = false } },
          ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w\\][^%w]", register = { cr = false } },
          -- Also skip after a backtick, so typing ``` for a code fence doesn't leave a stray 4th one.
          ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w\\`][^%w]", register = { cr = false } },
          -- Brackets: don't pair when opening right before a word, e.g. wrapping an existing argument.
          ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][^%w]" },
          ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][^%w]" },
          ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][^%w]" },
        },
      }

      require("mini.surround").setup {
        mappings = {
          add = "gsa",
          delete = "gsd",
          find = "gsf",
          find_left = "gsF",
          highlight = "gsh",
          replace = "gsr",
          update_n_lines = "gsn",
        },
      }
    end,
  },
}
