return {
  "mbbill/undotree",

  config = function()
    vim.keymap.set("n", "<Tab>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })
  end,
}
