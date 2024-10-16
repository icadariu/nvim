-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "regex",
        "lua",
        "bash",
        "diff",
        "make",
        "dockerfile",
        "terraform",
        "hcl",
        "helm",
        "tmux",
        "jq",
        "yaml",
      },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
      max_lines = 5,
    })
  end,
}
