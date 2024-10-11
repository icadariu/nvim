-- Function to toggle cursor column
function ToggleCursorColumn()
  vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
end

vim.api.nvim_set_keymap('n', '<leader>cc', ':lua ToggleCursorColumn()<CR>',
  { noremap = true, silent = true, desc = "Toggle Cursor Column" })

-- toggle mouse
function ToggleMouse()
  if vim.o.mouse == 'a' then
    vim.o.mouse = ''
    print("Mouse disabled")
  else
    vim.o.mouse = 'a'
    print("Mouse enabled")
  end
end

vim.api.nvim_set_keymap('n', '<leader>m', ':lua ToggleMouse()<CR>',
  { noremap = true, silent = true, desc = "Toggle mouse" })
