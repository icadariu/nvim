return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Set up Mason before setting up mason-tool-installer
    require("mason").setup()

    local mason_tool_installer = require "mason-tool-installer"

    -- TODO: Fix Mason not installing these
    mason_tool_installer.setup {
      ensure_installed = {
        "beautysh",
        "buf",
        "delve", -- debugger for Go
        "gopls",
        "helm-ls",
        "json-lsp",
        "markdownlint",
        "prettier",
        "shellcheck",
        "stylua",
        "terraform-ls",
        "yaml-language-server",
        "dockerfile-language-server",
        "bash-language-server",
        "trivy",
      },
      -- Optional configurations
      auto_update = false,
      run_on_start = true,
      start_delay = 3000, -- 3-second delay
    }
  end,
}
