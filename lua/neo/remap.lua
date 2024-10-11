-- Easier to read
local vkm = vim.keymap

-- Exit insert mode without Escape
vkm.set("i", "<C-c>", "<Esc>")
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })

-- Select all
vkm.set("n", "==", "ggVG", { desc = "Select the entire file" })

-- Split navigation
--  Use CTRL+<hjkl> to switch between windows. Check `:help wincmd` for more.
vkm.set("n", "<C-j>", "<C-W><C-j>", { desc = "Move focus down" })
vkm.set("n", "<C-k>", "<C-W><C-k>", { desc = "Move focus up" })
vkm.set("n", "<C-h>", "<C-W><C-h>", { desc = "Move focus left" })
vkm.set("n", "<C-l>", "<C-W><C-l>", { desc = "Move focus right" })

-- Keep window centered when navigate up down
vkm.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor at same position" })
vkm.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page ; keep the current line in center" })
vkm.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page ; keep the current line in center" })
vkm.set("n", "n", "nzzzv", { desc = "Next match; center the line; match is highlighted" })
vkm.set("n", "N", "Nzzzv", { desc = "Previous match; center the line; match is highlighted" })

-- Paste without overwriting register
vkm.set("v", "p", '"_dP')

-- Copy selected text(or current line) into the system clipboard
vkm.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard in n/v mode" })
vkm.set("n", "<leader>Y", [["+Y]], { desc = "Yank the current line to system clipboard in normal mode" })

-- useful when you want to remove text entirely without cluttering your yank/delete history
vkm.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disable Q, it usually trigger :Ex
vkm.set("n", "Q", "<nop>")

-- Buffer Close
vkm.set("n", "<leader>q", "<cmd>bd!<CR>", { desc = "Force Close Buffer" })
vkm.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
vkm.set("n", "<C-M-k>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" }) -- Jump to the next quick fix using Ctrl + Alt + J
vkm.set("n", "<C-M-j>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
vkm.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
vkm.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- Replace word under cursor across entire buffer
vkm.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

vkm.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Trigger formatting providd by the LSP" })

-- Execute stuff
-- Creates a basic Go error handling structure, allowing you to quickly
-- fill in the specific error handling logic within the block.
vkm.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
  { desc = "Create basic Go error handling structure" }
)

vkm.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears the search" })
vkm.set("n", "<leader>gff", ":!gofmt -w %<CR><CR>", { desc = "Run go fmt" })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })
vkm.set("n", "<leader>Cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Telescope's keymaps search
vim.api.nvim_set_keymap('n', '<leader>km', ':Telescope keymaps<CR>',
  { noremap = true, silent = true, desc = "Telescope keymaps" })

-- Copy file paths
vkm.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
vkm.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Resize with arrows
vkm.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Split Down" })
vkm.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Split Up" })
vkm.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Split Down" })
vkm.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Split Up" })

-- Visual --
-- Stay in indent mode
vkm.set("v", "<", "<gv")
vkm.set("v", ">", ">gv")

-- Move block
vkm.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vkm.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
vkm.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })
