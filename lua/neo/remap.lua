-- Easier to read
local vkm = vim.keymap

-- Leader keys
vim.api.nvim_set_keymap('n', '<leader>km', ':Telescope keymaps<CR>',
  { noremap = true, silent = true, desc = "Telescope keymaps" })
vim.api.nvim_set_keymap('n', '<leader>qq', ':qa!<CR>', { noremap = true, silent = true, desc = "Quit file" })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })
vkm.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
  { desc = "Create basic Go error handling structure" })

vkm.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
vkm.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })
vkm.set("n", "<leader>Cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
vkm.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Trigger formatting providd by the LSP" })
vkm.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })
vkm.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
vkm.set("n", "<leader>qb", "<cmd>bd!<CR>", { desc = "Force Close Buffer" })
vkm.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
vkm.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })
vkm.set("n", "<leader>Y", [["+Y]], { desc = "Yank the current line to system clipboard in normal mode" })
vkm.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Remove without cluttering yank/delete history" })
vkm.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard in n/v mode" })

-- Normal mode MIX
vkm.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page ; keep the current line in center" })
vkm.set("n", "<C-h>", "<C-W><C-h>", { desc = "Move focus left" })
vkm.set("n", "<C-j>", "<C-W><C-j>", { desc = "Move focus down" })
vkm.set("n", "<C-k>", "<C-W><C-k>", { desc = "Move focus up" })
vkm.set("n", "<C-l>", "<C-W><C-l>", { desc = "Move focus right" })
vkm.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Split Down" })
vkm.set("n", "<C-M-j>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
vkm.set("n", "<C-M-k>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" }) -- Jump to the next quick fix using Ctrl + Alt + J
vkm.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Split Up" })
vkm.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Split Down" })
vkm.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Split Up" })
vkm.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page ; keep the current line in center" })
vkm.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears the search" })
vkm.set("n", "<leader>gff", ":!gofmt -w %<CR><CR>", { desc = "Run go fmt" })
vkm.set("n", "==", "ggVG", { desc = "Select the entire file" })
vkm.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor at same position" })
vkm.set("n", "n", "nzzzv", { desc = "Next match; center the line; match is highlighted" })
vkm.set("n", "N", "Nzzzv", { desc = "Previous match; center the line; match is highlighted" })
vkm.set("n", "Q", "<nop>", { desc = "Disable Q, it usually trigger :Ex" })

-- Visual mode MIX
vkm.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })
vkm.set("v", "<", "<gv", { desc = "Stay in indent mode" })
vkm.set("v", ">", ">gv", { desc = "Stay in indent mode" })
vkm.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vkm.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })
vkm.set("v", "p", '"_dP', { desc = "Paste without overwriting register" })

-- Insert mode
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })
vkm.set("i", "<C-c>", "<Esc>")
