local km = vim.keymap

-- Execute stuff
km.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears the search" })
km.set("n", "<leader>gff", ":!gofmt -w %<CR><CR>", { desc = "Run go fmt" })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })
km.set("n", "<leader>Cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Exit insert mode without Escape
km.set("i", "<C-c>", "<Esc>")
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })

-- Select all
km.set("n", "==", "ggVG", { desc = "Select the entire file" })

-- Split navigation
--  Use CTRL+<hjkl> to switch between windows. Check `:help wincmd` for more.
km.set("n", "<C-j>", "<C-W><C-j>", { desc = "Move focus down" })
km.set("n", "<C-k>", "<C-W><C-k>", { desc = "Move focus up" })
km.set("n", "<C-h>", "<C-W><C-h>", { desc = "Move focus left" })
km.set("n", "<C-l>", "<C-W><C-l>", { desc = "Move focus right" })

-- Keep window centered when navigate up down
km.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor at same position" })
km.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page ; keep the current line in center" })
km.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page ; keep the current line in center" })
km.set("n", "n", "nzzzv", { desc = "Next match; center the line; match is highlighted" })
km.set("n", "N", "Nzzzv", { desc = "Previous match; center the line; match is highlighted" })

-- Paste without overwriting register
km.set("v", "p", '"_dP')

-- Copy selected text(or current line) into the system clipboard
km.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard in n/v mode" })
km.set("n", "<leader>Y", [["+Y]], { desc = "Yank the current line to system clipboard in normal mode" })

-- useful when you want to remove text entirely without cluttering your yank/delete history
km.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disable Q, it usually trigger :Ex
km.set("n", "Q", "<nop>")

-- Buffer Close
km.set("n", "<leader>q", "<cmd>bd!<CR>", { desc = "Force Close Buffer" })
km.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
km.set("n", "<C-M-k>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" }) -- Jump to the next quick fix using Ctrl + Alt + J
km.set("n", "<C-M-j>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
km.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
km.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- Replace word under cursor across entire buffer
km.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })



km.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Trigger formatting providd by the LSP" })

-- Creates a basic Go error handling structure, allowing you to quickly fill in the specific error handling logic within the block.
km.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
  { desc = "Create basic Go error handling structure" }
)

-- Telescope's keymaps search
vim.api.nvim_set_keymap('n', '<leader>km', ':Telescope keymaps<CR>',
  { noremap = true, silent = true, desc = "Telescope keymaps" })

-- Copy file paths
km.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
km.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Resize with arrows
km.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Split Down" })
km.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Split Up" })
km.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Split Down" })
km.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Split Up" })

-- Visual --
-- Stay in indent mode
km.set("v", "<", "<gv")
km.set("v", ">", ">gv")

-- Move block
km.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
km.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
km.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })


-- -- Autocommands
-- vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- -- Highlight yanks
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group    = "custom_buffer",
--   pattern  = "*",
--   callback = function() vim.highlight.on_yank { timeout = 200 } end
-- })

-- -- makrdown filetype changes indentation. Fix it usig this
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.bo.shiftwidth = 2
--     vim.bo.tabstop = 2
--     vim.bo.softtabstop = 2
--     vim.bo.expandtab = true
--   end,
-- })
