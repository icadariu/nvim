return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason_tool_installer = require("mason-tool-installer")

    mason_tool_installer.setup({
      -- https://mason-registry.dev/registry/list
      ensure_installed = {
        "beautysh",
        "buf",
        "delve", -- debugger for go
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
        "trivy",
      },
    })
  end,
}
