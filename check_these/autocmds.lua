-- [[ AUTOCOMMANDS ]]
-- see `:help lua-guide-autocommands`

local augroup = vim.api.nvim_create_augroup
local MyGroup = augroup('neo', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- refresh buffers when files change on disk
--autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
--  desc = "Refresh buffers when files change on disk",
--  group = augroup("refresh-on-save", { clear = true }),
--  pattern = "*",
--  callback = function()
--    vim.api.nvim_command("checktime")
--  end,
--})

vim.filetype.add({
  extension = {
    templ = 'templ',
  }
})

autocmd('TextYankPost', {
  group = yank_group,
  desc = "Highlight when copy text",
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd('LspAttach', {
  group = MyGroup,
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
