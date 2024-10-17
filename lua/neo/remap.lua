-- Keep things in one line
local vkm = vim.keymap.set

------------------------
-- Leader definitions --
------------------------
vkm("n", "<leader>bd", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })
vkm("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
vkm("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })
vkm("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })
vkm("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
vkm("n", "<leader>qb", "<cmd>bd!<CR>", { desc = "Force Close Buffer" })
vkm("n", "<leader>qq", ":qa!<CR>", { desc = "Quit file" })
vkm("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vkm("n", "<leader>Y", [["+Y]], { desc = "Yank the current line to system clipboard in normal mode" })
vkm("n", "<leader>zp", "[s", { desc = "Go to previous spelling issue" })
vkm("n", "<leader>f", vim.lsp.buf.format, { desc = "Trigger formatting provided by the LSP" })

-- Normal & Visual mode
vkm({ "n", "v" }, "<leader>d", [["_d]], { desc = "Remove without cluttering yank/delete history" })
vkm({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard in n/v mode" })

-- Normal, Insert, Visual
vkm({ "n", "i", "v" }, "<C-s>", "<cmd> w <CR>", { desc = "Save file using Ctrl+s" })

-------------------------
-- Tab key definitions --
-------------------------
vkm("n", "<Tab>a", "zg", { desc = "Spell - Add word to exception list" })
vkm("n", "<Tab>s", "z=", { desc = "Spell - Suggest spelling corrections" })
vkm("n", "<Tab>sn", "]s", { desc = "Spell - Go to next spelling issue" })
vkm("n", "<Tab>sp", "[s", { desc = "Spell - Go to previous spelling issue" })

-- Marks.nvim key mappings
vkm("n", "<Tab>m", ":MarksAdd<CR>", { desc = "Add a new mark" })
vkm("n", "<Tab>md", ":MarksDelete<CR>", { desc = "Delete mark on current line" })
vkm("n", "<Tab>mD", ":MarksClearBuf<CR>", { desc = "Delete all marks in current buffer" })
vkm("n", "<Tab>mn", ":MarksNext<CR>", { desc = "Jump to next mark" })
vkm("n", "<Tab>mp", ":MarksPrev<CR>", { desc = "Jump to previous mark" })
vkm("n", "<Tab>gb", ":Gitsigns blame_line<CR>", { desc = "git [b]lame line" })

vkm("n", "<Tab>zig", "<cmd>LspRestart<cr>")

-- Toggle section
vkm("n", "<Tab>tc", _G.ToggleCursorColumn, { desc = "Toggle Cursor Column" })
vkm("n", "<Tab>tm", _G.ToggleMouse, { desc = "Toggle Mouse" })
vkm("n", "<Tab>ts", _G.toggle_spell_check, { desc = "Toggle grammar / spell check" })

--------------------------
-- Ctrl key definitions --
--------------------------
vkm("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page; keep the current line in center" })
vkm("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page; keep the current line in center" })
vkm("n", "<C-h>", "<C-W><C-h>", { desc = "Move focus left" })
vkm("n", "<C-j>", "<C-W><C-j>", { desc = "Move focus down" })
vkm("n", "<C-k>", "<C-W><C-k>", { desc = "Move focus up" })
vkm("n", "<C-l>", "<C-W><C-l>", { desc = "Move focus right" })
vkm("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Split Left" })
vkm("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim-Tree" })
vkm("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Split Right" })
vkm("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Split Down" })
vkm("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Split Up" })

----------------------
-- General mappings --
----------------------
vkm("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
vkm("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })
vkm("n", "<C-M-j>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
vkm("n", "<C-M-k>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vkm("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears the search" })
vkm("n", "==", "ggVG", { desc = "Select the entire file" })
vkm("n", "J", "mzJ`z", { desc = "Join lines and keep cursor at same position" })
vkm("n", "n", "nzzzv", { desc = "Next match; center the line; match is highlighted" })
vkm("n", "N", "Nzzzv", { desc = "Previous match; center the line; match is highlighted" })
vkm("n", "Q", "<nop>", { desc = "Disable Q, it usually triggers :Ex" })

-- Visual mode mappings no key replaced
vkm("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })
vkm("v", "<", "<gv", { desc = "Stay in indent mode" })
vkm("v", ">", ">gv", { desc = "Stay in indent mode" })
vkm("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vkm("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })
vkm("v", "p", '"_dP', { desc = "Paste without overwriting register" })

-- -- nvim-ufo key mappings
-- vkm("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
-- vkm("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
-- vkm("n", "za", "za", { desc = "Toggle fold" })
