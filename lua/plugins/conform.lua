return {
 "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
     format_on_save = {
      timeout_ms = 500,   -- Timeout for formatting
      lsp_fallback = true -- Use LSP formatting if no formatter is found
     },
      formatters_by_ft = {
        lua = { "stylua" },
        json = { { "prettierd", "prettier", stop_after_first = true } },
        markdown = { { "prettierd", "prettier", stop_after_first = true } },
        bash = { "beautysh" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        sh = { "shellcheck" },
        go = { "gofmt" },
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
