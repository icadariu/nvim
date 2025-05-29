# Things worth mentioning

- With an update from May 2025, it seems issues started to occur with nvim-lspconfig after mason upgrade. Check [this](https://github.com/LazyVim/LazyVim/issues/6039)
  - Workaround

    ```txt
    Create a file (for example): ~/.config/nvim/lua/plugins/mason-workaround.lua and add this to it:

    return {
      { "mason-org/mason.nvim", version = "^1.0.0" },
      { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
    }
    ```
