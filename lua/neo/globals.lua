--- Lua function used to inspect & debug Lua tables or variables
--[[
    If you call P(my_table) in your Neovim config, it will print a nicely formatted representation of my_table and return the table unchanged.
    This is often used as a shorthand to debug variables in Neovim when writing Lua configurations or plugins.
--]]
P = function(v)
  print(vim.inspect(v))
  return v
end

-- Function to toggle cursor column
function ToggleCursorColumn()
  vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
end

-- Toggle cursorcolumn
vim.api.nvim_set_keymap('n', '<leader>cc', ':lua ToggleCursorColumn()<CR>',
  { noremap = true, silent = true, desc = "Toggle Cursor Column" })
