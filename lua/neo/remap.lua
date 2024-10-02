vim.g.mapleader = " "
vim.g.maplocalleader = " "

--vim.keymap.set("n", "<leader>,f", ":StripWhitespace<CR>") -- Remove whitespaces
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")        -- This keymap clears the search
vim.keymap.set("n", "<leader>gff", ":!gofmt -w %<CR><CR>") -- Go fmt
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true }) -- save file in normal mode

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-j>", "<C-W><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-W><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-h>", "<C-W><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-W><C-l>", { desc = "Move focus to the right window" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")              -- Select code in visual mode and auto indent
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")              -- Select code in visual mode and auto indent

vim.keymap.set("n", "J", "mzJ`z")                         -- Join lines
vim.keymap.set("n", "<C-d>", "<C-d>zz")                   -- Scrol down half page but keep the current line in center
vim.keymap.set("n", "<C-u>", "<C-u>zz")                   -- Scrol up half page but keep the current line in center
vim.keymap.set("n", "n", "nzzzv")                         -- Jump to the next match, center the line and switch to visual mode
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>") -- Restart LSP

-- "cut" the visually selected text and paste it elsewhere, similar to the traditional cut-and-paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copies selected text(or current line) into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to system clipboard in normal/visual mode
vim.keymap.set("n", "<leader>Y", [["+Y]])          -- Yank the current line to system clipboard in normal mode

-- useful when you want to remove text entirely without cluttering your yank/delete history
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Exit insert mode using Ctrl+c or jj
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })

vim.keymap.set("n", "Q", "<nop>")                    -- Disable Q in normal mode since Q usually trigger :Ex
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- Trigger formatting providd by the LSP

vim.keymap.set("n", "<C-M-k>", "<cmd>cnext<CR>zz")     -- Jump to the next quick fix using Ctrl + Alt + J
vim.keymap.set("n", "<C-M-j>", "<cmd>cprev<CR>zz")     -- Jump to the next quick fix using Ctrl + Alt + J

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- Navigate to the next LSP diagnostic
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--[[
This keymap finds all occurrences of the word under your cursor and replaces each occurrence with itself,
but inserted at the beginning of its line. This can be useful for tasks like rearranging code elements
or quickly creating lists from scattered text.
--]]
--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>Cx", "<cmd>!chmod +x %<CR>", { silent = true }) -- Make current file executable

-- Creates a basic Go error handling structure, allowing you to quickly fill in the specific error handling logic within the block.
vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- Function to toggle cursorcolumn
function ToggleCursorColumn()
  vim.opt.cursorcolumn = not vim.opt.cursorcolumn:get()
end

-- Map a key (for example, <leader>cc) to toggle cursorcolumn
vim.api.nvim_set_keymap('n', '<leader>cc', ':lua ToggleCursorColumn()<CR>', { noremap = true, silent = true })

-- Set a keymap to open Telescope's keymaps search
vim.api.nvim_set_keymap('n', '<leader>km', ':Telescope keymaps<CR>', { noremap = true, silent = true })
