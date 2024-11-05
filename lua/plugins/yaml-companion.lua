return {
  "someone-stole-my-name/yaml-companion.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local lspconfig = require "lspconfig"
    local yaml_companion = require "yaml-companion"

    lspconfig.yamlls.setup(yaml_companion.setup {
      settings = {
        yaml = {
          schemaStore = {
            enable = true,
            url = "https://www.schemastore.org/api/json/catalog.json",
          },
          lineFoldingOnly = true, -- Explicitly set lineFoldingOnly here
        },
      },
    })
  end,
}
