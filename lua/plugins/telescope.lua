-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'fzf')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope - Search Help' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope - Search Keymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope - Search Files' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Telescope - Search Select Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope - Grep current Word' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope - Live Grep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope - Search Diagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope - Search Resume' })
    vim.keymap.set('n', '<leader>.', builtin.oldfiles, { desc = 'Telescope - Recent Files)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope - Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = 'Telescope - Search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Telescope - Grep in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Telescope - Find Neovim files' })
  end,
}
