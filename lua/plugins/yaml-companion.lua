-- yaml_companion.lua (or wherever you configure yaml-companion specifically)
return {
  "someone-stole-my-name/yaml-companion.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local lspconfig = require "lspconfig"
    local yaml_companion = require "yaml-companion"

    -- Define enhanced capabilities to support line folding
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true, -- Specify folding capability here
    }

    -- Define YAML Companion setup with custom schemas and settings
    local cfg = yaml_companion.setup {
      schemas = {
        {
          name = "Flux GitRepository",
          uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json",
        },
      },
      lspconfig = {
        capabilities = capabilities, -- Add capabilities here
        settings = {
          yaml = {
            validate = true,
            schemaStore = {
              enable = true,
              url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
            },
          },
        },
      },
    }

    -- Apply configuration to yamlls through lspconfig
    lspconfig.yamlls.setup(cfg)
    -- :Telescope yaml_schema
    require("telescope").load_extension "yaml_schema"
  end,
}
