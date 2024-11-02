vim.opt_local.expandtab = false

vim.keymap.set("n", "<space>td", function()
  require("dap-go").debug_test()
end, { desc = "Go debug test", buffer = 0 })
