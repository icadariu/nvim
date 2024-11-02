return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",

  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      stop_after_first = true,
      format_on_save = {
        timeout_ms = 500,    -- Timeout for formatting
        lsp_fallback = true, -- Use LSP formatting if no formatter is found
      },
      formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "markdownlint" },
        bash = { "beautysh" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        sh = { "shellcheck" },
        go = { "gofmt" },
        json = { "prettierd", "prettier" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
