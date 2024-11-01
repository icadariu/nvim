return {
  -- Linting
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      -- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
      lint.linters_by_ft = {
        ansiblelint = { "ansible_lint" },
        bash = { "bash" },
        dockerfile = { "hadolint" },
        markdown = { 'markdownlint' },
        markdownlint = { "markdownlint" },
        terraform = { "tflint" },
        tflint = { "tflint" },
        tfsec = { "tfsec" },
        yq = { "yq" },
        zsh = { "zsh" },
      }

      -- Using local lint, allow other plugins to add linters to require('lint').linters_by_ft.
      -- To disable the default linters set their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil

      -- Create autocommand which carries out the actual linting on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
        vim.keymap.set("n", "<leader>ll", function()
          lint.try_lint()
        end, { desc = "Trigger linting for current file" })
      })
    end,
  },
}
