return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "none",         -- can be "buffer_id", "ordinal", etc.
        diagnostics = "nvim_lsp", -- enable this if you want diagnostics
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "thin", -- can be "slant", "thick", etc.
      },
    })
  end,
}
