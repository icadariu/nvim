return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup {
      columns = { "icon" },
      -- keymaps = {
      --   ["<c-h>"] = false,
      --   ["<M-h>"] = "actions.select_split",
      -- },
      view_options = {
        show_hidden = true,
      },
    }

    -- Open parent directory in current window
    vim.keymap.set("n", "<leader>~", "<CMD>Oil<CR>", { desc = "Oil - Open parent directory" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "<leader>oi", require("oil").toggle_float, { desc = "Oil toggle float" })
  end,
}
