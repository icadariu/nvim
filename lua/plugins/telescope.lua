return { -- Fuzzy Finder (files, lsp, etc)
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
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
    vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current word' })
    vim.keymap.set('n', '<leader>Fs', builtin.builtin, { desc = 'Find Select Telescope' })
    vim.keymap.set('n', '<leader>Fr', builtin.resume, { desc = 'Find Resume' })
    vim.keymap.set('n', '<leader>Fk', builtin.keymaps, { desc = 'Find Keymaps' })
    vim.keymap.set('n', '<leader>Fh', builtin.help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>Fg', builtin.live_grep, { desc = 'Find by Grep' })
    vim.keymap.set('n', '<leader>Ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>Fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
    vim.keymap.set('n', '<leader>F.', builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>sws', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search [N]eovim files' })
  end,
}
