return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local ibl = require "ibl"

      -- Initial setup with indent guides disabled by default
      ibl.setup {
        enabled = false, -- Start with indent guides off
        indent = {
          char = "¦",
        },
      }

      -- Keymap for toggling indent guides on and off
      vim.keymap.set("n", "<Tab>ti", function()
        vim.cmd "IBLToggle"
      end, { desc = "Toggle indent lines" })
    end,
  },
}
