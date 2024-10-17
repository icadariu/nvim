P = function(v)
  print(vim.inspect(v))
  return v
end

-- Define a global function for toggling spell check
_G.toggle_spell_check = function()
  vim.opt_local.spell = not vim.opt_local.spell:get()

  if vim.opt_local.spell:get() then
    vim.opt_local.spelllang = { "en_us" }
    -- Apply 'SpellBad' highlight group to make misspelled words more visible (e.g., red with underlining)
    vim.cmd([[highlight SpellBad guifg=#FF0000 gui=undercurl]])
    print("Spell check: On")
  else
    -- Clear 'SpellBad' highlight group when spell check is off to remove the red color
    vim.cmd([[highlight clear SpellBad]])
    -- Optionally, reset 'SpellBad' to a neutral or invisible state when spell check is off
    vim.cmd([[highlight SpellBad guifg=None gui=None]])
    print("Spell check: Off")
  end
end

-- Global function to toggle cursor column
_G.ToggleCursorColumn = function()
  vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
end

-- Global function to toggle mouse
_G.ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.o.mouse = ""
    print("Mouse disabled")
  else
    vim.o.mouse = "a"
    print("Mouse enabled")
  end
end
------------------
-- Autocommands --
------------------
local augroup = vim.api.nvim_create_augroup
local NeoGroup = augroup("Neo", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- Set autocmd to enable spell check and configure buffer options for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
  desc = "Enable spell check and configure indent settings for Markdown and text files",
})

-- Highlight yanks
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

autocmd("LspAttach", {
  group = NeoGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>vca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
  end,
})
