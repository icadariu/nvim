vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })

--  See `:help vim.keymap.set()`
local vkms = vim.keymap.set

vkms("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

------------------------
-- Leader definitions --
------------------------
vkms("n", "<leader>qq", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })
vkms("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
vkms("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })
vkms("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy" })
vkms("n", "<leader>QQ", "<cmd>qa!<cr>", { desc = "Quit All" })
vkms("n", "<leader>qb", "<cmd>bd!<CR>", { desc = "Force Close Buffer" })
vkms("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
vkms("n", "<leader>ui", vim.show_pos, { desc = "Inspect current Position using Treesitter position" })
vkms("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })
vkms("n", "<leader>Y", [["+Y]], { desc = "Yank entire line to system clipboard" })
vkms("n", "<leader>tt", ":tab split<CR>", { desc = "Send current buffer to a new tab" })
-- Keybindings for selecting buffers using leader key
vkms("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "BufferLine - go to buffer 1", noremap = true, silent = true })
vkms("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "BufferLine - go to buffer 2", noremap = true, silent = true })
vkms("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "BufferLine - go to buffer 3", noremap = true, silent = true })
vkms("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "BufferLine - go to buffer 4", noremap = true, silent = true })
vkms("n", "<leader>0", "<Cmd>BufferLineGoToBuffer -1<CR>", { desc = "BufferLine - go to last buffer", noremap = true, silent = true })
vkms("n", "<leader>x", ":bd<CR>", { desc = "Close current buffer", noremap = true, silent = true })
vkms({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vkms({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overwriting register" })

-------------------------
-- Tab key definitions --
-------------------------
vkms("n", "<Tab>a", "zg", { desc = "Spell - Add word to exception list" })
vkms("n", "<Tab>s", "z=", { desc = "Spell - Suggest spelling corrections" })
vkms("n", "<Tab>sf", "1z=", { desc = "Spell - Use first correction" })
vkms("n", "<Tab>sn", "]s", { desc = "Spell - Go to next spelling issue" })
vkms("n", "<Tab>sp", "[s", { desc = "Spell - Go to previous spelling issue" })
vkms("n", "<Tab>m", ":MarksAdd<CR>", { desc = "Add a new mark" })
vkms("n", "<Tab>md", ":MarksDelete<CR>", { desc = "Delete mark on current line" })
vkms("n", "<Tab>mD", ":MarksClearBuf<CR>", { desc = "Delete all marks in current buffer" })
vkms("n", "<Tab>mn", ":MarksNext<CR>", { desc = "Jump to next mark" })
vkms("n", "<Tab>mp", ":MarksPrev<CR>", { desc = "Jump to previous mark" })
-- Useful to execute a line or file in lua. For line, remember that the line needs to have set
vkms("n", "<Tab>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vkms("n", "<Tab><Tab>x", "<cmd>source %<CR>", { desc = "Execute the current file" })
-- Toggle section
vkms("n", "<Tab>tc", _G.ToggleCursorColumn, { desc = "Toggle Cursor Column" })
vkms("n", "<Tab>tm", _G.ToggleMouse, { desc = "Toggle Mouse" })
vkms("n", "<Tab>ts", _G.toggle_spell_check, { desc = "Toggle grammar / spell check" })

--------------------------
-- Ctrl key definitions --
--------------------------
vkms("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page; keep the current line in center" })
vkms("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page; keep the current line in center" })
vkms("n", "<C-n>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Bufferline - go to the next buffer.", noremap = true, silent = true })
vkms("n", "<C-p>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Bufferline - go to the previous buffer.", noremap = true, silent = true })
-- Split navigation made easier with ctrl + hjkl
vkms("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vkms("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vkms("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vkms("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Regardless of the mode, use Ctrl + S to save the file!
vkms({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File using Ctrl + S" })

----------------------
--   Visual mode    --
----------------------
vkms("v", "<", "<gv", { desc = "Indent; Stay in indent mode" })
vkms("v", ">", ">gv", { desc = "Indent; Stay in indent mode" })
vkms("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vkms("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })
vkms("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

----------------------
--   Mix mappings   --
----------------------
-- These mappings control the size of splits (height/width)
vkms("n", "<A-Left>", "<c-w>5>", { desc = "Resize split Left" })
vkms("n", "<A-Right>", "<c-w>5<", { desc = "Resize split Right" })
vkms("n", "<A-Up>", "<C-W>+", { desc = "Resize split Up" })
vkms("n", "<A-Down>", "<C-W>-", { desc = "Resize split Down" })

vkms("i", "<A-h>", "<Left>", { desc = "Move cursor left", noremap = true, silent = true })
vkms("i", "<A-l>", "<Right>", { desc = "Move cursor right", noremap = true, silent = true })
vkms("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vkms("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
vkms("n", "==", "ggVG", { desc = "Select the entire file" })
vkms("n", "J", "mzJ`z", { desc = "Join lines and keep cursor at same position" })
vkms("n", "n", "nzzzv", { desc = "Next match; center the line; match is highlighted" })
vkms("n", "N", "Nzzzv", { desc = "Previous match; center the line; match is highlighted" })
vkms({ "n", "i" }, "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vkms({ "n", "i" }, "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vkms({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vkms({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Disable keys
vkms("n", "Q", "<nop>", { desc = "Disable Q, it usually triggers :Ex" })
vkms("n", "s", "<nop>", { desc = "Disable s, it's annoying", noremap = true })
------------------------
--    Diagnostic      --
------------------------
vkms("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vkms("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

vkms("n", "]d", diagnostic_goto(true), { desc = "Diagnostic - Next Diagnostic" })
vkms("n", "[d", diagnostic_goto(false), { desc = "Diagnostic - Prev Diagnostic" })
vkms("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Diagnostic - Next Error" })
vkms("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Diagnostic - Prev Error" })
vkms("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Diagnostic - Next Warning" })
vkms("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Diagnostic - Prev Warning" })

------------------------
--    Other stuff     --
------------------------
local utils = require "utils"
vkms("n", "<leader>ls", utils.list_snippets_for_current_filetype, { desc = "List available snippets for current filetype" })
