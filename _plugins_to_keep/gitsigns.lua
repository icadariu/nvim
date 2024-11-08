-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },

    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })
      -- Actions
      -- visual mode
      map('v', '<Tab>sh', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'stage git hunk' })
      map('v', '<Tab>rh', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'reset git hunk' })
      -- normal mode
      map('n', '<Tab>gr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
      map('n', '<Tab>gb', gitsigns.blame_line, { desc = 'git [b]lame line' })
      map('n', '<Tab>gd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
      map('n', '<Tab>gD', function()
        gitsigns.diffthis '@'
      end, { desc = 'git [D]iff against last commit' })
      -- Toggles
      map('n', '<Tab>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
      map('n', '<Tab>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
    end,
  },
}
