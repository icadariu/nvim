-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local vkms = vim.keymap.set

-- Enter normal mode using jj
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { desc = 'Exit from insert mode', noremap = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vkms('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
vkms('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

vkms('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
vkms('n', ']d', diagnostic_goto(true), { desc = 'Diagnostic - Next Diagnostic' })
vkms('n', '[d', diagnostic_goto(false), { desc = 'Diagnostic - Prev Diagnostic' })
vkms('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Diagnostic - Next Error' })
vkms('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Diagnostic - Prev Error' })
vkms('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Diagnostic - Next Warning' })
vkms('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Diagnostic - Prev Warning' })

-- quit
vkms('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- Inspect current position or Treesitter position
vkms('n', '<leader>ui', vim.show_pos, { desc = 'Inspect current Position using Treesitter' })
vkms('n', '<leader>uI', '<cmd>InspectTree<cr>', { desc = 'Inspect Tree' })

-- lazy
vkms('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own vkmsping
-- or just use <C-\><C-n> to exit terminal mode
vkms('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- better up/down
vkms({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vkms({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vkms({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
vkms({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
vkms('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vkms('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vkms('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })
vkms('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })

-- Move Lines
vkms('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vkms('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vkms('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vkms('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vkms('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vkms('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- save file using Ctrl - s
vkms({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- better indenting
vkms('v', '<', '<gv')
vkms('v', '>', '>gv')

-- quickfix using [q, [q
vkms('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
vkms('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

-- Add keys from diffrent config
-- Move left/right in Insert mode
vkms('i', '<A-h>', '<Left>', { noremap = true, silent = true })
vkms('i', '<A-l>', '<Right>', { noremap = true, silent = true })
vkms('n', '==', 'ggVG', { desc = 'Select the entire file' })
vkms('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor at same position' })
vkms('n', 'N', 'Nzzzv', { desc = 'Previous match; center the line; match is highlighted' })
vkms('n', 'Q', '<nop>', { desc = 'Disable Q, it usually triggers :Ex' })
vkms('n', 'n', 'nzzzv', { desc = 'Next match; center the line; match is highlighted' })

-- Visual mode
vkms('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Block Down' })
vkms('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Block Up' })
vkms('v', '//', 'y/<C-R>"<CR>', { desc = 'Search for highlighted text' })
-------------------------
-- Tab / ctrl key definitions --
-------------------------
vkms('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half page; keep the current line in center' })
vkms('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half page; keep the current line in center' })
-- vkms("n", "<Tab>a", "zg", { desc = "Spell - Add word to exception list" })
-- vkms("n", "<Tab>sf", "1z=", { desc = "Spell - Use first correction" })
-- vkms("n", "<Tab>s", "z=", { desc = "Spell - Suggest spelling corrections" })
-- vkms("n", "<Tab>tc", _G.ToggleCursorColumn, { desc = "Toggle Cursor Column" })
-- vkms("n", "<Tab>ts", _G.toggle_spell_check, { desc = "Toggle grammar / spell check" })
