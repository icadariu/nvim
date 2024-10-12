---------------------------------------------
-- Helper functions to improve readability --
---------------------------------------------
-- Local Function for Leader-based mappings
local function map_leader(mode, key, command, description)
  vim.keymap.set(mode, "<leader>" .. key, command, { noremap = true, silent = true, desc = description })
end

-- Local Function for Control-based mappings
local function map_ctrl(mode, key, command, description)
  vim.keymap.set(mode, "<C-" .. key .. ">", command, { noremap = true, silent = true, desc = description })
end

-- Local Function for General mappings
local function map_general(mode, key, command, description)
  vim.keymap.set(mode, key, command, { noremap = true, silent = true, desc = description })
end

-- Local Function for Tab-based mappings
local function map_tab(mode, key, command, description)
  vim.keymap.set(mode, "<Tab>" .. key, command, { noremap = true, silent = true, desc = description })
end

---------------------------------------------
-- <Leader> + keys
map_leader("n", ".", ":Telescope oldfiles<CR>", "Telescope recent files")
map_leader("n", "km", ":Telescope keymaps<CR>", "Telescope keymaps")
map_leader("n", "qq", ":qa!<CR>", "Quit file")
map_leader("n", "w", ":w<CR>", "Save file")
map_leader("n", "ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", "Create basic Go error handling structure")

map_leader("n", "tc", _G.ToggleCursorColumn, "Toggle Cursor Column")
map_leader("n", "tm", _G.ToggleMouse, "Toggle Mouse")
map_leader("n", "ts", _G.toggle_spell_check, "Toggle grammar / spell check")
map_leader("n", "sa", "zg", "Add word to exception list")
map_leader("n", "sf", "z=", "Suggest spelling corrections")
map_leader("n", "zn", "]s", "Go to next spelling issue")

-- Jump to the previous spelling issue
map_leader("n", "zp", "[s", "Go to previous spelling issue")
map_leader("n", "bd", "<cmd>bp|bd #<CR>", "Close Buffer; Retain Split")
map_leader("n", "cf", '<cmd>let @+ = expand("%")<CR>', "Copy File Name")
map_leader("n", "cp", '<cmd>let @+ = expand("%:p")<CR>', "Copy File Path")
map_leader("n", "Cx", "<cmd>!chmod +x %<CR>", "Make file executable")
map_leader("n", "f", vim.lsp.buf.format, "Trigger formatting provided by the LSP")
map_leader("n", "j", "<cmd>lprev<CR>zz", "Backward location list")
map_leader("n", "k", "<cmd>lnext<CR>zz", "Forward location list")
map_leader("n", "qb", "<cmd>bd!<CR>", "Force Close Buffer")
map_leader("n", "s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace word under cursor")
map_leader("n", "Y", [["+Y]], "Yank the current line to system clipboard in normal mode")
map_leader("n", "gff", ":!gofmt -w %<CR><CR>", "Run go fmt")

-- <Leader> + keys in both normal and visual mode
map_leader({ "n", "v" }, "d", [["_d]], "Remove without cluttering yank/delete history")
map_leader({ "n", "v" }, "y", [["+y]], "Yank to system clipboard in n/v mode")

-- Normal mode Control + keys
map_ctrl("n", "d", "<C-d>zz", "Scroll down half page; keep the current line in center")
map_ctrl("n", "h", "<C-W><C-h>", "Move focus left")
map_ctrl("n", "j", "<C-W><C-j>", "Move focus down")
map_ctrl("n", "k", "<C-W><C-k>", "Move focus up")
map_ctrl("n", "l", "<C-W><C-l>", "Move focus right")
map_ctrl("n", "Left", ":vertical resize -2<CR>", "Resize Split Left")
map_ctrl("n", "Right", ":vertical resize +2<CR>", "Resize Split Right")
map_ctrl("n", "S-Down", ":resize +2<CR>", "Resize Split Down")
map_ctrl("n", "S-Up", ":resize -2<CR>", "Resize Split Up")
map_ctrl("n", "u", "<C-u>zz", "Scroll up half page; keep the current line in center")

-- General mappings no key replaced
map_general("n", "<A-j>", ":m .+1<CR>==", "Move current line down")
map_general("n", "<A-k>", ":m .-2<CR>==", "Move current line up")
map_general("n", "<C-M-j>", "<cmd>cprev<CR>zz", "Backward qfixlist")
map_general("n", "<C-M-k>", "<cmd>cnext<CR>zz", "Forward qfixlist")
map_general("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clears the search")
map_general("n", "==", "ggVG", "Select the entire file")
map_general("n", "J", "mzJ`z", "Join lines and keep cursor at same position")
map_general("n", "n", "nzzzv", "Next match; center the line; match is highlighted")
map_general("n", "N", "Nzzzv", "Previous match; center the line; match is highlighted")
map_general("n", "Q", "<nop>", "Disable Q, it usually triggers :Ex")

-- Visual mode mappings no key replaced
map_general("v", "//", 'y/<C-R>"<CR>', "Search for highlighted text")
map_general("v", "<", "<gv", "Stay in indent mode")
map_general("v", ">", ">gv", "Stay in indent mode")
map_general("v", "J", ":m '>+1<CR>gv=gv", "Move Block Down")
map_general("v", "K", ":m '<-2<CR>gv=gv", "Move Block Up")
map_general("v", "p", '"_dP', "Paste without overwriting register")

-- Insert mode transition to command mode.
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })

-- Tab-based spelling key mappings
map_tab("n", "a", "zg", "Spell - Add word to exception list")
map_tab("n", "s", "z=", "Spell - Suggest spelling corrections")
map_tab("n", "n", "]s", "Spell - Go to next spelling issue")
map_tab("n", "p", "[s", "Spell - Go to previous spelling issue")
