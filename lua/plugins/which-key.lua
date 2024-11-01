-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = {
      mappings = true, -- if NerdFonts present
      keys = {},       -- leave it as empty table to use the default which-key icons.
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  sort = { "alphanum", "local", "order", "group", "mod" },
  -- Document existing key chains
  spec = {
    { '<leader>c', group = '[C]ode',     mode = { 'n', 'x' } },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  },
}
