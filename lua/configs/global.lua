-- Define a global function for toggling spell check
_G.toggle_spell_check = function()
  vim.opt_local.spell = not vim.opt_local.spell:get()

  if vim.opt_local.spell:get() then
    vim.opt_local.spelllang = { "en_us" }
    -- Apply 'SpellBad' highlight group to make misspelled words more visible (e.g., red with underlining)
    vim.cmd [[highlight SpellBad guifg=#FF0000 gui=undercurl]]
    print "Spell check: On"
  else
    -- Clear 'SpellBad' highlight group when spell check is off to remove the red color
    vim.cmd [[highlight clear SpellBad]]
    -- Optionally, reset 'SpellBad' to a neutral or invisible state when spell check is off
    vim.cmd [[highlight SpellBad guifg=None gui=None]]
    print "Spell check: Off"
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
    print "Mouse disabled"
  else
    vim.o.mouse = "a"
    print "Mouse enabled"
  end
end

-- floating terminal
function _G.open_floating_terminal()
  print "Creating buffer..."
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
  print "Opening window..."
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    row = math.floor(vim.o.lines * 0.1),
    col = math.floor(vim.o.columns * 0.1),
    style = "minimal",
    border = "rounded",
  })
  print "Opening terminal..."
  vim.fn.termopen "bash" -- Replace "bash" with your shell if needed
  vim.cmd "startinsert" -- Start in insert mode
end
