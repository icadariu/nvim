--- Lua function used to inspect & debug Lua tables or variables
--[[
    If you call P(my_table) in your Neovim config, it will print a nicely formatted representation of my_table and return the table unchanged.
    This is often used as a shorthand to debug variables in Neovim when writing Lua configurations or plugins.
--]]
P = function(v)
  print(vim.inspect(v))
  return v
end

-- Toggle cursor column
function ToggleCursorColumn()
  vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
end

vim.api.nvim_set_keymap('n', '<leader>cc', ':lua ToggleCursorColumn()<CR>',
  { noremap = true, silent = true, desc = "Toggle Cursor Column" })

-- Toggle mouse
function ToggleMouse()
  if vim.o.mouse == 'a' then
    vim.o.mouse = ''
    print("Mouse disabled")
  else
    vim.o.mouse = 'a'
    print("Mouse enabled")
  end
end

------------------
-- Autocommands --
------------------
local augroup = vim.api.nvim_create_augroup
local NeoGroup = augroup('Neo', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- makrdown filetype changes indentation.
autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_set_keymap('n', '<leader>m', ':lua ToggleMouse()<CR>',
  { noremap = true, silent = true, desc = "Toggle mouse" })

vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- Highlight yanks
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 200,
    })
  end,
})

autocmd('LspAttach', {
  group = NeoGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  end
})
