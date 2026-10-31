-- lua/plugins/conform.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format { async = true }
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(buf)
        if vim.g.disable_autoformat or vim.b[buf].disable_autoformat then
          return
        end
        -- do not autoformat zsh
        if vim.bo[buf].filetype == "zsh" then
          return
        end
        return { timeout_ms = 1500, lsp_format = "never" }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "yamlfmt", "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", "markdownlint", stop_after_first = true },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = {}, -- no formatter
        terraform = vim.fn.executable "terraform" == 1 and { "terraform_fmt" } or nil,
      },
      formatters = {
        yamlfmt = {
          -- K8s-friendly: 2-space indent, preserve comments.
          -- yamlfmt strips a leading `---` unless include_document_start is set, and setting it
          -- always adds one, so only set it when the file already starts with `---`.
          prepend_args = function(_, ctx)
            local opts = "indent=2,retain_line_breaks=true,scan_folded_as_literal=true"
            if (vim.api.nvim_buf_get_lines(ctx.buf, 0, 1, false)[1] or ""):match "^%-%-%-%s*$" then
              opts = opts .. ",include_document_start=true"
            end
            return { "-formatter", opts }
          end,
        },
        -- optional: configure shfmt (uncomment to force 2-space indent)
        -- shfmt = {
        --   prepend_args = { "-i", "2" }, -- 2 spaces per indent
        -- },
      },
    },
  },
}
