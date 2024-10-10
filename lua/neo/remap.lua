-- Execute stuff
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears the search" })
vim.keymap.set("n", "<leader>gff", ":!gofmt -w %<CR><CR>", { desc = "Run go fmt" })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>Cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Exit insert mode without Escape
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })

-- Select all
vim.keymap.set("n", "==", "ggVG", { desc = "Select the entire file" })

-- Split navigation
--  Use CTRL+<hjkl> to switch between windows. Check `:help wincmd` for more.
vim.keymap.set("n", "<C-j>", "<C-W><C-j>", { desc = "Move focus down" })
vim.keymap.set("n", "<C-k>", "<C-W><C-k>", { desc = "Move focus up" })
vim.keymap.set("n", "<C-h>", "<C-W><C-h>", { desc = "Move focus left" })
vim.keymap.set("n", "<C-l>", "<C-W><C-l>", { desc = "Move focus right" })

-- Keep window centered when navigate up down
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor at same position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page ; keep the current line in center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page ; keep the current line in center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match; center the line; match is highlighted" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous match; center the line; match is highlighted" })

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- Copy selected text(or current line) into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard in n/v mode" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank the current line to system clipboard in normal mode" })

-- useful when you want to remove text entirely without cluttering your yank/delete history
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disable Q, it usually trigger :Ex
vim.keymap.set("n", "Q", "<nop>")

-- Buffer Close
vim.keymap.set("n", "<leader>q", "<cmd>bd!<CR>", { desc = "Force Close Buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
vim.keymap.set("n", "<C-M-k>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" }) -- Jump to the next quick fix using Ctrl + Alt + J
vim.keymap.set("n", "<C-M-j>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- Replace word under cursor across entire buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })



vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Trigger formatting providd by the LSP" })

-- Creates a basic Go error handling structure, allowing you to quickly fill in the specific error handling logic within the block.
vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
  { desc = "Create basic Go error handling structure" }
)

-- Telescope's keymaps search
vim.api.nvim_set_keymap('n', '<leader>km', ':Telescope keymaps<CR>',
  { noremap = true, silent = true, desc = "Telescope keymaps" })

-- Copy file paths
vim.keymap.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Resize with arrows
vim.keymap.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Split Down" })
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Split Up" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Split Down" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Split Up" })

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
vim.keymap.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })


-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = "custom_buffer",
  pattern  = "*",
  callback = function() vim.highlight.on_yank { timeout = 200 } end
})

-- makrdown filetype changes indentation. Fix it usig this
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})
