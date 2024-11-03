return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup()

    local api = require "Comment.api"
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

    vim.keymap.set("n", "<C-_>", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle comment line (Ctrl+/)", noremap = true, silent = true })

    vim.keymap.set("x", "<C-_>", function()
      vim.api.nvim_feedkeys(esc, "nx", false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment selection (Ctrl+/)" })
  end,
}
