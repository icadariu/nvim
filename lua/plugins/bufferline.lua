return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup {
      -- Your specific Bufferline configuration goes here
      options = {
        separator_style = "slant",
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
      },
    }
  end,
}
